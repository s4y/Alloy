//
//  AlloyInstanceWindowController.h
//  Alloy
//
//  Created by Sidney San Martin on 3/22/17.
//  Copyright © 2017 Google. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AlloyInstance.h"

NS_ASSUME_NONNULL_BEGIN

@interface AlloyInstanceWindowController : NSWindowController
@property(readonly, nonatomic) AlloyInstance* instance;

+ (instancetype)controllerWithInstance:(AlloyInstance*)instance;
- (instancetype)initWithWindow:(nullable NSWindow*)window NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
