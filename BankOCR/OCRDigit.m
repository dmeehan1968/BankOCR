
#import "OCRDigit.h"

@interface OCRDigit ()

@property (getter = isDirty) BOOL dirty;
@property (readwrite, nonatomic) float confidence;
@property (readwrite, nonatomic) NSInteger integerValue;

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

-(id)init {
	
	if (self = [super init]) {
		_dirty = NO;
		_confidence = 0.0;
		_integerValue = -1;
	}
	return self;
	
}

-(void) setSymbol: (char) symbol atRow: (NSInteger) row column: (NSInteger) column {
	
	NSAssert(row >= 0 && row <= 2, @"");
	NSAssert(column >= 0 && column <= 2, @"");
	
	_matrix[row][column] = symbol;
	
	self.dirty = YES;
}

-(float)confidence {
	
	[self recalculate];
		
	return _confidence;
}

-(NSInteger)integerValue {
	
	[self recalculate];
	
	return _integerValue;
	
}

-(void) recalculate {
	
	if (self.isDirty == NO) {
		return;
	}
	
	self.dirty = NO;

	for (int digit=0; digit < 10; digit++) {
		
		int matches = 0;

		self.confidence = 0.0;
		self.integerValue = -1;
		
		for (int row=0; row < 3; row++) {
			
			for (int col=0; col < 3; col++) {
				
				if (_digits[digit][row][col] == _matrix[row][col]) {
					matches++;
				}
			}
		}
		
		if (matches == 9) {
			self.confidence = 1.0;
			self.integerValue = digit;
			return;
		}
	}
	
}

@end