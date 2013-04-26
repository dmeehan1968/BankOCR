
@protocol OCRParser <NSObject>

-(NSArray *)digitsFromArrayOfStrings: (NSArray *) strings;

@end

@interface OCRParser : NSObject <OCRParser>

@end