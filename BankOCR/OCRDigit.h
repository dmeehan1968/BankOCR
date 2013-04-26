
@protocol OCRDigit <NSObject>

-(float) confidence;
-(NSInteger)integerValue;

@end

@interface OCRDigit : NSObject <OCRDigit>

@property (readonly, nonatomic) float confidence;
@property (readonly, nonatomic) NSInteger integerValue;

-(void) setSymbol: (char) symbol atRow: (NSInteger) row column: (NSInteger) column;

@end