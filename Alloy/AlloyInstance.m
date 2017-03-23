//
//  AlloyInstance.m
//  Alloy
//
//  Created by Sidney San Martin on 3/22/17.
//  Copyright © 2017 Google. All rights reserved.
//

#import "AlloyInstance.h"
#import "AlloyWorker.h"

@implementation AlloyInstance {
  AlloyWorker* _rootWorker;
}

- (instancetype)initWithSourceDirectory:(NSURL*)sourceDirectory {
  if ((self = [super init])) {
    _sourceDirectory = sourceDirectory;
  }
  return self;
}

- (void)start {
  if (_rootWorker != nil) {
    @throw @"Already running.";
  }
  _rootWorker = [[AlloyWorker alloc] init];
  [_rootWorker evaluateFile:@"main.js" atBaseURL:_sourceDirectory];
}
@end
