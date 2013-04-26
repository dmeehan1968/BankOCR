
@protocol OCRDigit <NSObject>

-(float)confidence;
-(NSInteger)integerValue;

@end

@interface OCRDigit : NSObject <OCRDigit>

@end