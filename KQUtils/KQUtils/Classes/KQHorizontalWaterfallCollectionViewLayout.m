//
//  KQHorizontalWaterfallCollectionViewLayout.m
//  KQUtils
//
//  Created by 柯青 on 2017/11/24.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import "KQHorizontalWaterfallCollectionViewLayout.h"
#import "UIView+KQFrame.h"

@interface KQHorizontalWaterfallCollectionViewLayout(){
    NSMutableArray<UICollectionViewLayoutAttributes*> *attributes;
}

@end

@implementation KQHorizontalWaterfallCollectionViewLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    [self initData];
}

- (void)initData {
    NSInteger left = -1;
    NSInteger right = -1;
    NSInteger width = 0;
    NSInteger section = 0;
    CGFloat lastX = self.collectionView.width;
    NSMutableArray<UICollectionViewLayoutAttributes*> *updateAttributes = [NSMutableArray array];
    [updateAttributes addObjectsFromArray:[super layoutAttributesForElementsInRect:self.collectionView.frame]];
    
    for (int i = 0; i < updateAttributes.count; i++) {
        UICollectionViewLayoutAttributes * attr = updateAttributes[i];
        if (attr.representedElementKind == nil) {
            section = attr.indexPath.section;
            if (attr.frame.origin.x
                 < lastX) {
                if (left != -1) {
                    //处理上一行的内容
                    updateAttributes = [self attributesForLeft:left right:right offset:[self callOffset:section width:width] originalAttributes:updateAttributes];
                }
                left = i;
                lastX = attr.frame.origin.x + [self evaluatedMinimumInteritemSpacingForSection:section];
                width = [self evaluatedSectionInsetForItem:section].left + [self evaluatedSectionInsetForItem:section].right - [self evaluatedMinimumInteritemSpacingForSection:section];
            }
            lastX = attr.frame.origin.x + attr.frame.size.width + [self evaluatedMinimumInteritemSpacingForSection:section];
            right = i;
            width += attr.frame.size.width + [self evaluatedMinimumInteritemSpacingForSection:section];
        }
    }
    
    //确保最后一行更新
    if (left != -1) {
        updateAttributes = [self attributesForLeft:left right:right offset:[self callOffset:section width:width] originalAttributes:updateAttributes];
    }
    attributes = updateAttributes;
}

- (NSMutableArray<UICollectionViewLayoutAttributes *> *)attributesForLeft:(NSInteger)left right:(NSInteger)right offset:(CGFloat)offset originalAttributes:(NSMutableArray<UICollectionViewLayoutAttributes *> *)attrs {
    CGFloat currentOffset = offset;
    NSMutableArray<UICollectionViewLayoutAttributes *> * updateAttr = attrs;
    for (NSInteger i = left; i <= right; i++) {
        UICollectionViewLayoutAttributes *attr = updateAttr[i];
        CGRect frame = attr.frame;
        frame.origin.x = currentOffset;
        attr.frame = frame;
        currentOffset += frame.size.width + [self evaluatedMinimumInteritemSpacingForSection:attr.indexPath.section];
        updateAttr[i] = attr;
    }
    return updateAttr;
}


- (CGFloat)callOffset:(NSInteger)section width:(CGFloat)width {
    CGFloat offset = [self evaluatedSectionInsetForItem:section].left;
    switch (self.alignStyle) {
        case KQCollectionAlignStyleLeft:
            offset = [self evaluatedSectionInsetForItem:section].left;
            break;
        case KQCollectionAlignStyleCenter:
            offset += self.collectionView.width - width;
            break;
        case KQCollectionAlignStyleRight:
            offset += (self.collectionView.width - width)/2;
            break;
    }
    return offset;
}
- (CGFloat)evaluatedMinimumInteritemSpacingForSection:(NSInteger)section {
    
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        id delegate = self.collectionView.delegate;
        return [delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:section];
    }
    return self.minimumLineSpacing;
}

- (UIEdgeInsets)evaluatedSectionInsetForItem:(NSInteger)index {
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        id delegate = self.collectionView.delegate;
        return [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:index];
    }
    return self.sectionInset;
}
@end
