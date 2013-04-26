#import "Kiwi.h"
#import "OCREntry.h"

SPEC_BEGIN(OCREntrySpec)

describe(@"OCREntry", ^{
	
    __block OCREntry *sut;
	
	beforeEach(^{
		
		sut = [OCREntry new];
		
	});
	
	afterEach(^{
		
		sut = nil;
		
	});
	
	it(@"should exist", ^{
		
		[sut shouldNotBeNil];
	
	});

	

});

SPEC_END