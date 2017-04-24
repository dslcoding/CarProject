//
//  DSLHUB.m
//  DSLHUDTools
//
//  Created by 董诗磊 on 2017/4/10.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "DSLHUD.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
static DSLHUD *dslHub = nil;

static const CGFloat DSLHUDDefaultHeight = 70;

static const CGFloat LableDefaultHeight  = 25;

static const CGFloat ImageDefaultHeight  = DSLHUDDefaultHeight / 2;


//键盘的扩展的高度是280
static const CGFloat KeyBoardDefaultHeight = 280;



@interface DSLHUD ()


@property (nonatomic ,strong) UIImageView * hudImage;

@property (nonatomic ,strong) UILabel * hudLabel;

@property (nonatomic ,strong) NSTimer * hudTimer;


@end

@implementation DSLHUD

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIImageView *)hudImage
{

    if (_hudImage == nil) {
        
        _hudImage = [[UIImageView alloc]init];
        
       
        
        [self addSubview:_hudImage];

        
    }

    return _hudImage;
}

- (UILabel * )hubLabel
{


    if (_hudLabel == nil) {
        
        _hudLabel = [[UILabel alloc]init];
        
        _hudLabel.textAlignment = NSTextAlignmentCenter;
        
        _hudLabel.textColor = [UIColor whiteColor];
        
        
        [self addSubview:_hudLabel];


        
    }
    return _hudLabel;
}
+ (DSLHUD *)shareDSLHUD{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dslHub = [[DSLHUD alloc]init];
    });


    return dslHub;
}

#pragma mark 只有图片的类型
- (void)showHUDWithImage:(UIImage*)hubimage
                SuperView:(UIView *)superView
           HudDismissTiem:(CGFloat )time
HudDismissBlock:(void(^)())dismissBlockblock;{

   
    [self showHUDWithStatus:IMAGE Text:nil SuperView:superView FontSize:0 HudImage:hubimage DismissTiem:time HudDismissBlock:dismissBlockblock];
   
}

#pragma mark 只有文字的类型
- (void)showHUDWithLable:(NSString *)text
               SuperView:(UIView *)superView
                FontSize:(CGFloat)fontsize
          HudDismissTiem:(CGFloat )time
HudDismissBlock:(void(^)())dismissBlockblock;
 {
    
    
    [self showHUDWithStatus:TEXT Text:text SuperView:superView FontSize:fontsize HudImage:nil DismissTiem:time HudDismissBlock:dismissBlockblock];
    
}

#pragma mark 图片和文字的合成类型
- (void)showHUDWithImageAndLabel:(HudType)type
                            Text:(NSString *)text
                       SuperView:(UIView *)superView
                        FontSize:(CGFloat )fontsize
                        HudImage:(UIImage *)hubimage
                  HudDismissTiem:(CGFloat )time HudDismissBlock:(void(^)())dismissBlockblock{
    
    //为了不影响效果我这里做个限制字体最小为13.或者自己修改
    CGFloat fontS = fontsize >13? fontsize:13;
    
  [self showHUDWithStatus:IMAGEANDTEXT Text:text SuperView:superView FontSize:fontS HudImage:hubimage DismissTiem:time HudDismissBlock:dismissBlockblock];
    
}



/**
 总的方法
 
 @param text 描述性内容
 @param superView 键盘扩展，无法访问window，所以要传一个父识图
 @param fontsize 字体大小
 @param hubimage 是否带提示的图片
 */


