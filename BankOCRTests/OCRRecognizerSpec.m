#import "Kiwi.h"
#import "OCRRecognizer.h"

SPEC_BEGIN(OCRRecognizerSpec)

describe(@"OCRRecognizer", ^{
	
    __block OCRRecognizer *sut;
    
    beforeEach(^{
		
        sut = [[OCRRecognizer alloc] init];
        
    });
    
    afterEach(^{
        
        sut = nil;
    });
    
    it(@"should exist", ^{
        
        [sut shouldNotBeNil];
        
    });
    
});

SPEC_END