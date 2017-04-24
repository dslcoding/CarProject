//
//  DSLHUB.h
//  DSLHUDTools
//
//  Created by 董诗磊 on 2017/4/10.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

#define SCREEN_H ([[UIScreen mainScreen] bounds].size.heigh)

//hub类型
typedef enum : NSUInteger {
    IMAGE,
    TEXT,
    IMAGEANDTEXT
} HudType;


@interface DSLHUD : UIView
//单例
+ (DSLHUD *)shareDSLHUD;




#pragma mark 只有图片的类型
- (void)showHUDWithImage:(UIImage*)hubimage
               SuperView:(UIView *)superView
          HudDismissTiem:(CGFloat )time
HudDismissBlock:(void(^)())dismissBlockblock;

#pragma mark 只有文字的类型
- (void)showHUDWithLable:(NSString *)text
               SuperView:(UIView *)superView
                FontSize:(CGFloat)fontsize
          HudDismissTiem:(CGFloat )time
HudDismissBlock:(void(^)())dismissBlockblock;

#pragma mark 图片和文字的合成类型
- (void)showHUDWithImageAndLabel:(HudType)type
                            Text:(NSString *)text
                       SuperView:(UIView *)superView
                        FontSize:(CGFloat )fontsize
                        HudImage:(UIImage *)hubimage
                  HudDismissTiem:(CGFloat )time
                 HudDismissBlock:(void(^)())dismissBlockblock;
@end
