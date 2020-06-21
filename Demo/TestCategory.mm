//
//  Category.m
//  Demo
//
//  Created by Edmond on 2019/5/14.
//  Copyright © 2019 Edmond. All rights reserved.
//

#import "TestCategory.h"
#import "ThreadLock.h"
#import "InterProcessLock.h"
#import "ScopedLock.hpp"
#    include <cerrno>
#    include <fcntl.h>
#    include <sys/mman.h>
#    include <sys/stat.h>
#    include <unistd.h>
//@import SNBCommonUI;
//@import RegexKitLite;

#define EMOJI_PATTERN_URL     @"((https?|ftp|file)://[-A-Z0-9+&@#/%?=~_|!:,.;]*[-A-Z0-9+&@#/%=~_|])"

static void *const GlobalLoggingQueueIdentityKey = (void *)&GlobalLoggingQueueIdentityKey;

static NSArray *testArray;
static dispatch_queue_t _loggingQueue;
static dispatch_group_t _loggingGroup;



@interface TestVC ()

@property (nonatomic, strong) NSMutableArray *_loggers;
@property (nonatomic, weak) id observer; //持有注册通知后返回的对象
@property (nonatomic, strong)  dispatch_queue_t operationsQueue;
@property (nonatomic, strong)  dispatch_group_t operationsGroup;
@property (nonatomic, copy)  NSOperationQueue *mainQueue;
@property (nonatomic, copy) NSString *someProperty;


@end


@implementation TestVC

+ (void)initialize {
    static dispatch_once_t DDLogOnceToken;

    dispatch_once(&DDLogOnceToken, ^{
        _loggingQueue = dispatch_queue_create("cocoa.lumberjack", NULL);
        _loggingGroup = dispatch_group_create();
    });
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.yellowColor;

    _operationsGroup = dispatch_group_create();
    _operationsQueue = dispatch_queue_create("com.xueqiu.com", NULL);

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"someNotification" object:nil];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [NSNotificationCenter.defaultCenter removeObserver:self];
    });
//    [UIView animateWithDuration:1 animations:^{ [self.view.superview layoutIfNeeded]; }];

//    [[NSNotificationCenter defaultCenter] addObserverForName:@"someNotification"
//                                                      object:nil
//                                                       queue:[NSOperationQueue mainQueue]
//                                                  usingBlock:^(NSNotification * notification) {
////        self.someProperty = @"xyz";
////        [self dismissViewControllerAnimated:YES completion:nil];
//        NSLog(@"%@", self.someProperty);
////        [[NSNotificationCenter defaultCenter] removeObserver:self];
////        self.someProperty = nil;
//    }];

        __weak __typeof__(self) weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:@"someNotification"
                                                                        object:nil
                                                                         queue:nil
                                                                    usingBlock:^(NSNotification *note) {
                __typeof__(self) strongSelf = weakSelf;
        [strongSelf dismissModalViewControllerAnimated:YES];
    }];




    //tips：在iOS6.0之前也就是MRC时代是使用assign。
    //    __weak __typeof__(self) weakSelf = self;
    dispatch_group_async(_operationsGroup, _operationsQueue, ^{
        //        __typeof__(self) strongSelf = weakSelf;
//        [self test];
        self.someProperty = @"xyz";
    });
////return;
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{ self.someProperty = @"xyz"; }];

//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{ self.someProperty = @"xyz"; }];

}

- (void)test
{
    NSLog(@"test");
}

- (void)start
{
    //    int i = 1;
    //    while (i > 0) {
    //        [self test: i];
    //        i--;
    //    }

    MMKVPath_t m_name = [NSBundle.mainBundle pathForResource:@"Info" ofType:@"plist"].UTF8String;
    MMKVFileHandle_t m_fd = open(m_name.c_str(), O_RDWR | O_CREAT | O_CLOEXEC, S_IRWXU);
    mmkv::FileLock fileLock(m_fd);
    mmkv::InterProcessLock lock(&fileLock, mmkv::ExclusiveLockType);
    SCOPED_LOCK(&lock);

    testArray = [NSMutableArray array];
    testArray = [NSMutableArray array];
    testArray = [NSMutableArray array];
    testArray = [NSMutableArray array];
    testArray = [NSMutableArray array];
    testArray = [NSMutableArray array];
    testArray = [NSMutableArray array];
    testArray = [NSMutableArray array];
}

//- (void)test:(int)index {
//
//        // skip the loggers that shouldn't write this message based on the log level
//    void *nonNullValue = (__bridge void *)self;
//    void *key = (__bridge void *)self;
//
//
//    NSString *date1 = NSDate.date.description;
//    dispatch_queue_t queue1 = dispatch_queue_create("111111", NULL);
//    dispatch_queue_set_specific(queue1, key, nonNullValue, NULL);
//
//
//    dispatch_group_async(_loggingGroup, queue1, ^{ @autoreleasepool {
////        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////            NSLog(@"%d 1: %@", index, date1);
////        });
//        NSLog(@"%d 1: %@ end", index, date1);
//    } });
//
//
//    dispatch_async(_loggingQueue, ^{
//
//        dispatch_async(queue1, ^{
//            void *value1 = dispatch_get_specific(GlobalLoggingQueueIdentityKey);
//
//            void *key = (__bridge void *)self;
//            void *value2 = dispatch_get_specific(key);
//            NSLog(@"%@", date1);
//        });
//    });
//
//
//    dispatch_group_wait(_loggingGroup, DISPATCH_TIME_FOREVER);
//}
//
//- (instancetype)init {
//    self = [super init];
//
//    if (self) {
//        self._loggers = [[NSMutableArray alloc] initWithCapacity:4];
//    }
//    return self;
//}

@end

