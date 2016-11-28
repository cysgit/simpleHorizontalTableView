//
//  CYCollectionViewSeprator.m
//  CYHorizontalTableView
//
//  Created by chenyi on 16/11/28.
//  Copyright © 2016年 chenyi. All rights reserved.
//

#import "CYCollectionViewSeperator.h"

@implementation CYCollectionViewSeperator

+ (NSString *)kind
{
    return NSStringFromClass([self class]);
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
    }
    
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    self.frame = layoutAttributes.frame;
}

@end
