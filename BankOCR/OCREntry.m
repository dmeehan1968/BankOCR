//
//  OCREntry.m
//  BankOCR
//
//  Created by Dave Meehan on 26/04/2013.
//  Copyright (c) 2013 Replicated Solutions Limited. All rights reserved.
//

#import "OCREntry.h"

@interface OCREntry ()

@property (strong) NSArray *strings;
@property (weak) id parser;

@end

@implementation OCREntry

-(id)initWithStrings:(NSArray *)strings andParser:(id)parser {
	
	if (self = [super init]) {

		_strings = strings;
		_parser = parser;
		
	}
	
	return self;
}

-(BOOL)isValid {
	return NO;
}

@end
