#import "Kiwi.h"
#import "OCREntry.h"
#import "OCRParser.h"

SPEC_BEGIN(BankOCRSpec)

describe(@"BankOCR Integration", ^{
	
    __block OCREntry *sut;
    __block NSArray *inputStrings;
	__block NSString *expectedResult;
	__block id parser;
	
    afterEach(^{
        
		parser = [[OCRParser alloc] init];
		sut = [[OCREntry alloc] initWithStrings:inputStrings andParser:parser];
		
		[sut parse];
		
		[[theValue([sut isValid]) should] beYes];
		
		[[[sut stringValue] should] equal:expectedResult];

        sut = nil;
		inputStrings = nil;
		expectedResult = nil;
		parser = nil;
		
    });
    
	it(@"input 000000000", ^{
		
		inputStrings = @[	@" _  _  _  _  _  _  _  _  _ ",
							@"| || || || || || || || || |",
							@"|_||_||_||_||_||_||_||_||_|"
					];
		expectedResult = @"000000000";
		

	});
	
	it(@"input 111111111", ^{
		
		inputStrings = @[	@"                           ",
							@"  |  |  |  |  |  |  |  |  |",
							@"  |  |  |  |  |  |  |  |  |"
					];
		expectedResult = @"111111111";
				
	});
	
	it(@"input 222222222", ^{
		
		inputStrings = @[	@" _  _  _  _  _  _  _  _  _ ",
							@" _| _| _| _| _| _| _| _| _|",
							@"|_ |_ |_ |_ |_ |_ |_ |_ |_ "
					];
		expectedResult = @"222222222";
		
	});
	
	it(@"input 333333333", ^{
		
		inputStrings = @[	@" _  _  _  _  _  _  _  _  _ ",
							@" _| _| _| _| _| _| _| _| _|",
							@" _| _| _| _| _| _| _| _| _|"
					];
		expectedResult = @"333333333";
		
	});
	
	it(@"input 444444444", ^{
		
		inputStrings = @[	@"                           ",
							@"|_||_||_||_||_||_||_||_||_|",
							@"  |  |  |  |  |  |  |  |  |"
					];
		expectedResult = @"444444444";
		
	});
	
	it(@"input 555555555", ^{
		
		inputStrings = @[	@" _  _  _  _  _  _  _  _  _ ",
							@"|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
							@" _| _| _| _| _| _| _| _| _|"
					];
		expectedResult = @"555555555";
		
	});
	
	it(@"input 666666666", ^{
		
		inputStrings = @[	@" _  _  _  _  _  _  _  _  _ ",
							@"|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
							@"|_||_||_||_||_||_||_||_||_|"
					];
		expectedResult = @"666666666";
		
	});
	
	it(@"input 777777777", ^{
		
		inputStrings = @[	@" _  _  _  _  _  _  _  _  _ ",
							@"  |  |  |  |  |  |  |  |  |",
							@"  |  |  |  |  |  |  |  |  |"
					];
		expectedResult = @"777777777";
		
	});
	
	it(@"input 888888888", ^{
		
		inputStrings = @[	@" _  _  _  _  _  _  _  _  _ ",
							@"|_||_||_||_||_||_||_||_||_|",
							@"|_||_||_||_||_||_||_||_||_|"
					];
		expectedResult = @"888888888";
		
	});
	
	it(@"input 999999999", ^{
		
		inputStrings = @[	@" _  _  _  _  _  _  _  _  _ ",
							@"|_||_||_||_||_||_||_||_||_|",
							@" _| _| _| _| _| _| _| _| _|"
					];
		expectedResult = @"999999999";
		
	});
	
	it(@"input 123456789", ^{
		
		inputStrings = @[	@"    _  _     _  _  _  _  _ ",
							@"  | _| _||_||_ |_   ||_||_|",
							@"  ||_  _|  | _||_|  ||_| _|"
					];
		expectedResult = @"123456789";
		
	});
	
    
});

SPEC_END