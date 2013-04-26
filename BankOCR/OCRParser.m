
#import "OCRParser.h"
#import "OCRDigit.h"

@implementation OCRParser

-(NSArray *)digitsFromArrayOfStrings:(NSArray *)strings {

	NSArray *digits = @[];

	if (strings.count != 3) {
		return digits;
	}

	NSArray *mutableStrings = [self mutableStringsFromStrings: strings];

	__block BOOL isValid = YES;
	
	while (isValid) {
		
		__block OCRDigit *digit = [OCRDigit new];
		
		[mutableStrings enumerateObjectsUsingBlock:^(NSMutableString *string, NSUInteger row, BOOL *stop) {
			
			if (string.length < 3) {
				*stop = YES;
				isValid = NO;
				return;
			}
			
			for (int col=0; col < 3; col++) {
				
				unichar character = [string characterAtIndex:col];
				
				[digit setSymbol:character atRow:row column:col];
				
			}
			
			[string deleteCharactersInRange:NSMakeRange(0, 3)];
		}];
		
		if (isValid) {
			digits = [digits arrayByAddingObject:digit];
		}
	}
	
	return digits;
}

-(NSArray *)mutableStringsFromStrings: (NSArray *) strings {
	__block NSArray *mutableStrings = @[];
	[strings enumerateObjectsUsingBlock:^(NSString *string, NSUInteger idx, BOOL *stop) {
		
		mutableStrings = [mutableStrings arrayByAddingObject:[string mutableCopy]];
		
	}];
	
	return mutableStrings;
}

@end