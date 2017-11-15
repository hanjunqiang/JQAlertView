
//
//  JQAlertView.m
//  UITableView自适应高度-01
//
//  Created by 韩军强 on 2017/11/15.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import "JQAlertView.h"

@implementation JQAlertView


-(void)initWithTitle:(NSString *)title message:(NSString *)message othersTitle:(NSArray *)othersArray style:(JQAlertViewStyle)style clickBlock:(ClickBlock)clickBlock
{
    
    UIAlertControllerStyle jq_style = style==JQAlertViewStyleAlert? UIAlertControllerStyleAlert:UIAlertControllerStyleActionSheet;
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:jq_style];
    
    for (int i = 0; i<othersArray.count; i++) {
        
        UIAlertActionStyle actionStyle;
        if (i==0) {
            actionStyle = UIAlertActionStyleDestructive;
        }else if (i == othersArray.count-1){
            actionStyle = UIAlertActionStyleCancel;
        }else{
            actionStyle = UIAlertActionStyleDefault;
        }
        
        [alertVC addAction:[UIAlertAction actionWithTitle:othersArray[i] style:actionStyle handler:^(UIAlertAction * _Nonnull action) {

//            NSLog(@"test---%d",i);
            if (clickBlock) {
                clickBlock(i);
            }
            
        }]];
        
        
    }
    
    //弹出弹框
    [[self jq_currentVC] presentViewController:alertVC animated:YES completion:nil];
    
}

#pragma mark - 获取当前控制器
- (UIViewController *)jq_currentVC{
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    // modal
    if (vc.presentedViewController) {
        if ([vc.presentedViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navVc = (UINavigationController *)vc.presentedViewController;
            vc = navVc.visibleViewController;
        }
        else if ([vc.presentedViewController isKindOfClass:[UITabBarController class]]){
            UITabBarController *tabVc = (UITabBarController *)vc.presentedViewController;
            if ([tabVc.selectedViewController isKindOfClass:[UINavigationController class]]) {
                UINavigationController *navVc = (UINavigationController *)tabVc.selectedViewController;
                return navVc.visibleViewController;
            }
            else{
                return tabVc.selectedViewController;
            }
        }
        else{
            vc = vc.presentedViewController;
        }
    }
    // push
    else{
        if ([vc isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tabVc = (UITabBarController *)vc;
            if ([tabVc.selectedViewController isKindOfClass:[UINavigationController class]]) {
                UINavigationController *navVc = (UINavigationController *)tabVc.selectedViewController;
                return navVc.visibleViewController;
            }
            else{
                return tabVc.selectedViewController;
            }
        }
        else if([vc isKindOfClass:[UINavigationController class]]){
            UINavigationController *navVc = (UINavigationController *)vc;
            vc = navVc.visibleViewController;
        }
    }
    return vc;
}



@end
