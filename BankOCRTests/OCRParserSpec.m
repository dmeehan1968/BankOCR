#import "Kiwi.h"
#import "OCRParser.h"
#import "OCRDigit.h"

SPEC_BEGIN(OCRParserSpec)

describe(@"OCRParser", ^{
	
    __block OCRParser *sut;
	__block NSArray *inputStrings;
    
    beforeEach(^{
		
        sut = [[OCRParser alloc] init];
        
    });
    
    afterEach(^{
        
        sut = nil;
    });
    
    it(@"should exist", ^{
        
        [sut shouldNotBeNil];
        
    });
	
	it(@"should recognise all digits in input string", ^{
		
		inputStrings = @[	@"    _  _     _  _  _  _  _ ",
							@"  | _| _||_||_ |_   ||_||_|",
							@"  ||_  _|  | _||_|  ||_| _|",
					];
		
		NSArray *digits = [sut digitsFromArrayOfStrings:inputStrings];
		
		[[digits should] haveCountOf:9];
		
		[digits enumerateObjectsUsingBlock:^(id<OCRDigit> obj, NSUInteger idx, BOOL *stop) {
			
			[[theValue(idx+1) should] equal: theValue([obj integerValue])];
		}];
	});
	
	it(@"should recognise all digits in input string (includes zero)", ^{
		
		inputStrings = @[	@" _     _  _     _  _  _  _ ",
							@"| |  | _| _||_||_ |_   ||_|",
							@"|_|  ||_  _|  | _||_|  ||_|",
					];
		
		NSArray *digits = [sut digitsFromArrayOfStrings:inputStrings];
		
		[[digits should] haveCountOf:9];
		
		[digits enumerateObjectsUsingBlock:^(id<OCRDigit> obj, NSUInteger idx, BOOL *stop) {
			
			[[theValue(idx) should] equal: theValue([obj integerValue])];
		}];
	});
	
    
});

SPEC_END