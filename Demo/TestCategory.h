//
//  Category.h
//  Demo
//
//  Created by Edmond on 2019/5/14.
//  Copyright © 2019 Edmond. All rights reserved.
//

#import <UIKit/UIKit.h>


#ifndef MMKV_THREADLOCK_H
#define MMKV_THREADLOCK_H
#ifdef  __cplusplus

#include "MMKVPredef.h"

#ifndef MMKV_WIN32
#    include <pthread.h>
#    define MMKV_USING_PTHREAD 1
#endif

#if MMKV_USING_PTHREAD
#else
#    include <atomic>
#endif

namespace mmkv {

#if MMKV_USING_PTHREAD
#    define ThreadOnceToken_t pthread_once_t
#    define ThreadOnceUninitialized PTHREAD_ONCE_INIT
#else
enum ThreadOnceTokenEnum : int32_t { ThreadOnceUninitialized = 0, ThreadOnceInitializing, ThreadOnceInitialized };
using ThreadOnceToken_t = std::atomic<ThreadOnceTokenEnum>;
#endif

class ThreadLock {
private:
#if MMKV_USING_PTHREAD
    pthread_mutex_t m_lock;
#else
    CRITICAL_SECTION m_lock;
#endif

public:
    ThreadLock();
    ~ThreadLock();

    void initialize();

    void lock();
    void unlock();

    static void ThreadOnce(ThreadOnceToken_t *onceToken, void (*callback)(void));

#ifdef MMKV_WIN32
    static void Sleep(int ms);
#endif

    // just forbid it for possibly misuse
    explicit ThreadLock(const ThreadLock &other) = delete;
    ThreadLock &operator=(const ThreadLock &other) = delete;
};

} // namespace mmkv

#endif
#endif //MMKV_THREADLOCK_H


@interface TestVC : UIViewController

+ (void)test;
- (void)start;


@end


