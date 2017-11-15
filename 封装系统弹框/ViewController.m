//
//  ViewController.m
//  封装系统弹框
//
//  Created by 韩军强 on 2017/11/15.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import "ViewController.h"
#import "JQAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //测试封装系统弹框
    UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 100, 100)];
    testBtn.backgroundColor = [UIColor redColor];
    
    [testBtn addTarget:self action:@selector(jq_clickBtnMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    
    
    //测试弹框中，添加编辑框
    UIButton *testBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(150, CGRectGetMaxY(testBtn.frame)+50, 100, 100)];
    testBtn2.backgroundColor = [UIColor greenColor];
    
    [testBtn2 addTarget:self action:@selector(jq_addTextFieldMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn2];

}

- (void)jq_clickBtnMethod {
    //中部弹框
    [[JQAlertView alloc] initWithTitle:@"提示" message:nil othersTitle:@[@"确定",@"取消"] style:(JQAlertViewStyleAlert) clickBlock:^(NSInteger index) {
        
        NSLog(@"test---%zd",index);
        
    }];
    
    //底部弹框
    [[JQAlertView alloc] initWithTitle:nil message:nil othersTitle:@[@"确定",@"取消"] style:(JQAlertViewStyleSheet) clickBlock:^(NSInteger index) {

        NSLog(@"test---%zd",index);

    }];
}

#pragma Mrhan- 测试弹框中，添加编辑框
- (void)jq_addTextFieldMethod {
    
    /**
        UIAlertController must have a title, a message or an action to display
     
         注意：
             1，UIAlertController至少有一个title/message/action
             2，UIAlertController添加textfield的时候，必须是UIAlertControllerStyleAlert类型，而不能是UIAlertControllerStyleActionSheet类型
     
    */
    UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"个人资料" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alerVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入姓名";
    }];
    [alerVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入年龄";
    }];
    [alerVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入性别";
    }];
    
    
    [alerVC addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textfield1 = alerVC.textFields[0];
        UITextField *textfield2 = alerVC.textFields[1];
        UITextField *textfield3 = alerVC.textFields[2];

        NSLog(@"textfield1-%@,textfield2-%@,textfield3-%@",textfield1.text,textfield2.text,textfield3.text);

    }]];
    
    [self presentViewController:alerVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
