//
//  NSObject+Swizzle.h
//  ReederMagnificationHack
//
//  Created by axot on 10/10/12.
//  Copyright (c) 2012 Zheng Shao All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)
+ (bool)swizzleInstanceMethod:(SEL)orig_sel withMethod:(SEL)alt_sel;
+ (bool)swizzleClassMethod:(SEL)orig_sel withMethod:(SEL)alt_sel;
@end
