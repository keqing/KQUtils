//
//  KQHorizontalWaterfallCollectionViewLayout.h
//  KQUtils
//
//  Created by 柯青 on 2017/11/24.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    KQCollectionAlignStyleLeft,
    KQCollectionAlignStyleCenter,
    KQCollectionAlignStyleRight,
} KQCollectionAlignStyle;

@interface KQHorizontalWaterfallCollectionViewLayout : UICollectionViewFlowLayout

@property (assign, nonatomic) KQCollectionAlignStyle alignStyle;/**<横向瀑布流的对其样式*/



@end
