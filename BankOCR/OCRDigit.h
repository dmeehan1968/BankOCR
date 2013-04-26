
@protocol OCRDigit <NSObject>

-(float)confidence;
-(NSInteger)integerValue;

@end

@interface OCRDigit : NSObject <OCRDigit>

-(void) setSymbol: (char) symbol atRow: (NSInteger) row column: (NSInteger) column;

@end