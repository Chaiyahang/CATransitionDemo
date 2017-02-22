//
//  ViewController.m
//  CATransitionDemo
//
//  Created by CYH on 2017/2/22.
//  Copyright © 2017年 Lianxi.com. All rights reserved.
//

#import "ViewController.h"

#define kAnimationDuration 0.5f

typedef NS_ENUM(NSUInteger, kCAAnimationType) {
    kCAAnimationTypeFade                   = 1,  //淡入淡出
    kCAAnimationTypePush                   = 2,  //推挤
    kCAAnimationTypeReveal                 = 3,  //揭开
    kCAAnimationTypeMoveIn                 = 4,  //覆盖
    kCAAnimationTypeCube                   = 5,  //立方体
    kCAAnimationTypeSuckEffect             = 6,  //吮吸
    kCAAnimationTypeOglFlip                = 7,  //翻转
    kCAAnimationTypeRippleEffect           = 8,  //波纹
    
    kCAAnimationTypePageCurl               = 9,  //翻页
    kCAAnimationTypePageUnCurl             = 10, //反翻页
    kCAAnimationTypeCameraIrisHollowOpen   = 11, //开镜头
    kCAAnimationTypeCameraIrisHollowClose  = 12, //关镜头
    kCAAnimationTypeCurlDown               = 13, //下翻页
    kCAAnimationTypeCurlUp                 = 14, //上翻页
    kCAAnimationTypeFlipFromLeft           = 15, //左翻转
    kCAAnimationTypeFlipFromRight          = 16, //右翻转
};

@interface ViewController ()

@property (nonatomic, assign) NSInteger subType;

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _subType = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addBgImageWithImageName:@"ca_back_image_one"];
}

- (IBAction)caTransitionBtnClicked:(UIButton *)sender {
    kCAAnimationType animationType = sender.tag;
    
    NSString *subtypeString;
    
    switch (_subType) {
        case 0:
            subtypeString = kCATransitionFromLeft;
            break;
        case 1:
            subtypeString = kCATransitionFromBottom;
            break;
        case 2:
            subtypeString = kCATransitionFromRight;
            break;
        case 3:
            subtypeString = kCATransitionFromTop;
            break;
    }
    _subType += 1;
    if (_subType > 3) {
        _subType = 0;
    }
    
    static int i = 0;
    if (i == 0) {
        [self addBgImageWithImageName:@"ca_back_image_one"];
        i = 1;
    }
    else {
        [self addBgImageWithImageName:@"ca_back_image_two"];
        i = 0;
    }
    
    switch (animationType) {
        case kCAAnimationTypeFade:
            [self transitionWithType:kCATransitionFade withSubtype:subtypeString forView:self.view];
            break;
            
        case kCAAnimationTypePush:
            [self transitionWithType:kCATransitionPush withSubtype:subtypeString forView:self.view];
            break;
            
        case kCAAnimationTypeReveal:
            [self transitionWithType:kCATransitionReveal withSubtype:subtypeString forView:self.view];
            break;
            
        case kCAAnimationTypeMoveIn:
            [self transitionWithType:kCATransitionMoveIn withSubtype:subtypeString forView:self.view];
            break;
            
        case kCAAnimationTypeCube:
            [self transitionWithType:@"cube" withSubtype:subtypeString forView:self.view];
            break;
            
        case kCAAnimationTypeSuckEffect:
            [self transitionWithType:@"suckEffect" withSubtype:subtypeString forView:self.view];
            break;
            
        case kCAAnimationTypeOglFlip:
            [self transitionWithType:@"oglFlip" withSubtype:subtypeString forView:self.view];
            break;
            
        case kCAAnimationTypeRippleEffect:
            [self transitionWithType:@"rippleEffect" withSubtype:subtypeString forView:self.view];
            break;
            
        case kCAAnimationTypePageCurl:
            [self transitionWithType:@"pageCurl" withSubtype:subtypeString forView:self.view];
            break;
            
        case kCAAnimationTypePageUnCurl:
            [self transitionWithType:@"pageUnCurl" withSubtype:subtypeString forView:self.view];
            break;
            
        case kCAAnimationTypeCameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" withSubtype:subtypeString forView:self.view];
            break;
            
        case kCAAnimationTypeCameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" withSubtype:subtypeString forView:self.view];
            break;
            
        case kCAAnimationTypeCurlDown:
            [self animationWithView:self.view withAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
            
        case kCAAnimationTypeCurlUp:
            [self animationWithView:self.view withAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
            
        case kCAAnimationTypeFlipFromLeft:
            [self animationWithView:self.view withAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
            
        case kCAAnimationTypeFlipFromRight:
            [self animationWithView:self.view withAnimationTransition:UIViewAnimationTransitionFlipFromRight];
            break;
    }
}

//背景色
- (void)addBgImageWithImageName:(NSString *)imageName{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
}

#pragma CATransition --- 动画实现
- (void)transitionWithType:(NSString *)type withSubtype:(NSString *)subtype forView:(UIView *)view{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    //设置运动时间
    animation.duration = kAnimationDuration;
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        //设置子类
        animation.subtype = subtype;
    }
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [view.layer addAnimation:animation forKey:@"animation"];
}

#pragma UIView --- 实现动画
- (void)animationWithView:(UIView *)view withAnimationTransition:(UIViewAnimationTransition)transition{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
