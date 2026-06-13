#import <Foundation/Foundation.h>

%hook ISURLBag

// +(NSString*)valueForKey:(NSString*)key inBagContext:(id)context {
//     NSLog(@"value is: %@", key);
//     if ([key isEqualToString:@""])
//     return %orig;
// }

+(id)diskCachedURLBagForContext:(id)context
{
  return nil;
}

%end

// %hook SULoadSectionsOperation
// -(BOOL)_loadSectionsFromNetworkWithDictionary:(NSDictionary*)dict

// %end

%hook ISURLOperation

// -(BOOL)_runRequestWithURL:(NSURL*)url {
//     NSLog(@"_runRequestWithURL:%@", url);
//     return %orig;
// }
%end

// swap out the entire bag
%hook ISLoadURLBagOperation
-(id)_copyProductionBootstrapURLs
{
    NSMutableArray *urls = [[NSMutableArray alloc] init];
    NSURL *newURL = [[NSURL alloc] initWithString:@"http://10.0.0.77:2421/bag.xml?ix=2"];
    [urls addObject:newURL];
    [newURL release];
    return urls;
    // http://phobos.apple.com/bag.xml?ix=2
//   NSMutableArray *v2; // r0
//   NSMutableArray *v3; // r10
//   void *v4; // r6
//   NSURL *v5; // r0
//   NSURL *v6; // r4
//   NSURL *v7; // r0
//   NSURL *v8; // r6
//   NSURL *v9; // r0
//   NSURL *v10; // r6

//   v3 = -[[NSMutableArray alloc] init];
//   v4 = (void *)CFPreferencesCopyAppValue(CFSTR("InitiateSessionURL"), kSSUserDefaultsIdentifier);
//   if ( v4 )
//   {
//     v5 = +[NSURL alloc]();
//     v6 = -[NSURL initWithString:](v5, v4);
//     -[NSMutableArray addObject:](v3, v6);
//     -[NSURL release](v6);
//     objc_msgSend(v4, "release");
//   }
//   if ( !-[NSMutableArray count](v3) )
//   {
//     v7 = +[NSURL alloc]();
//     v8 = -[NSURL initWithString:](v7, CFSTR("http://ax.init.itunes.apple.com/bag.xml?ix=2"));
//     -[NSMutableArray addObject:](v3, v8);
//     -[NSURL release](v8);
//     v9 = +[NSURL alloc]();
//     v10 = -[NSURL initWithString:](v9, CFSTR("http://phobos.apple.com/bag.xml?ix=2"));
//     -[NSMutableArray addObject:](v3, v10);
//     -[NSURL release](v10);
//   }
//   return v3;
}
%end

