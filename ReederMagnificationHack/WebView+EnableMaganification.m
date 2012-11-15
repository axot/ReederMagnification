//
//  NSScrollView+EnableMaganification.m
//  ReederMagnificationHack
//
//  Created by axot on 10/10/12.
//  Copyright (c) 2012 Zheng Shao All rights reserved.
//

#import "WebView+EnableMaganification.h"
#import <WebKit/WebKit.h>

@implementation WebView (EnableMaganification)

- (void)setMainFrameURLEx:(id)arg1
{
    NSScrollView *innerSV = self.mainFrame.frameView.documentView.enclosingScrollView;
    if ([innerSV respondsToSelector:@selector(setAllowsMagnification:)])
    {
        innerSV.horizontalScrollElasticity   = NSScrollElasticityAllowed;
        innerSV.verticalScrollElasticity     = NSScrollElasticityAllowed;
        innerSV.allowsMagnification          = true;
        innerSV.minMagnification             = 0.25f;
        innerSV.maxMagnification             = 4.0f;
                        
        [self setMainFrameURLEx:arg1];          // call original methods
        NSLog(@"Enable Maganification successed");
    }
    else
        NSLog(@"Enable Maganification failed: setMagnification not found");
}
@end
