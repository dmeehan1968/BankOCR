
#import <Foundation/Foundation.h>

@class OCRCharacterSet;

@interface OCRRecognizer : NSObject

+(id)recognizerWithCharacterSet: (OCRCharacterSet *) characterSet forStringArray: (NSArray *) stringArray;

-(BOOL)hasLengthEqualTo: (NSInteger) length;

@end
