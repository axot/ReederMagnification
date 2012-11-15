//
//  NSObject+Swizzle.m
//  ReederMagnificationHack
//
//  Created by axot on 10/10/12.
//  Copyright (c) 2012 Zheng Shao All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzle)
+ (bool)swizzleInstanceMethod:(SEL)orig_sel withMethod:(SEL)alt_sel
{
    Method orig_method = class_getInstanceMethod(self, orig_sel);
    Method alt_method = class_getInstanceMethod(self, alt_sel);
    
    if (orig_method == nil)
    {
        NSLog(@"original method not exists.");
        return false;
    }
    if (alt_method == nil)
    {
        NSLog(@"replace method not exists.");
        return false;
    }
    
    class_addMethod(self,
                    orig_sel,
                    class_getMethodImplementation(self, orig_sel),
                    method_getTypeEncoding(orig_method));
    
    class_addMethod(self,
                    alt_sel,
                    class_getMethodImplementation(self, alt_sel),
                    method_getTypeEncoding(alt_method));
    
    method_exchangeImplementations(class_getInstanceMethod(self, orig_sel), class_getInstanceMethod(self, alt_sel));
    return true;
}

+ (bool)swizzleClassMethod:(SEL)orig_sel withMethod:(SEL)alt_sel
{
    Method orig_method = class_getClassMethod(self, orig_sel);
    Method alt_method = class_getClassMethod(self, alt_sel);
    
    if (orig_method == nil)
    {
        NSLog(@"original method not exists.");
        return false;
    }
    if (alt_method == nil)
    {
        NSLog(@"replace method not exists.");
        return false;
    }
    
    class_addMethod(self,
                    orig_sel,
                    class_getMethodImplementation(self, orig_sel),
                    method_getTypeEncoding(orig_method));
    
    class_addMethod(self,
                    alt_sel,
                    class_getMethodImplementation(self, alt_sel),
                    method_getTypeEncoding(alt_method));
    
    method_exchangeImplementations(class_getInstanceMethod(self, orig_sel), class_getInstanceMethod(self, alt_sel));
    return true;
}
@end
