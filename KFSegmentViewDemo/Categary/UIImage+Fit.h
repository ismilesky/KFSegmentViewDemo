//
//  UIImage+Fit.h
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Fit)
#pragma mark 返回拉伸好的图片
+ (UIImage *)resizeImage:(NSString *)imgName;

- (UIImage *)resizeImage;
@end
