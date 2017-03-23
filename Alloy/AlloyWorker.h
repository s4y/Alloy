//
//  AlloyWorker.h
//  Alloy
//
//  Created by Sidney San Martin on 3/22/17.
//  Copyright © 2017 Google. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlloyWorker : NSObject
- (void)evaluateFile:(NSString *)file atBaseURL:(NSURL *)baseURL;
@end
