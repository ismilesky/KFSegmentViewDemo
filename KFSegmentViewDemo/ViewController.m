//
//  ViewController.m
//  KFSegmentViewDemo
//
//  Created by VS on 15/11/4.
//  Copyright © 2015年 VS. All rights reserved.
//

#import "ViewController.h"
#import "SegmentView.h"
#import "AViewController.h"
#import "BViewController.h"

#define kHight [UIScreen mainScreen].bounds.size.height

@interface ViewController () <SegmentViewDelegate>

@property(strong, nonatomic) SegmentView *segmentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 默认进入广场界面
    [self segmentView:self.segmentView didSelectedSegmentAtIndex:0];
    
    // 设置底部按钮
    self.segmentView = [[SegmentView alloc]initWithTitles:@[@"广场",@"社团"]];
    _segmentView.frame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44);
    _segmentView.backgroundColor = [UIColor blackColor];
    _segmentView.delegate = self;
    //    seg.center = CGPointMake(320/2, kBtnHeight/2);
    [self.view addSubview:_segmentView];
}

#pragma mark - SegmentViewDelegate
- (void)segmentView:(SegmentView *)segmentView didSelectedSegmentAtIndex:(NSInteger)index
{
    if (index == 0) {
        AViewController *AVC = [[AViewController alloc] init];
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, kHight - _segmentView.frame.size.height);
        [self setupChildViewController:AVC frame:frame title:@"广场"];
    } else if (index == 1){
        BViewController *BVC = [[BViewController alloc] init];
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, kHight - _segmentView.frame.size.height);
        [self setupChildViewController:BVC frame:frame title:@"社团"];
    }
}

/**
 *  初始化子控制器
 *
 *  @param VC    控制器
 *  @param frame frame
 *  @param title 标题
 */
- (void)setupChildViewController:(UIViewController *)VC frame:(CGRect)frame title:(NSString *)title
{
//    VC.title = title;
    VC.view.frame = frame;
    [self.view addSubview:VC.view];
    [self addChildViewController:VC];
    self.navigationItem.title = title;
}

@end
