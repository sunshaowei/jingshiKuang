//
//  ViewController.m
//  jingshiKuang
//
//  Created by kuanter on 2017/4/6.
//  Copyright © 2017年 kuanter. All rights reserved.
//

#import "ViewController.h"
#import "PayAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor yellowColor];
    
    
  
}
- (IBAction)button:(id)sender {
    PayAlertView*ddddd=[[PayAlertView alloc] initWithNSDictionary:nil];
    [ddddd showWithCompletion:^(NSInteger selectIndex) {
        NSLog(@"====%s=====%d=====",__func__,selectIndex);
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
