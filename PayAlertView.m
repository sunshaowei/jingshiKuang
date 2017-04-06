//
//  PayAlertView.m
//  PayResultAlertView
//
//  Created by kuanter on 16/4/15.
//  Copyright © 2016年 kuanter. All rights reserved.
//
  
#import "PayAlertView.h"
#import "Masonry.h"


@interface PayAlertView ()
@property(nonatomic,strong)UIView*contentView;
@property (nonatomic,copy) void (^dialogViewCompleteHandle)(NSInteger);//block回调方法
@property(nonatomic,strong)NSDictionary*dic;
@end

@implementation PayAlertView


-(id)initWithNSDictionary:(NSDictionary*)dic{
    self=[super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
           _dic=dic;
        [self setup];
       
    }
    return self;
}
-(void)setup{
    
    self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
    
    //显示框
    _contentView=[[UIView alloc] init];
    _contentView.backgroundColor=[UIColor whiteColor];
    _contentView.layer.cornerRadius=5.0;
    [self addSubview:_contentView];
    
    //右上button
    UIButton*rightTopButton=[UIButton buttonWithType:UIButtonTypeSystem];
    rightTopButton.backgroundColor=[UIColor redColor];
    [rightTopButton addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:rightTopButton];
    
   
   
   
  
    

    
  
    
    //查看订单详情button
    UIButton*xiangQingButton=[UIButton buttonWithType:UIButtonTypeSystem];
    [xiangQingButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    xiangQingButton.tag=100;
    xiangQingButton.layer.cornerRadius=5.0;
    xiangQingButton.backgroundColor=[UIColor greenColor];
    [_contentView addSubview:xiangQingButton];
    
    
    
    
    
    
    
    //显示框
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(260, 180));
    }];
    
 
    //右上button
    [rightTopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(22, 22));
        make.top.equalTo(_contentView.mas_top).with.offset(5);
        make.right.equalTo(_contentView.mas_right).with.offset(-5);
    }];

   
  
  
    
   
    
    //查看订单详情button
    [xiangQingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_contentView.mas_centerX);
        make.bottom.equalTo(_contentView.mas_bottom).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(160, 25));
    }];
    
    
    
    
}
////button点击事件
-(void)buttonAction:(UIButton*)button{
    
     NSInteger selIndex = button.tag;
    [self closeView];
    
    if(_dialogViewCompleteHandle)
    {
        _dialogViewCompleteHandle(selIndex);//通过block回调方法来执行外部方法
    }
    
}

-(void)showWithCompletion:(void (^)(NSInteger selectIndex))completeBlock{
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [self showInView:keyWindow completion:completeBlock];
}

//显示
-(void)showInView:(UIView *)baseView completion:(void (^)(NSInteger))completeBlock{
    
  
    
   self.dialogViewCompleteHandle = completeBlock;
    
    [baseView addSubview:self];
    //放缩对话
    _contentView.alpha = 0;
    _contentView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    
    [UIView animateWithDuration:0.3f animations:^{
        _contentView.alpha = 1.0;
        _contentView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    }];
    
    
    
    
    
  
    
    
}
//关闭
-(void)closeView{
    [UIView animateWithDuration:0.3f animations:^{
        _contentView.alpha = 0;
        _contentView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    

}


@end