- (void)showHUDWithStatus:(HudType)type
                         Text:(NSString *)text
                    SuperView:(UIView *)superView
                 FontSize:(CGFloat )fontsize
                 HudImage:(UIImage *)hubimage
              DismissTiem:(CGFloat )time
               HudDismissBlock:(void(^)())dismissBlockblock{
    
    
    
    
    CGSize textCGsize = [self lengthWithText:text fontSize:fontsize];
    
    UIColor *blockColor = [UIColor blackColor];
    
    self.backgroundColor = [blockColor colorWithAlphaComponent:0.75];
    
    self.layer.cornerRadius = 10;
    
    self.layer.masksToBounds = YES;
    
    CGFloat hudWight = textCGsize.width + ImageDefaultHeight;
    
    if (type == IMAGEANDTEXT) {
        
        self.hudImage.hidden = NO;
        
        self.hudLabel.hidden = NO;
        
        self.bounds = CGRectMake(0, 0, hudWight, textCGsize.height + DSLHUDDefaultHeight);
        
        self.hubLabel.bounds = CGRectMake(0, 0, hudWight, LableDefaultHeight);
        
        self.hubLabel.center = CGPointMake(hudWight / 2, DSLHUDDefaultHeight + 2);
        
        self.hudImage.bounds = CGRectMake(0, 0, DSLHUDDefaultHeight/2, DSLHUDDefaultHeight/2);
        
        self.hudImage.center = CGPointMake(hudWight / 2, DSLHUDDefaultHeight/2);
        
        self.hudImage.image = hubimage;


    }else if(type == TEXT){
        
      
        
        CGFloat height = textCGsize.height >40 ? textCGsize.height:40;
    
        self.hudImage.hidden = YES;
        
        self.hudLabel.hidden = NO;
        
        self.bounds = CGRectMake(0, 0, hudWight, height);
        
        self.hubLabel.bounds = CGRectMake(0, 0, hudWight, height);
        
        self.hubLabel.center = CGPointMake(hudWight / 2, height /2);
        
    
    }else{
    
        
        self.bounds = CGRectMake(0, 0, DSLHUDDefaultHeight,  DSLHUDDefaultHeight);
        
        self.hudImage.hidden = NO;
        
        self.hubLabel.hidden = YES;
        
        self.hudImage.bounds = CGRectMake(0, 0, DSLHUDDefaultHeight/2, DSLHUDDefaultHeight/2);
        
        self.hudImage.center = CGPointMake(DSLHUDDefaultHeight / 2, DSLHUDDefaultHeight/2);
        
        self.hudImage.image = hubimage;
    

    }
    
    //关于这个如果是在keyboarded等扩展项目中使用的话，就是280，我只是建议是280.如果不是的就是全屏的高度，这个默认是全屏的高度。
   
    
    self.center = CGPointMake(SCREEN_WIDTH/2, KeyBoardDefaultHeight / 2);
    
    
    [superView addSubview:self];
    
    
    self.hubLabel.font = [UIFont systemFontOfSize:fontsize];
    
    self.hubLabel.text = text;
    
    self.hudTimer = [NSTimer timerWithTimeInterval:time target:self selector:@selector(hideTimer:) userInfo:dismissBlockblock repeats:NO];
    
    [[NSRunLoop mainRunLoop] addTimer:self.hudTimer forMode:NSRunLoopCommonModes];
    

}

- (void)hideTimer:(NSTimer *)timer
{
    
   
    
        void(^block)() = timer.userInfo;
        
        if (block) {
            
            block();
        }


     [UIView animateWithDuration:0.5 animations:^{
         
         self.alpha = 0;
         
     }completion:^(BOOL finished) {
         
         
         [self.hudTimer invalidate];
         
         self.hudTimer = nil;
         
         self.alpha = 1;
         
         [self removeFromSuperview];
         
     }];



}



- (CGSize)lengthWithText:(NSString *)text fontSize:(CGFloat)fontsize{
    
    
    if (text.length != 0) {
        
        CGSize textCGsize =[text boundingRectWithSize:CGSizeMake(MAXFLOAT, fontsize) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:fontsize]} context:nil].size;
       
        NSLog(@"==+%@",NSStringFromCGSize(textCGsize));
        
        return textCGsize;

        
    }else{
    
    
        return CGSizeMake(0, 0);
        
    }
 
   
}


@end
