
#import <Foundation/Foundation.h>
#import "OCRParser.h"
#import "OCRDigit.h"

@interface OCREntry : NSObject

@property (nonatomic, getter = isValidatingCheckDigit) BOOL validatesCheckDigit;

-(id) initWithStrings: (NSArray *)strings andParser: (id<OCRParser>) parser;

-(BOOL)isValid;
-(void)parse;
-(NSString *)stringValue;

@end
