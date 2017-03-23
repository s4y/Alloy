//
//  AlloyInstanceWindowController.m
//  Alloy
//
//  Created by Sidney San Martin on 3/22/17.
//  Copyright © 2017 Google. All rights reserved.
//

#import "AlloyInstanceWindowController.h"

@interface AlloyInstanceWindowController ()

@end

@implementation AlloyInstanceWindowController

+ (instancetype)controllerWithInstance:(AlloyInstance*)instance {
  AlloyInstanceWindowController* controller = [[NSStoryboard storyboardWithName:@"Instance" bundle:nil] instantiateInitialController];
  controller->_instance = instance;
  return controller;
}

- (void)windowDidLoad {
  [super windowDidLoad];
  NSLog(@"windowDidLoad, no idea what to do.");
}

@end
