//
//  KTNavbar.m
//  KTNavBar
//
//  Created by Super on 2022/3/29.
//

#import "KTNavBar.h"
#import "KTMacro.h"
@interface KTNavBar ()
@property(nonatomic, strong) UIButton *leftBtn;
@property(nonatomic, strong) UIButton *rightBtn;
@property(nonatomic, strong) UILabel *titleLabel;
@end

@implementation KTNavBar


- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.frame = CGRectMake(0, 0, KScreenWidth,KTopHeight);
        [self addSubview:self.titleLabel];
        [self addSubview:self.leftBtn];
        [self addSubview:self.rightBtn];
    }
    return self;
}
#pragma mark - privateMethods


- (UIImage *)getImageWithName:(NSString *)name type:( NSString * _Nullable)type {
    static NSBundle *resourceBundle = nil;
    if (!resourceBundle) {
        NSBundle *mainBundle = [NSBundle bundleForClass:self.class];
        NSString *resourcePath = [mainBundle pathForResource:@"KTNavBar" ofType:@"bundle"];
        resourceBundle = [NSBundle bundleWithPath:resourcePath] ?: mainBundle;
    }
    NSInteger scale = [[UIScreen mainScreen] scale];
    NSString *imageScaleName = [NSString stringWithFormat:@"%@@%zdx.%@",name,scale,type?type:@"png"];
    
    UIImage *  image = [UIImage imageNamed:imageScaleName inBundle:resourceBundle compatibleWithTraitCollection:nil];
    return image;
}
 
- (void)backAction {
    if (self.leftAction) {
        self.leftAction();
    }
}


- (void)rightBtnClick {
    if (self.rightAction) {
        self.rightAction();
    }
}

#pragma mark - setters

- (void)setTitle:(NSString *)title {
    _title = title;
    _titleLabel.text = title;
}

-(void)setBackImage:(UIImage *)backImage {
    _backImage = backImage;
    [self.leftBtn setImage:backImage forState:UIControlStateNormal];
}

- (void)setRightImage:(UIImage *)rightImage {
    _rightImage = rightImage;
    [self.rightBtn setImage:rightImage forState:UIControlStateNormal];
}

- (void)setRightMargin:(CGFloat)rightMargin {
    _rightMargin = rightMargin;
    
    CGRect frame = self.rightBtn.frame;
    frame.origin.x = KScreenWidth - rightMargin - CGRectGetWidth(self.rightBtn.frame);
    self.rightBtn.frame = frame;

}

- (void)setLeftMargin:(CGFloat)leftMargin {
    _leftMargin = leftMargin;
    
    CGRect frame = self.leftBtn.frame;
    frame.origin.x = leftMargin;
    self.leftBtn.frame = frame;

}

#pragma mark - getters

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth/2, 44)];
        _titleLabel.center = CGPointMake(self.center.x, KStatusBarHeight +22);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc]init];
        [_leftBtn setImage:[self getImageWithName:@"nav_icon_back" type:@"png"] forState:UIControlStateNormal];
        _leftBtn.frame = CGRectMake(0, 0, 30, 44);
        _leftBtn.center = CGPointMake(30, KStatusBarHeight +22);
        [_leftBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}


- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc]init];
        _rightBtn.frame = CGRectMake(0, 0, 30, 44);
        _rightBtn.center = CGPointMake(KScreenWidth-30, KStatusBarHeight +22);
        [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}
@end
