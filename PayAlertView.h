//
//  PayAlertView.h
//  PayResultAlertView
//
//  Created by kuanter on 16/4/15.
//  Copyright © 2016年 kuanter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayAlertView : UIView
@property(nonatomic,strong)NSString*cityName;


-(id)initWithNSDictionary:(NSDictionary*)dic;

-(void)showWithCompletion:(void (^)(NSInteger selectIndex))completeBlock;


@end
