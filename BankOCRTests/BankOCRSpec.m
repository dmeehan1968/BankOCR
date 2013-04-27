#import "Kiwi.h"
#import "OCREntry.h"
#import "OCRParser.h"

SPEC_BEGIN(BankOCRSpec)

describe(@"BankOCR", ^{
	
    __block OCREntry *sut;
    __block NSArray *inputStrings;
	__block NSString *expectedResult;
	
    afterEach(^{
        
        sut = nil;
    });
    
	it(@"input 000000000", ^{
	
		inputStrings = @[	@" _  _  _  _  _  _  _  _  _ ",
							@"| || || || || || || || || |",
							@"|_||_||_||_||_||_||_||_||_|"
					];
		expectedResult = @"000000000";
		
		sut = [[OCREntry alloc] initWithStrings:inputStrings andParser:[[OCRParser alloc] init]];
		
	});

    
});

SPEC_END