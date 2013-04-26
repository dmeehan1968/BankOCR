//
//  OCREntry.h
//  BankOCR
//
//  Created by Dave Meehan on 26/04/2013.
//  Copyright (c) 2013 Replicated Solutions Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCRParser.h"
#import "OCRDigit.h"

@interface OCREntry : NSObject

-(id) initWithStrings: (NSArray *)strings andParser: (id<OCRParser>) parser;

-(BOOL)isValid;
-(void)parse;
-(NSString *)stringValue;


@end
