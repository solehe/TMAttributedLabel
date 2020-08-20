//
//  ViewController.m
//  Demo
//
//  Created by solehe on 2020/8/20.
//  Copyright © 2020 solehe. All rights reserved.
//

#import "TMAttributedLabelHeader.h"
#import "TMAttributedLabel.h"
#import "ViewController.h"

@interface ViewController ()
<
    TMAttributedLabelDelegate
>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    TMAttributedLabel *label = [[TMAttributedLabel alloc] initWithFrame:CGRectMake(20, 100, 335, 180)];
    [label setBackgroundColor:[UIColor yellowColor]];
    [label setLinkHighlightColor:[UIColor redColor]];
    [label setLineSpacing:3.f];
    [label setNumberOfLines:0];
    [label setDelegate:self];
    [self.view addSubview:label];
    
    [label append:@"风急天高猿啸哀，\n"];
    [label append:@"渚清沙白鸟飞回。\n"];
    [label append:@"无边落木萧萧下，\n"];
    [label append:@"不尽长江滚滚来。\n"];
    [label append:@"万里悲秋常作客，\n"];
    [label append:@"百年多病独登台。\n"];
    [label append:@"艰难苦恨繁霜鬓，\n"];
    //[label append:@"潦倒新停浊酒杯。\n"];
    
    // 以顶部对齐的方式添加一个label
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectZero];
    [label1 setText:@"潦倒新停浊酒杯。"];
    
    CGFloat width = [label sizeThatFits:CGSizeMake(335, label.font.lineHeight)].width;
    [label1 setFrame:CGRectMake(0, 0, width, label.font.lineHeight+3)];
    
    [label append:label1 alignment:TMAttributedAlignmentTop];
    
    // 重新计算尺寸
    CGSize size = [label sizeThatFits:CGSizeMake(335, 180)];
    [label setFrame:CGRectMake(20, 100, size.width, size.height)];
    
    // 添加链接
    NSString *linkString = @"无边落木萧萧下，";
    NSRange range = [label.text rangeOfString:linkString];
    [label addCustomLink:linkString forRange:range color:[UIColor blueColor]];
}

#pragma mark - TMAttributedLabelDelegate

- (void)attributedLabel:(TMAttributedLabel *)label clickedOnLink:(id)linkData {
    NSLog(@"点击了链接：%@", linkData);
}

@end
