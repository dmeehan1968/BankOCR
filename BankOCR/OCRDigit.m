
#import "OCRDigit.h"

@interface OCRDigit ()

@property (getter = isDirty) BOOL dirty;
@property (readwrite, nonatomic) float confidence;
@property (readwrite, nonatomic) NSInteger integerValue;
@property (readwrite, nonatomic) NSInteger closestIntegerValue;

@end

const char OCRDigitMatrices[10][3][3] = {
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

#pragma mark - Lifecycle

-(id)init {
	
	if (self = [super init]) {
		_dirty = NO;
		_confidence = 0.0;
		_integerValue = -1;
	}
	return self;
	
}

#pragma mark - Updating

-(void) setSymbol: (char) symbol atRow: (NSInteger) row column: (NSInteger) column {
	
	NSAssert(row >= 0 && row <= 2, @"row out of range");
	NSAssert(column >= 0 && column <= 2, @"column out of range");
	
	_matrix[row][column] = symbol;
	
	self.dirty = YES;
}

#pragma mark - State

-(float)confidence {
	
	[self recalculate];
		
	return _confidence;
}

-(NSInteger)integerValue {
	
	[self recalculate];
	
	return _integerValue;
	
}

-(NSInteger) closestIntegerValue {
	
	[self recalculate];
	
	return _closestIntegerValue;
	
}

#pragma mark - External Representation


-(NSString *)stringValue {
	
	[self recalculate];
	
	if (self.confidence == 1.0) {
		
		return [NSString stringWithFormat:@"%ld", (long)self.integerValue];

	}
	
	return @"?";
}

#pragma mark - Utility

-(void) recalculate {
	
	if (self.isDirty == NO) {
		return;
	}
	
	self.dirty = NO;
	self.confidence = 0.0;
	self.integerValue = -1;
	
	for (int digit=0; digit < 10; digit++) {
		
		int matches = 0;

		for (int row=0; row < 3; row++) {
			
			for (int col=0; col < 3; col++) {
				
				if (OCRDigitMatrices[digit][row][col] == _matrix[row][col]) {
					matches++;
				}
			}
		}
		
		float confidence = matches / 9;
		
		if (self.confidence < confidence) {
		
			self.confidence = confidence;
			self.closestIntegerValue = digit;
		
		}
	}
	
	if (self.confidence < 1.0) {
		self.integerValue = -1;
	} else {
		self.integerValue = self.closestIntegerValue;
	}
}

#pragma mark - Debug

-(NSString *)description {
	return [NSString stringWithFormat:@"<%@ %p> conf=%f int=%ld, close=%ld", NSStringFromClass([self class]), self, self.confidence, self.integerValue, self.closestIntegerValue];
}

-(NSString *)debugDescription {
	return self.description;
}


@end