//
//  LWCustomObjCopyStudy.m
//  OCCopyStudy
//
//  Created by liyifang on 2017/7/14.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "LWCustomObjCopyStudy.h"

@interface LWCustomObjCopyStudy ()

@end

@implementation LWCustomObjCopyStudy

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end

@implementation LWCustomObj1



@end

@implementation LWCustomObj2

-(id)copyWithZone:(NSZone *)zone
{
    LWCustomObj2 *obj = [[LWCustomObj2 allocWithZone:zone]init];
    return obj;
}

-(id)mutableCopyWithZone:(NSZone *)zone
{
    
}

@end

@implementation LWCustomObj3



@end
