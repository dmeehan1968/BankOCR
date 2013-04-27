
@protocol OCRDigit <NSObject>

@property (readonly, nonatomic) float confidence;
@property (readonly, nonatomic) NSInteger integerValue;
@property (readonly, nonatomic) NSInteger closestIntegerValue;
@property (readonly, nonatomic) NSString *stringValue;

@end

@interface OCRDigit : NSObject <OCRDigit>

-(void) setSymbol: (char) symbol atRow: (NSInteger) row column: (NSInteger) column;

@end