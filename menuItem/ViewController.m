//
//  ViewController.m
//  menuItem
//
//  Created by nacker 648959@qq.com on 15/9/29.
//  Copyright © 2015年 Shanghai Minlan Information & Technology Co ., Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:13];
    label.text = @"我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米我爱你,爱着你,就像老鼠爱大米";
    label.frame = CGRectMake(20, 100, 200, 200);
    label.userInteractionEnabled = YES;
    [self.view addSubview:label];
    self.label = label;
    
    
    [self attachTapHandler:self.label];
}

-(void)attachTapHandler:(UIView *)view
{
    UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    press.minimumPressDuration = 1.0;
    [view addGestureRecognizer:press];
}

- (void)handleTap:(UIGestureRecognizer *) recognizer
{
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:recognizer.view.frame inView:self.view];
    [menu setMenuVisible:YES animated:YES];
}

- (void)longPress:(UILongPressGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        
        UIMenuItem *flag = [[UIMenuItem alloc] initWithTitle:@"Flag" action:@selector(flag:)];
        UIMenuItem *approve = [[UIMenuItem alloc] initWithTitle:@"Approve" action:@selector(approve:)];
        UIMenuItem *deny = [[UIMenuItem alloc] initWithTitle:@"Deny" action:@selector(deny:)];
        
        UIMenuController *menu = [UIMenuController sharedMenuController];
        [menu setMenuItems:[NSArray arrayWithObjects:flag, approve, deny, nil]];
        [menu setTargetRect:recognizer.view.frame inView:self.view];
        [menu setMenuVisible:YES animated:YES];
    }
}

- (void)flag:(id)sender
{
    NSLog(@"flagged");
}

- (void)approve:(id)sender
{
    NSLog(@"approved");
}

- (void)deny:(id)sender
{
    NSLog(@"denied");
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(copy:)||action == @selector(flag:)||action == @selector(approve:)||action == @selector(deny:)) {
        return YES;
    }else{
        return NO;
    }
}

-(void)copy:(id)sender
{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.label.text;
}



@end
