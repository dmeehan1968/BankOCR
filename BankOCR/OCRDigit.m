
#import "OCRDigit.h"

@interface OCRDigit ()


@end

const char _digits[10][3][3] = {
	{	// zero
		{ ' ', '_', ' ' },
		{ '|', ' ', '|' },
		{ '|', '_', '|' }
	},
	{	// one
		{ ' ', ' ', ' ' },
		{ ' ', ' ', '|' },
		{ ' ', ' ', '|' }
	},
	{	// two
		{ ' ', '_', ' ' },
		{ ' ', '_', '|' },
		{ '|', '_', ' ' }
	},
	{	// three
		{ ' ', '_', ' ' },
		{ ' ', '_', '|' },
		{ ' ', '_', '|' }
	},
	{	// four
		{ ' ', ' ', ' ' },
		{ '|', '_', '|' },
		{ ' ', ' ', '|' }
	},
	{	// five
		{ ' ', '_', ' ' },
		{ '|', '_', ' ' },
		{ ' ', '_', '|' }
	},
	{	// six
		{ ' ', '_', ' ' },
		{ '|', '_', ' ' },
		{ '|', '_', '|' }
	},
	{	// seven
		{ ' ', '_', ' ' },
		{ ' ', ' ', '|' },
		{ ' ', ' ', '|' }
	},
	{	// eight
		{ ' ', '_', ' ' },
		{ '|', '_', '|' },
		{ '|', '_', '|' }
	},
	{	// nine
		{ ' ', '_', ' ' },
		{ '|', '_', '|' },
		{ ' ', '_', '|' }
	}
};

@implementation OCRDigit
{
	char _matrix[3][3];
}

-(void) setSymbol: (char) symbol atRow: (NSInteger) row column: (NSInteger) column {
	
	NSAssert(row >= 0 && row <= 2, @"");
	NSAssert(column >= 0 && column <= 2, @"");
	
	_matrix[row][column] = symbol;
	
}

-(float)confidence {
	
	for (int digit=0; digit < 10; digit++) {
		
		int matches = 0;
		
		for (int row=0; row < 3; row++) {
			
			for (int col=0; col < 3; col++) {
				
				if (_digits[digit][row][col] == _matrix[row][col]) {
					matches++;
				}
			}
		}
		
		if (matches == 9) {
			return 1.0;
		}
	}
	return 0.0;
	
}

-(NSInteger)integerValue {
	
	return 0;
	
}

@end