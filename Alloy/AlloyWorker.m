//
//  AlloyWorker.m
//  Alloy
//
//  Created by Sidney San Martin on 3/22/17.
//  Copyright © 2017 Google. All rights reserved.
//

#import "AlloyWorker.h"

@import JavaScriptCore;

@protocol AlloyWorkerConsoleJSExport <JSExport>
- (void)log:(NSString*)message;
@end

@interface AlloyWorkerConsole : NSObject<AlloyWorkerConsoleJSExport>
@end

@implementation AlloyWorkerConsole
- (void)log:(NSString*)message {
  NSLog(@"%@: %@", self, message);
}
@end

@protocol AlloyWorkerJSExport <JSExport>
@end

@interface AlloyWorker ()<AlloyWorkerJSExport>
@end


@interface JSContext(Private)
@property (setter=_setRemoteInspectionEnabled:) BOOL _remoteInspectionEnabled;
@end

void JSRemoteInspectorStart(void) CF_AVAILABLE(10_11, 9_0);

@implementation AlloyWorker {
  JSContext *_context;
  dispatch_queue_t _queue;
}

- (instancetype)init {
  if ((self = [super init])) {
    JSRemoteInspectorStart();
    _context = [[JSContext alloc] initWithVirtualMachine:[[JSVirtualMachine alloc] init]];
    _context.exceptionHandler = ^(JSContext* context __unused, JSValue* exception) {
      NSLog(@"JS exception: %@", exception);
    };
    _context.name = @"foo";
    _context._remoteInspectionEnabled = YES;
    _queue = dispatch_queue_create(self.description.UTF8String, DISPATCH_QUEUE_SERIAL);
  }
  return self;
}

- (void)evaluateFile:(NSString *)file atBaseURL:(NSURL *)baseURL {
  dispatch_async(_queue, ^{
    NSURL* scriptURL = [baseURL URLByAppendingPathComponent:file];
    NSString* script = [[NSString alloc] initWithData:[NSData dataWithContentsOfURL:scriptURL] encoding:NSUTF8StringEncoding];
    if (script == nil) {
      @throw [NSString stringWithFormat:@"Couldn't load script: %@", scriptURL];
    }
    NSLog(@"result: %@", [_context evaluateScript:script withSourceURL:scriptURL]);
  });
}

@end
