//
//  AlloyInstance.h
//  Alloy
//
//  Created by Sidney San Martin on 3/22/17.
//  Copyright © 2017 Google. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlloyInstance : NSObject
@property(readonly, nonatomic) NSURL* sourceDirectory;

- (nullable instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithSourceDirectory:(NSURL*)sourceDirectory NS_DESIGNATED_INITIALIZER;

- (void)start;
@end

NS_ASSUME_NONNULL_END
