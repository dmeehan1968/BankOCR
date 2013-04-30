
#import "OCRRecognizer.h"

@implementation OCRRecognizer

+(id)recognizerWithCharacterSet:(id)characterSet forStringArray:(NSArray *)stringArray {

	return [[self alloc] initRecognizerWithCharacterSet: characterSet forStringArray: stringArray];
	
}

-(id)initRecognizerWithCharacterSet:(id)characterSet forStringArray:(NSArray *)stringArray {

	if (self = [super init]) {
		
	}
	return self;
}

-(BOOL)hasLengthEqualTo:(NSInteger)length {
	return NO;
}

@end
