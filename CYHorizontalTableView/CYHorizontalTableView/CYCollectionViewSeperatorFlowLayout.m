//
//  CYCollectionViewSeperatorFlowLayout.m
//  CYHorizontalTableView
//
//  Created by chenyi on 16/11/28.
//  Copyright © 2016年 chenyi. All rights reserved.
//

#import "CYCollectionViewSeperatorFlowLayout.h"
#import "CYCollectionViewSeperator.h"

const CGFloat kCollectionViewHeight = 170;

@implementation CYCollectionViewSeperatorFlowLayout

- (instancetype)init
{
    if(self = [super init]){
        [self setupParam];
    }
    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder]){
        [self setupParam];
    }
    return self;
}

- (void)setupParam
{
    [self registerClass:[CYCollectionViewSeperator class] forDecorationViewOfKind:[CYCollectionViewSeperator kind]];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 1.f;
    self.minimumInteritemSpacing = 0.0f;
    self.sectionInset = UIEdgeInsetsZero;
    
    self.headerReferenceSize = CGSizeZero;
    self.footerReferenceSize = CGSizeZero;
    
    self.itemSize = CGSizeMake(110, kCollectionViewHeight);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *layoutAttributes = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray *decorationAttributes = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes * attribute in layoutAttributes) {
        //add seperator for each cell
        if(attribute.representedElementCategory == UICollectionElementCategoryCell){
            UICollectionViewLayoutAttributes *decorationAttribute = [self layoutAttributesForDecorationViewOfKind:[CYCollectionViewSeperator kind] atIndexPath:attribute.indexPath];
            [decorationAttributes addObject:decorationAttribute];
        }
    }
    
    return [layoutAttributes arrayByAddingObjectsFromArray:decorationAttributes];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
    CGFloat decorationOffset = (indexPath.item + 1) * self.itemSize.width + indexPath.item * self.minimumLineSpacing;
    layoutAttributes.frame = CGRectMake(decorationOffset, kCollectionViewHeight * 0.2, self.minimumLineSpacing, kCollectionViewHeight * 0.6);//seperator frame setting here
    layoutAttributes.zIndex = 1000;
    
    return layoutAttributes;
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath {
    UICollectionViewLayoutAttributes *layoutAttributes =  [self layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:decorationIndexPath];
    return layoutAttributes;
}

@end
