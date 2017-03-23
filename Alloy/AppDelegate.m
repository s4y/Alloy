//
//  AppDelegate.m
//  Alloy
//
//  Created by Sidney San Martin on 3/22/17.
//  Copyright © 2017 Google. All rights reserved.
//

#import "AppDelegate.h"
#import "AlloyInstance.h"
#import "AlloyInstanceWindowController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
  NSMutableArray<AlloyInstanceWindowController*>* _windows;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  [NSUserDefaults.standardUserDefaults registerDefaults:@{
    @"WebKitDeveloperExtras": @YES
  }];
  NSURL* sourceDirectory = [NSBundle.mainBundle URLForResource:@"sample" withExtension:nil];
  AlloyInstance* instance = [[AlloyInstance alloc] initWithSourceDirectory:sourceDirectory];
  AlloyInstanceWindowController* windowController = [AlloyInstanceWindowController controllerWithInstance:instance];
  [windowController showWindow:nil];
  [instance start];
  
  if (_windows == nil) {
    _windows = [NSMutableArray array];
  }
  [_windows addObject:windowController];
  
}
@end
