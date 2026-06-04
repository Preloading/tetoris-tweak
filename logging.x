#import <Foundation/Foundation.h>
#include <dlfcn.h>

@interface SSLogFileOptions : NSObject

-(NSString*)logDirectoryPath;
@end

%hook SSLogFileOptions
-(NSString*)logDirectoryPath {
	id orig = %orig;
	NSLog(@"log path -> %@", orig);
	return orig;
}

%end

%hookf(void, SSDebugLog, unsigned int a1, NSString *a2, ...) {
    va_list args;
    va_start(args, a2);

    NSLogv(a2, args);

    va_end(args);
    va_start(args, a2);
    void *arg1 = va_arg(args, void *); // why is this the best solution????
    void *arg2 = va_arg(args, void *);
    void *arg3 = va_arg(args, void *);
    void *arg4 = va_arg(args, void *);
    void *arg5 = va_arg(args, void *);
    void *arg6 = va_arg(args, void *);
    void *arg7 = va_arg(args, void *);
    void *arg8 = va_arg(args, void *);
    va_end(args);

    %orig(a1, a2, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}

%ctor {
  %init(SSDebugLog=dlsym(RTLD_DEFAULT, "SSDebugLog"));
}