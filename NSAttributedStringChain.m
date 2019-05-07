//
//  NSAttributedStringChain.m
//  EasyAttributedString
//
//  Created by 余汪送 on 2019/4/30.
//  Copyright © 2019 capsule. All rights reserved.
//

#define NSAttributedStringChainMethodImplementation(type, name, ...) \
- (NSAttributedStringChain *(^)(type name))name { \
    __weak typeof(self) weakself = self;\
    return ^(type name) { \
        __strong typeof(weakself) self = weakself;\
        @autoreleasepool __VA_ARGS__\
        return self; \
    }; \
}

#import "NSAttributedStringChain.h"

@interface NSAttributedStringChain ()
@property (nonatomic, strong) NSMutableArray<NSMutableAttributedString *> *attributedStringList;
@end

@implementation NSAttributedStringChain

#pragma mark private
- (NSMutableArray<NSMutableAttributedString *> *)attributedStringList {
    if (!_attributedStringList) {
        _attributedStringList = [NSMutableArray array];
    }
    return _attributedStringList;
}

- (NSAttributedStringChain *(^)(NSString *text))text {
    return ^(NSString *text) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:text];
        [self.attributedStringList addObject:attributedString];
        return self;
    };
}

- (void)addAttribute:(NSAttributedStringKey)name value:(id)value {
    NSMutableAttributedString *attributedString = self.attributedStringList.lastObject;
    NSRange range = NSMakeRange(0, attributedString.length);
    [attributedString addAttribute:name value:value range:range];
}

#pragma mark -- getter
- (NSAttributedString *)attributedString {
    if (_attributedStringList.count == 0) { return nil; }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithAttributedString:_attributedStringList.firstObject];
    for (NSInteger i = 1; i < _attributedStringList.count; i++) {
        NSAttributedString *subString = _attributedStringList[i];
        [attributedString appendAttributedString:subString];
    }
    return [attributedString copy];
}

NSAttributedStringChainMethodImplementation(UIFont *, font, {
    [self addAttribute:NSFontAttributeName value:font];
});
NSAttributedStringChainMethodImplementation(CGFloat, sysfontSize, {
    UIFont *font = [UIFont systemFontOfSize:sysfontSize];
    [self addAttribute:NSFontAttributeName value:font];
});
NSAttributedStringChainMethodImplementation(CGFloat, boldSysFontSize, {
    UIFont *font = [UIFont boldSystemFontOfSize:boldSysFontSize];
    [self addAttribute:NSFontAttributeName value:font];
});


NSAttributedStringChainMethodImplementation(UIColor *, textColor, {
    [self addAttribute:NSForegroundColorAttributeName value:textColor];
});
NSAttributedStringChainMethodImplementation(UIColor *, backgroundColor, {
    [self addAttribute:NSBackgroundColorAttributeName value:backgroundColor];
});


NSAttributedStringChainMethodImplementation(BOOL, strikethrough, {
    [self addAttribute:NSStrikethroughStyleAttributeName value:@(strikethrough)];
});
NSAttributedStringChainMethodImplementation(UIColor *, strikethroughColor, {
    [self addAttribute:NSStrikethroughColorAttributeName value:strikethroughColor];
});


NSAttributedStringChainMethodImplementation(BOOL, underline, {
    [self addAttribute:NSUnderlineStyleAttributeName value:@(underline)];
});
NSAttributedStringChainMethodImplementation(UIColor *, underlineColor, {
    [self addAttribute:NSUnderlineColorAttributeName value:underlineColor];
});

NSAttributedStringChainMethodImplementation(NSAttributedStringChainStyleBlock, paragraphStyle, {
    if (!paragraphStyle) { return self; }
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle(style);
    [self addAttribute:NSParagraphStyleAttributeName value:style];
    paragraphStyle = NULL;
});


NSAttributedStringChainMethodImplementation(CGFloat, kern, {
    [self addAttribute:NSKernAttributeName value:@(kern)];
});

NSAttributedStringChainMethodImplementation(CGFloat, ligature, {
    [self addAttribute:NSLigatureAttributeName value:@(ligature)];
});


NSAttributedStringChainMethodImplementation(UIColor *, strokeColor, {
    [self addAttribute:NSStrokeColorAttributeName value:strokeColor];
});
NSAttributedStringChainMethodImplementation(CGFloat, strokeWidth, {
    [self addAttribute:NSStrokeWidthAttributeName value:@(strokeWidth)];
});


NSAttributedStringChainMethodImplementation(NSAttributedStringChainStyleBlock, shadow, {
    if (!shadow) { return self; }
    NSShadow *style = [[NSShadow alloc]init];
    shadow(style);
    [self addAttribute:NSShadowAttributeName value:style];
    shadow = NULL;
});


NSAttributedStringChainMethodImplementation(NSString *, textEffect, {
    [self addAttribute:NSTextEffectAttributeName value:textEffect];
});

NSAttributedStringChainMethodImplementation(NSAttributedStringChainStyleBlock, attachment, {
    if (!attachment) { return self; }
    NSTextAttachment *style = [[NSTextAttachment alloc]init];
    attachment(style);
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithAttributedString:[NSAttributedString attributedStringWithAttachment:style]];
    [self.attributedStringList addObject:attributedString];
    attachment = NULL;
});

NSAttributedStringChainMethodImplementation(NSString *, link, {
    [self addAttribute:NSLinkAttributeName value:link];
});

NSAttributedStringChainMethodImplementation(CGFloat, baselineOffset, {
    [self addAttribute:NSBaselineOffsetAttributeName value:@(baselineOffset)];
});

NSAttributedStringChainMethodImplementation(BOOL, obliqueness, {
    [self addAttribute:NSObliquenessAttributeName value:@(obliqueness)];
});

NSAttributedStringChainMethodImplementation(CGFloat, expansion, {
    [self addAttribute:NSExpansionAttributeName value:@(expansion)];
});

NSAttributedStringChainMethodImplementation(CGFloat, verticalGlyphForm, {
    [self addAttribute:NSVerticalGlyphFormAttributeName value:@(verticalGlyphForm)];
});



@end



@implementation NSAttributedString (Chain)

+ (NSAttributedStringChain *)chain {
    NSAttributedStringChain *chain = [[NSAttributedStringChain alloc]init];
    return chain;
}

@end
