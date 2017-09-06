//
//  LWCustomObjCopyStudy.h
//  OCCopyStudy
//
//  Created by liyifang on 2017/7/14.
//  Copyright © 2017年 liyifang. All rights reserved.
//NSLog(@"Size of %@: %zd", NSStringFromClass([myObject class]),
//malloc_size((__bridge const void *) myObject));

#import <UIKit/UIKit.h>

@interface LWCustomObjCopyStudy : UIViewController

@end

@interface LWCustomObj1 : NSObject
@property(nonatomic, strong)NSString *mallocAddress;
@property(nonatomic, strong)NSString *mallocSize;
@end

@interface LWCustomObj2 : NSObject<NSCopying,NSMutableCopying>

@end

@interface LWCustomObj3 : NSObject

@end

