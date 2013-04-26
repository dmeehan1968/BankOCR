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


});

SPEC_END