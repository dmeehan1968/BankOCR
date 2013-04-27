#import "Kiwi.h"
#import "OCREntry.h"

SPEC_BEGIN(OCREntrySpec)

describe(@"OCREntry", ^{
	
    __block OCREntry *sut;

	context(@"basic instantiation", ^{
		
		beforeEach(^{
			
			sut = [[OCREntry alloc] initWithStrings: nil andParser: nil];
			
		});
		
		afterEach(^{
			
			sut = nil;
			
		});
		
		it(@"should exist", ^{
			
			[sut shouldNotBeNil];
			
		});
		
		it(@"should report invalid when uninitialised", ^{
			
			[[theValue([sut isValid]) should] beNo];
			
		});
		
		it(@"should validate checkdigits by default", ^{
			
			[[theValue(sut.isValidatingCheckDigit) should] beYes];
			
		});

		
	});

	context(@"use case 1", ^{
		
		__block OCREntry *sut;
		__block NSArray *inputStrings;
		__block NSString *expectedResult;
		__block id parser;
		
		afterEach(^{
			
			parser = [[OCRParser alloc] init];
			sut = [[OCREntry alloc] initWithStrings:inputStrings andParser:parser];
			
			[sut setValidatesCheckDigit: NO];
			
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

	context(@"use case 2", ^{
		
		__block OCREntry *sut;
		__block NSArray *inputStrings;
		__block NSString *expectedResult;
		__block id parser;
		
		beforeEach(^{
			
			parser = [[OCRParser alloc] init];
			
		});
		

		afterEach(^{
			
			sut = nil;
			inputStrings = nil;
			expectedResult = nil;
			parser = nil;
			
		});
		
		it(@"should have valid checkdigit for 000000051", ^{
			
			inputStrings = @[	@" _  _  _  _  _  _  _  _    ",
								@"| || || || || || || ||_   |",
								@"|_||_||_||_||_||_||_| _|  |"
					 ];
			expectedResult = @"000000051";
			
			sut = [[OCREntry alloc] initWithStrings:inputStrings andParser:parser];
			
			[sut parse];
			
			[[theValue([sut isValid]) should] beYes];
			
			[[[sut stringValue] should] equal:expectedResult];
		});
		
	});
	
	context(@"use case 3", ^{
		
		__block OCREntry *sut;
		__block NSArray *inputStrings;
		__block NSString *expectedResult;
		__block id parser;
		
		beforeEach(^{
			
			parser = [[OCRParser alloc] init];
			
		});
		
		
		afterEach(^{
			
			sut = nil;
			inputStrings = nil;
			expectedResult = nil;
			parser = nil;
			
		});
		
		it(@"should have INVALID checkdigit for 000000052", ^{
			
			inputStrings = @[	@" _  _  _  _  _  _  _  _  _ ",
					 @"| || || || || || || ||_  _|",
					 @"|_||_||_||_||_||_||_| _||_ "
					 ];
			expectedResult = @"000000052 ERR";
			
			sut = [[OCREntry alloc] initWithStrings:inputStrings andParser:parser];
			
			[sut parse];
			
			[[theValue([sut isValid]) should] beNo];
			
			[[[sut stringValue] should] equal:expectedResult];
		});
		
		it(@"should show illegal character for 49006771? ILL", ^{
			
			inputStrings = @[	@"    _  _  _  _  _  _     _ ",
								@"|_||_|| || ||_   |  |  | _ ",
								@"  | _||_||_||_|  |  |  | _|"
					 ];
			expectedResult = @"49006771? ILL";
			
			sut = [[OCREntry alloc] initWithStrings:inputStrings andParser:parser];
			
			[sut parse];
			
			[[theValue([sut isValid]) should] beNo];
			
			[[[sut stringValue] should] equal:expectedResult];
		});
		
		
		it(@"should show error for invalid checkdigit for 664371495 ERR", ^{
			
			inputStrings = @[	@" _  _     _  _        _  _ ",
								@"|_ |_ |_| _|  |  ||_||_||_ ",
								@"|_||_|  | _|  |  |  | _| _|"
					 ];
			expectedResult = @"664371495 ERR";
			
			sut = [[OCREntry alloc] initWithStrings:inputStrings andParser:parser];
			
			[sut parse];
			
			[[theValue([sut isValid]) should] beNo];
			
			NSLog(@"%@", sut);
			
			[[[sut stringValue] should] equal:expectedResult];
		});
		
		
		it(@"should show illegal characters for 1234?678? ILL", ^{
			
			inputStrings = @[	@"    _  _     _  _  _  _  _ ",
								@"  | _| _||_| _ |_   ||_||_|",
								@"  ||_  _|  | _||_|  ||_| _ "
					 ];
			expectedResult = @"1234?678? ILL";
			
			sut = [[OCREntry alloc] initWithStrings:inputStrings andParser:parser];
			
			[sut parse];
			
			[[theValue([sut isValid]) should] beNo];
			
			[[[sut stringValue] should] equal:expectedResult];
		});
		
	
	});

});

SPEC_END