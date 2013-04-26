#import "Kiwi.h"
#import "OCRDigit.h"

SPEC_BEGIN(OCRDigitSpec)

describe(@"OCR Digit", ^{
	
    __block OCRDigit *sut;
	
	void (^zeroBlock)(OCRDigit *digit) = ^(OCRDigit *digit){
		
		char zero[3][3]= {
			{ ' ', '_', ' ' },
			{ '|', ' ', '|' },
			{ '|', '_', '|' }
		};
		
		for (int row=0 ; row < 3 ; row++) {
			for(int col = 0 ; col < 3 ; col++) {
				[digit setSymbol: zero[row][col] atRow: row column: col];
			}
		}
	};
	
	void (^invalidBlock)(OCRDigit *digit) = ^(OCRDigit *digit){
		
		char zero[3][3]= {
			{ ' ', ' ', ' ' },
			{ ' ', ' ', ' ' },
			{ ' ', ' ', ' ' }
		};
		
		for (int row=0 ; row < 3 ; row++) {
			for(int col = 0 ; col < 3 ; col++) {
				[digit setSymbol: zero[row][col] atRow: row column: col];
			}
		}
	};
	
    beforeEach(^{
		
        sut = [[OCRDigit alloc] init];
        
    });
    
    afterEach(^{
        
        sut = nil;
    });
    
    it(@"should exist", ^{
        
        [sut shouldNotBeNil];
        
    });
	
	it(@"should have confidence 1 for matching digit", ^{
		
		zeroBlock(sut);
		
		[[theValue([sut confidence]) should] equal:theValue(1.0)];
		
	});
	
	it(@"should have confidence 0 for non-matching digit", ^{
		
		invalidBlock(sut);
		
		[[theValue([sut confidence]) should] equal:theValue(0.0)];
		
	});
	
    
});

SPEC_END