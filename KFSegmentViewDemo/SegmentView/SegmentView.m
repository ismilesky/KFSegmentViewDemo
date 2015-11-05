//
//  SegmentView.m
//
//

#import "SegmentView.h"
#import "UIImage+Fit.h"
@interface MyButton: UIButton
@end

@implementation MyButton
- (void)setHighlighted:(BOOL)highlighted{}
@end

@interface SegmentView()
{
    UIButton *_currentBtn;
    UIButton *_preformBtn;
}
@end

@implementation SegmentView
- (id)initWithTitles:(NSArray *)titles
{
    CGRect frame=CGRectMake(0, 0, 320, 34);
    if (self = [super initWithFrame:frame]) {
        self.titles = titles;
        self.tag=100;
    }
    return self;
}

- (void)btnDown:(UIButton *)btn
{
    if (btn == _currentBtn) return;
    _currentBtn.selected = NO;
    btn.selected = YES;
    _currentBtn = btn;
    
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(segmentView:didSelectedSegmentAtIndex:)]) {
        [self.delegate segmentView:self didSelectedSegmentAtIndex:btn.tag];
    }
}

-(void)segemtBtnChange:(int)index
{
    UIButton *btn=(UIButton *)[self viewWithTag:index];
    if (btn == _currentBtn) return;
    _currentBtn.selected = NO;
    btn.selected = YES;
    _currentBtn = btn;
    
}


- (void)setTitles:(NSArray *)titles
{
    // 数组内容一致，直接返回
    if ([titles isEqualToArray:_titles]) return;
        
    _titles = titles;
    
    
    // 1.移除所有的按钮
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 2.添加新的按钮
    NSInteger count = titles.count;
    float btnWidth=320.0/count;
    if (count==3) {
        btnWidth=107;
    }
    
    for (int i = 0; i<count; i++) {
        MyButton *btn = [MyButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        
        // 设置按钮的frame
        btn.frame = CGRectMake(i * btnWidth, 0, btnWidth, kBtnHeight);
        NSString *normal = @"seg";
        NSString *selected = @"segselect";
        [btn setBackgroundImage:[UIImage resizeImage:normal] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage resizeImage:selected] forState:UIControlStateSelected];
        
        // 设置文字
        // btn.adjustsImageWhenHighlighted = NO;
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:243 green:243 blue:243 alpha:1] forState:UIControlStateNormal];

        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        // 设置监听器
        [btn addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchDown];
        // 设置选中
        if (i == 0) {
            [self btnDown:btn];
        }
        // 添加按钮
        [self addSubview:btn];
    }
    self.bounds = CGRectMake(0, 0, count * kBtnWidth, kBtnHeight);
}
@end
