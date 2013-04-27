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
		
	});

	context(@"initialised with strings and parser", ^{
		
		__block NSArray *inputStrings;
		__block id parser;
		__block id mockDigitFor0;
		__block NSArray *digitsForNineZeroes;
		
		beforeEach(^{
			
			mockDigitFor0 = [KWMock mockForProtocol:@protocol(OCRDigit)];
			
			digitsForNineZeroes = @[ mockDigitFor0, mockDigitFor0, mockDigitFor0, mockDigitFor0, mockDigitFor0, mockDigitFor0, mockDigitFor0, mockDigitFor0, mockDigitFor0 ];

			inputStrings = @[	@" _  _  _  _  _  _  _  _  _ ",
								@"| || || || || || || || || |",
								@"|_||_||_||_||_||_||_||_||_|",
					 ];
			
			parser = [KWMock mockForProtocol:@protocol(OCRParser)];
			
			sut = [[OCREntry alloc] initWithStrings:inputStrings andParser:parser];
			
			
		});
		
		it(@"should be invalid before parsing", ^{
			
			[[theValue([sut isValid]) should] beNo];
					  
		});

		it(@"should send input string to parser", ^{
			
			[[parser should] receive:@selector(digitsFromArrayOfStrings:) andReturn:@[] withArguments:inputStrings];
			
			[sut parse];
			
		});

		it(@"should report a valid parsing result", ^{
						
			[[mockDigitFor0 should] receive:@selector(confidence) andReturn:theValue(1.0) withCount:9];
			
			[[parser should] receive:@selector(digitsFromArrayOfStrings:) andReturn: digitsForNineZeroes];
			
			[sut parse];
			
			[[theValue([sut isValid]) should] beYes];
			
		});
		
		it(@"should report invalid if not 9 digits", ^{
			
			id mockDigitFor0 = [KWMock mockForProtocol:@protocol(OCRDigit)];
			
			NSArray *digits = @[ mockDigitFor0 ];
			
			[[mockDigitFor0 should] receive:@selector(confidence) andReturn:theValue(1.0) withCountAtLeast:0];
			
			[[parser should] receive:@selector(digitsFromArrayOfStrings:) andReturn: digits];
			
			[sut parse];
			
			[[theValue([sut isValid]) should] beNo];
			
		});
		
		it(@"should return a string matching a valid input", ^{
			
			[[mockDigitFor0 should] receive:@selector(integerValue) andReturn:theValue(0) withCount:9];
			
			[[parser should] receive:@selector(digitsFromArrayOfStrings:) andReturn: digitsForNineZeroes];
			
			[sut parse];
			
			[[[sut stringValue] should] equal: @"000000000"];
			
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


});

SPEC_END