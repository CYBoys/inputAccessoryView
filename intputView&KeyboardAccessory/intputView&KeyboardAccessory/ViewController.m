//
//  ViewController.m
//  intputView&KeyboardAccessory
//
//  Created by chairman on 16/4/19.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "ViewController.h"
#import "Masonry.h"
#import "MMPlaceHolder.h"
#import "LYInputAccessoryView.h"

#define windowRect [UIScreen mainScreen].bounds

@interface ViewController ()

@property (nonatomic, strong) UITextField *textField;

//@property (nonatomic, strong) InputAccessoryView *inputAccessoryView;
@property (nonatomic, strong) LYInputAccessoryView *inputAccessoryView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.textField = [UITextField new];
    [self.view addSubview:self.textField];
    
    UIButton *button = [UIButton new];
    [self.view addSubview:button];
    [button setTitle:@"点我啊" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(responder) forControlEvents:UIControlEventTouchUpInside];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(CGSizeMake(100, 40));
    }];
    
    self.inputAccessoryView = [[LYInputAccessoryView alloc] initWithFrame: CGRectMake(0, 0, windowRect.size.width, 50)];
    
    self.textField.inputAccessoryView = self.inputAccessoryView;
    
}



- (void)responder{
    
    [self.textField becomeFirstResponder];
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    NSLog(@"text = %@",self.inputAccessoryView.textView.text);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
