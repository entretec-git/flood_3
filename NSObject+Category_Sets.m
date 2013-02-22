//
//  NSObject+Category_Sets.m
//  sets
//
//  Created by Mick Brown on 22/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.
//

#import "NSObject+Category_Sets.h"

@implementation NSObject (mwb_delegate)

-(floodAppDelegate *) thisApp
{
    return (floodAppDelegate *) [[UIApplication sharedApplication]  delegate];
            
}

@end
