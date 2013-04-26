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
@property (weak) id<OCRParser> parser;
@property (strong) NSArray *digits;

@end

@implementation OCREntry

-(id)initWithStrings:(NSArray *)strings andParser:(id<OCRParser>)parser {
	
	if (self = [super init]) {

		_strings = strings;
		_parser = parser;
		_digits = nil;
		
	}
	
	return self;
}

-(BOOL)isValid {
	return NO;
}

-(void)parse {

	self.digits = [self.parser digitsFromArrayOfStrings: self.strings];
	
}

@end
