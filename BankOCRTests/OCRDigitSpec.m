#import "Kiwi.h"
#import "OCRDigit.h"

SPEC_BEGIN(OCRDigitSpec)

describe(@"OCR Digit", ^{
	
    __block OCRDigit *sut;
    
    beforeEach(^{
		
        sut = [[OCRDigit alloc] init];
        
    });
    
    afterEach(^{
        
        sut = nil;
    });
    
    it(@"should exist", ^{
        
        [sut shouldNotBeNil];
        
    });
    
});

SPEC_END