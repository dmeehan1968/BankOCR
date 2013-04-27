
#import "OCREntry.h"

@interface OCREntry ()

@property (strong) NSArray *strings;
@property (weak) id<OCRParser> parser;
@property (strong) NSArray *digits;

@end

@implementation OCREntry

-(id)initWithStrings:(NSArray *)strings andParser:(id<OCRParser>)parser {
	
	if (self = [super init]) {

		_strings = strings;
		_parser = parser;
		_digits = nil;
		_validatesCheckDigit = YES;
		
	}
	
	return self;
}

-(BOOL)isValid {
	
	return [self isValidLength] && [self isHighConfidence] && [self isValidCheckdigit];
	
}

-(BOOL)isValidLength {

	if (self.digits.count != 9) {
		return NO;
	}
	
	return YES;
}

-(BOOL)isHighConfidence {

	__block BOOL result = NO;
	
	[self.digits enumerateObjectsUsingBlock:^(id<OCRDigit> digit, NSUInteger idx, BOOL *stop) {
		
		result = [digit confidence] == 1;
		*stop = ! result;
		
	}];
	
	return result;
}

-(BOOL)isValidCheckdigit {
	
	if (self.isValidatingCheckDigit == NO) {
		return YES;
	}
	
	NSInteger checkdigit = 0;
	
	for(int offset=0 ; offset < self.digits.count ; offset++) {
	
		OCRDigit *digit = self.digits[self.digits.count - (offset + 1)];
				
		checkdigit += [digit integerValue] * (offset + 1);
		
	}
	
	checkdigit = checkdigit % 11;
	
	return checkdigit == 0;

}

-(void)parse {

	self.digits = [self.parser digitsFromArrayOfStrings: self.strings];
	
}

-(NSString *)stringValue {
	
	__block NSString *string = @"";

	[self.digits enumerateObjectsUsingBlock:^(id<OCRDigit> digit, NSUInteger idx, BOOL *stop) {
		
		string = [string stringByAppendingFormat:@"%ld", (long)[digit integerValue] ];
	}];
	
	return string;
	
}

@end





