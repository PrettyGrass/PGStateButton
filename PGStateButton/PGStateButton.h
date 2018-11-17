//
//  PGStateButton.h
//  Pods
//
//  Created by ylin.yang on 2018/8/28.
//

#import <UIKit/UIKit.h>

/// 带 layer 状态的按钮
@interface PGStateButton : UIButton

@property (assign, nonatomic) BOOL disableHighlightedAction;///< 禁用高亮状态的点击事件 默认false
@property (assign, nonatomic) BOOL disableSelectedAction;///< 禁用选中状态的点击事件 默认false

- (void)setLayerBorderColor:(UIColor *)color forState:(UIControlState)state;
- (void)setLayerBorderWidth:(CGFloat)borderWidth forState:(UIControlState)state;
- (void)setLayerShadowOffset:(CGSize )shadowOffset forState:(UIControlState)state;
- (void)setLayerShadowRadius:(CGFloat )shadowRadius forState:(UIControlState)state;
- (void)setLayerShadowOpacity:(CGFloat )shadowOpacity forState:(UIControlState)state;
- (void)setLayerShadowColor:(UIColor *)color forState:(UIControlState)state;
- (void)setLayerCornerRadius:(CGFloat)cornerRadius forState:(UIControlState)state;

/// 根据状态设置按钮属性
- (void)setButtonProp:(NSString *)propName value:(id)value forState:(UIControlState)state;

@end
