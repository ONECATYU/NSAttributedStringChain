//
//  NSAttributedStringChain.h
//  EasyAttributedString
//
//  Created by 余汪送 on 2019/4/30.
//  Copyright © 2019 capsule. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NSAttributedStringChainMethod(type, name) \
- (NSAttributedStringChain *(^)(type))name

typedef void(^NSAttributedStringChainStyleBlock)(id __nonnull);

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedStringChain : NSObject

@property (nonatomic, strong, readonly) NSAttributedString *attributedString;

- (NSAttributedStringChain *(^)(NSString *text))text;

//NSFontAttributeName(字体)
NSAttributedStringChainMethod(UIFont *, font);
NSAttributedStringChainMethod(CGFloat, sysfontSize);
NSAttributedStringChainMethod(CGFloat, boldSysFontSize);

//NSForegroundColorAttributeName(文本颜色)
NSAttributedStringChainMethod(UIColor *, textColor);

//NSBackgroundColorAttributeName(文本背景色)
NSAttributedStringChainMethod(UIColor *, backgroundColor);

//NSStrikethroughStyleAttributeName(删除线)
NSAttributedStringChainMethod(BOOL, strikethrough);
//NSStrikethroughColorAttributeName(删除线颜色)
NSAttributedStringChainMethod(UIColor *, strikethroughColor);

//NSUnderlineStyleAttributeName(下划线)
NSAttributedStringChainMethod(BOOL, underline);
//NSUnderlineColorAttributeName(下划线颜色)
NSAttributedStringChainMethod(UIColor *, underlineColor);

//NSParagraphStyleAttributeName
NSAttributedStringChainMethod(NSAttributedStringChainStyleBlock, paragraphStyle);

//NSKernAttributeName(字符间隔)
NSAttributedStringChainMethod(CGFloat, kern);

//NSLigatureAttributeName(连字符)
NSAttributedStringChainMethod(CGFloat, ligature);

//NSStrokeColorAttributeName(描边颜色)
NSAttributedStringChainMethod(UIColor *, strokeColor);
//NSStrokeWidthAttributeName(描边宽度)
NSAttributedStringChainMethod(CGFloat, strokeWidth);

//NSShadowAttributeName(阴影)(NSShadow *)
NSAttributedStringChainMethod(NSAttributedStringChainStyleBlock, shadow);

//NSTextEffectAttributeName(文字效果)
NSAttributedStringChainMethod(NSString *, textEffect);

//NSAttachmentAttributeName(文本附件)(NSTextAttachment *)
NSAttributedStringChainMethod(NSAttributedStringChainStyleBlock, attachment);

//NSLinkAttributeName(文本链接)
NSAttributedStringChainMethod(NSString *, link);

//NSBaselineOffsetAttributeName(基础偏移)
NSAttributedStringChainMethod(CGFloat, baselineOffset);

//NSObliquenessAttributeName(字体倾斜)
NSAttributedStringChainMethod(BOOL, obliqueness);

//NSExpansionAttributeName(字体扁平化)
NSAttributedStringChainMethod(CGFloat, expansion);

//NSVerticalGlyphFormAttributeName(垂直或者水平,0表示水平,1垂直)
NSAttributedStringChainMethod(CGFloat, verticalGlyphForm);

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (Chain)

+ (NSAttributedStringChain *)chain;

@end

NS_ASSUME_NONNULL_END
