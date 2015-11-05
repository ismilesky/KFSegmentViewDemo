//
//  UIImage+Fit.m
//
#import "UIImage+Fit.h"

@implementation UIImage (Fit)

#pragma mark 返回拉伸好的图片
+ (UIImage *)resizeImage:(NSString *)imgName {
    return [[UIImage imageNamed:imgName] resizeImage];
}

- (UIImage *)resizeImage
{
    CGFloat leftCap = self.size.width * 0.5f;
    CGFloat topCap = self.size.height * 0.5f;
    return [self stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
}
@end
