//
//  PGStateButton.m
//  Pods
//
//  Created by ylin.yang on 2018/8/28.
//

#import "PGStateButton.h"

@interface PGStateButton ()

@property (strong, nonatomic) NSMutableDictionary *stateValue;

@end


@implementation PGStateButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initStateButton];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self _initStateButton];
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (self.state & UIControlStateHighlighted && self.disableHighlightedAction) {
        return;
    } else if (self.state & UIControlStateSelected && self.disableSelectedAction) {
        return;
    }
    [super sendAction:action to:target forEvent:event];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self _updateState];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self _updateState];
    if (selected && (self.state & UIControlStateSelected) && self.disableSelectedAction) {
        self.userInteractionEnabled = false;
    } else {
        self.userInteractionEnabled = true;
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self _updateState];
    if (highlighted && (self.state & UIControlStateHighlighted) && self.disableHighlightedAction) {
        self.userInteractionEnabled = false;
    } else {
        self.userInteractionEnabled = true;
    }
}

- (void)setLayerBorderColor:(UIColor *)color forState:(UIControlState)state {
    [self _setProp:@"layer.borderColor" value:color forState:state];
}

- (void)setLayerBorderWidth:(CGFloat)borderWidth forState:(UIControlState)state {
    [self _setProp:@"layer.borderWidth" value:@(borderWidth) forState:state];
}

- (void)setLayerShadowOffset:(CGSize )shadowOffset forState:(UIControlState)state {
    [self _setProp:@"layer.shadowOffset" value:@(shadowOffset) forState:state];
}

- (void)setLayerShadowRadius:(CGFloat )shadowRadius forState:(UIControlState)state {
    [self _setProp:@"layer.shadowRadius" value:@(shadowRadius) forState:state];
}

- (void)setLayerShadowOpacity:(CGFloat )shadowOpacity forState:(UIControlState)state {
    [self _setProp:@"layer.shadowOpacity" value:@(shadowOpacity) forState:state];
}

- (void)setLayerShadowColor:(UIColor *)color forState:(UIControlState)state {
    [self _setProp:@"layer.shadowColor" value:color forState:state];
}

- (void)setLayerCornerRadius:(CGFloat)cornerRadius forState:(UIControlState)state {
    [self _setProp:@"layer.cornerRadius" value:@(cornerRadius) forState:state];
}

- (void)setButtonProp:(NSString *)propName value:(id)value forState:(UIControlState)state {
    [self _setProp:propName value:value forState:state];
}

#pragma - mark private

- (void)_initStateButton {
    self.stateValue = [[NSMutableDictionary alloc] init];
}

- (void)_setProp:(NSString *)propName value:(id)value forState:(UIControlState)state {
    for (NSNumber *num in [self _stateList:state]) {
        NSMutableDictionary *prop = self.stateValue[num];
        if (!prop) {
            prop = [[NSMutableDictionary alloc] init];
            [self.stateValue setObject:prop forKey:num];
        }
        [prop setObject:value forKey:propName];
    }
    [self _updateState];
}

- (NSArray <NSNumber *>*)_stateList:(UIControlState)state {
    NSMutableArray *list = [NSMutableArray array];
    if (state == UIControlStateNormal) {
        [list addObject:@(UIControlStateNormal)];
    }
    if (state & UIControlStateSelected) {
        [list addObject:@(UIControlStateSelected)];
    }
    if (state & UIControlStateHighlighted) {
        [list addObject:@(UIControlStateHighlighted)];
    }
    if (state & UIControlStateDisabled) {
        [list addObject:@(UIControlStateDisabled)];
    }
    return list;
}

- (void)_updateState {
    NSNumber *num = @(self.state);
    NSMutableDictionary *prop = self.stateValue[num];
    for (NSString *key in prop.allKeys) {
        id val = prop[key];
        if ([val isKindOfClass:NSNull.class]) {
            continue;
        }
        if ([val isKindOfClass:UIColor.class] &&
            [key rangeOfString:@"layer."].location == 0) {
            val = (id)((UIColor *)val).CGColor;
        }
        [self setValue:val forKeyPath:key];
    }
}

@end
