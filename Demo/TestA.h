//
//  Test.h
//  Demo
//
//  Created by Edmond on 2019/4/27.
//  Copyright © 2019 Edmond. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



/// Test Document Class
@interface Dog : NSObject

/// boolValue
@property (nonatomic, assign) BOOL isAnimal;

/// boolValue
/// @param enable aaaaa
- (void)barEnable:(BOOL)enable;



/// 让我们随便来写点什么.
///
/// @param bar 让我们随便来写点什么.
//- (id)fooBar:(NSString *)bar;


@end

NS_ASSUME_NONNULL_END

/**
 *  @discussion 提供以下功能：
 *  1. 支持让文字和图片自动跟随 tintColor 变化（系统的 UIButton 默认是不响应 tintColor 的）
 *  2. highlighted、disabled 状态均通过改变整个按钮的alpha来表现，无需分别设置不同 state 下的 titleColor、image。alpha 的值可在配置表里修改 ButtonHighlightedAlpha、ButtonDisabledAlpha。
 *  3. 支持点击时改变背景色颜色（highlightedBackgroundColor）
 *  4. 支持点击时改变边框颜色（highlightedBorderColor）
 *  5. 支持设置图片相对于 titleLabel 的位置（imagePosition）
 *  6. 支持设置图片和 titleLabel 之间的间距，无需自行调整 titleEdgeInests、imageEdgeInsets（spacingBetweenImageAndTitle）
 *  @warning QMUIButton 重新定义了 UIButton.titleEdgeInests、imageEdgeInsets、contentEdgeInsets 这三者的布局逻辑，sizeThatFits: 里会把 titleEdgeInests 和 imageEdgeInsets 也考虑在内（UIButton 不会），以使这三个接口的使用更符合直觉。
 */
@interface QMUIButton : UIButton


/**

 * 设置按钮里图标和文字的相对位置，默认为QMUIButtonImagePositionLeft<br/>
 * 可配合imageEdgeInsets、titleEdgeInsets、contentHorizontalAlignment、contentVerticalAlignment使用
 */
@property(nonatomic, assign) NSTextLayoutOrientation imagePosition;

@end
















