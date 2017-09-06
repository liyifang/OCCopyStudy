//
//  LWStringCopyStudyViewController.m
//  OCCopyStudy
//
//  Created by liyifang on 2017/7/14.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "LWStringCopyStudyViewController.h"
//打印指针的地址（不是指针指向对象的地址）：NSLog(@"aStr指针内存地址：%x",&aStr);
//打印指针所指向对象的地址使用这个 ：NSLog(@"aStr指针所指向对象的地址：%p",aStr);
@interface LWStringCopyStudyViewController ()

@end

@implementation LWStringCopyStudyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = [UIColor whiteColor];
 //赋值
 
   NSString *str1 = @"abc";
   NSString *str2 = str1;
  
   NSLog(@"str1指针内存地址：%p,str2指针内存地址：%p",&str1,&str2);
   NSLog(@"str1指针所指向对象的地址：%p,str2指针所指向对象的地址：%p",str1,str2);
    /**
     打印示例：---------------------------------------------------
     str1指针内存地址：0x7fff5129cc28,str2指针内存地址：0x7fff5129cc20
     str1指针所指向对象的地址：0x10e9640b8,str2指针所指向对象的地址：0x10e9640b8
     ------------------------------------------------------------
     从数据分析得出str1、str2指针内存地址不同但所指向对象的地址是同一个。
     
     */
    //str2重新赋值
  str2 = @"123";
  NSLog(@"str1指针内存地址：%p,str2指针内存地址：%p",&str1,&str2);
  NSLog(@"str1指针所指向对象的地址：%p,str2指针所指向对象的地址：%p",str1,str2);
  NSLog(@"str1指针所指向对象的值：%@，str2指针所指向对象的值：%@",str1,str2);
    /**
     打印示例：---------------------------------------------------
     str1指针内存地址：0x7fff5129cc28,str2指针内存地址：0x7fff5129cc20
     str1指针所指向对象的地址：0x10e9640b8,str2指针所指向对象的地址：0x10e964118
     str1指针所指向对象的值：abc，str2指针所指向对象的值：123
     ------------------------------------------------------------
     从数据分析得出str2被重新赋值后，指针内存地址没变但指针所指向对象的地址变了
     */
    //不可变字符串拷贝
  NSString *cStr1 = [str1 copy];//copay
  NSMutableString *mcStr1 = [str1 mutableCopy];//mutableCopy
  NSLog(@"cStr1指针内存地址：%p,mcStr1指针内存地址：%p",&cStr1,&mcStr1);
  NSLog(@"cStr1指针所指向对象的地址：%p,mcStr1指针所指向对象的地址：%p",cStr1,mcStr1);
    /**
     打印示例：---------------------------------------------------
    cStr1指针内存地址：0x7fff5129cc18,mcStr1指针内存地址：0x7fff5129cc10
    cStr1指针所指向对象的地址：0x10e9640b8,mcStr1指针所指向对象的地址：0x60000026d540
     ------------------------------------------------------------
     不可变字符串copy赋值新指针cStr1与str1指向了同样的对象内存块并未产生新的对象内存块，而进行mutableCopy赋值后mcStr1与str1指向了各自的对象内存块
     */
   // 可变字符串拷贝
  NSString *cStr2 = [mcStr1  copy];
  NSMutableString *mcStr2 = [mcStr1 mutableCopy];
  NSLog(@"cStr2指针内存地址：%p,mcStr2指针内存地址：%p",&cStr2,&mcStr2);
  NSLog(@"cStr2指针所指向对象的地址：%p,mcStr2指针所指向对象的地址：%p",cStr2,mcStr2);
    /**
     打印示例：---------------------------------------------------
     cStr2指针内存地址：0x7fff5129cc08,mcStr2指针内存地址：0x7fff5129cc00
     cStr2指针所指向对象的地址：0xa000000006362613,mcStr2指针所指向对象的地址：0x608000272580
     ------------------------------------------------------------
      可变字符串无论进行copy赋值还是mutableCopy都会产生新的对象内存块，cStr2与mcStr2都会指向与mcStr1不同的内存块
     */
   
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end


/***
 在C语言中，我们会这样使用指针：
 
 [objc] view plain copy
 int a = 10, *p1, *p2;
 p1 = &a;
 p2 = p1;
 
 p1指的是变量a所在的地址。*p1指的是p1指向的地址的值，即a的值。&a指的是变量a的地址。而oc中的指针跟C语言中的指针是一样的。
 在oc中，当我们alloc、init一个对象以后，要访问对象一般直接使用对象的名字，如：
 
 [objc] view plain copy
 MyClass *obj = [[MyClass alloc]init];
 NSLog(@"obj:%p", obj);
 NSLog(@"&obj:%p", &obj);
 输出为：
 
 
 
 obj是一个指针变量，它指向obj对象的地址。&obj指的是obj这个指针变量所在的地址。
 
 下面分别来看下obj、&obj的内存地址。
 
 
 上图红框选中的是obj指向的对象的内存地址：0x100200130。(图中的内存地址是倒着来的:01 00 20 01 30->30 01 20 00 01)
 
 绿框选中的是obj指针变量的地址：0x7fff5fbff838，即&obj的地址。
 
 打印obj时输出的内存地址也是：0x100200130，即obj指向的对象的地址。
 
 下面看下obj指向的对象的地址：
 
 
 绿框选中的是obj指向的对象的地址：0x100200130。红框选中的是该对象的isa指针的地址，右边存的是该对象的实例变量的地址(该对象的实例变量没有被赋值，所以默认为0x000000000)
 
 看完以上的部分以后，我们可以总结出下面这个图。obj指针变量的地址为：0x7fff5fbff838，即&obj的值。该地址里存的是obj指向的对象的地址：0x100200130，obj指向的对象的地址里存的是isa指针和实例变量的地址。
 
 
 理解了oc指针的概念以后，我们再回到最上面的那段代码。不用往上翻，我搬下来了。
 
 [objc] view plain copy
 NSError *error = nil;
 BOOL result = [object performOperationWithError:&error];
 该方法的声明为：
 [objc] view plain copy
 - (BOOL)performOperationWithError:](NSError **)error;
 这里为什么要把&error作为参数呢？因为这是一个引用传递，把error的地址传进方法里后，方法外的error的值会随着方法里的error的改变而改变，类似于C语言中把指针作为参数传进函数中。而为什么传的不是error而是&error呢？通过上面的研究，我们知道error的值是error指向的对象的地址，&error的值是error指针变量的地址。我们可以看到performOperationWithError:方法的参数是(NSError **)error，说明该参数是一个二级指针，它接收的是一个指针变量的地址，而不是一个对象的地址(指针变量指向的地址)(如果接收对象地址，一般是这样写：(NSError *)error)，因此传进去的必须是&error。

 **/
