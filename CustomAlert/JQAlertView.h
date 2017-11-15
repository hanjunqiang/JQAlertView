//
//  JQAlertView.h
//  UITableView自适应高度-01
//
//  Created by 韩军强 on 2017/11/15.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    JQAlertViewStyleAlert,  //中部弹框
    JQAlertViewStyleSheet   //底部弹框
    
} JQAlertViewStyle;

typedef void(^ClickBlock)(NSInteger index);

@interface JQAlertView : NSObject


/**
 自定义弹框JQAlertView，一行代码实行弹框：

 @param title 标题（可以为nil）
 @param message 子标题（可以为nil）
 @param othersArray 要展示的按钮
 @param style 弹框类型
 @param clickBlock 回调点击了第几个按钮
 
 注意：
     1，默认第一个按钮的类型为UIAlertActionStyleDestructive（显示红色）
     2，默认最后一个按钮的类型为UIAlertActionStyleCancel（蓝色）
     3，默认其他按钮的类型为UIAlertActionStyleDefault（蓝色）
 */
-(void)initWithTitle:(NSString *)title message:(NSString *)message othersTitle:(NSArray *)othersArray style:(JQAlertViewStyle)style clickBlock:(ClickBlock)clickBlock;


@end
