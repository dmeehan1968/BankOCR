#import "Kiwi.h"
#import "OCRRecognizer.h"
#import "OCRCharacterSet.h"

SPEC_BEGIN(OCRRecognizerSpec)

describe(@"OCRRecognizer", ^{
	
    __block OCRRecognizer *sut;
    __block NSArray *stringArray;
	
    beforeEach(^{
	
		stringArray = @[	@"    _  _     _  _  _  _  _ ",
							@"  | _| _||_||_ |_   ||_||_|",
							@"  ||_  _|  | _||_|  ||_| _|"
				   ];
		
		OCRCharacterSet *decimalDigitCharacterSet = [OCRCharacterSet decimalDigitCharacterSet];
        sut = [OCRRecognizer recognizerWithCharacterSet: decimalDigitCharacterSet forStringArray: stringArray];
        
    });
    
    afterEach(^{
        
        sut = nil;
    });
    
    it(@"should exist", ^{
        
        [sut shouldNotBeNil];
        
    });
	
	it(@"should recognise 9 digits", ^{
		
		[[theValue([sut hasLengthEqualTo:9]) should] beYes];
		
	});

	
    
});

SPEC_END