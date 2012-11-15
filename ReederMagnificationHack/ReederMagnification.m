//
//  ReederMagnification.m
//  ReederMagnificationHack
//
//  Created by axot on 10/10/12.
//  Copyright (c) 2012 Zheng Shao All rights reserved.
//

#import "ReederMagnification.h"
#import "WebView+EnableMaganification.h"
#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation ReederMagnification

/**
 * A special method called by SIMBL once the application has started and all classes are initialized.
 */
+ (void) load
{
    if ([objc_getClass("CoreNSWebView") swizzleInstanceMethod:@selector(setMainFrameURL:)
                                                   withMethod:@selector(setMainFrameURLEx:)])
    {
        NSLog(@"ReederMagnification loaded");
    }
    else
    {
        NSLog(@"ReederMagnification did not be loaded");
    }
}

@end
