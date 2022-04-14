//
//  KTNavbar.h
//  KTNavBar
//
//  Created by Super on 2022/3/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//test
typedef void(^btnAction)(void);

@interface KTNavBar : UIView

@property(nonatomic, assign) BOOL userCustomBackGroudView; //是否使用自定义背景


@property(nonatomic, strong) UIImage *backImage; //左边按钮图片

@property(nonatomic, strong) UIImage *rightImage; //右边按钮图片

@property(nonatomic, copy) btnAction leftAction; //左边响应事件

@property(nonatomic, copy) btnAction rightAction; //右边响应事件


@property(nonatomic, copy) NSString *title; //中间title

@property(nonatomic, strong) UIColor *titleColor; //标题颜色

@property(nonatomic, strong) UIFont *titleFont; //标题字体

@property(nonatomic, assign) CGFloat leftMargin; //左边边距

@property(nonatomic, assign) CGFloat rightMargin; //右边边距


@end

NS_ASSUME_NONNULL_END
