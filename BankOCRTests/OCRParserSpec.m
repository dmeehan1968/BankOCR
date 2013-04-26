#import "Kiwi.h"
#import "OCRParser.h"

SPEC_BEGIN(OCRParserSpec)

describe(@"OCRParser", ^{
	
    __block OCRParser *sut;
    
    beforeEach(^{
		
        sut = [[OCRParser alloc] init];
        
    });
    
    afterEach(^{
        
        sut = nil;
    });
    
    it(@"should exist", ^{
        
        [sut shouldNotBeNil];
        
    });
    
});

SPEC_END