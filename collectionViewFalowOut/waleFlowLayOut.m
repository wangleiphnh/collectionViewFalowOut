//
//  waleFlowLayOut.m
//  collectionViewFalowOut
//
//  Created by wale1994 on 16/6/27.
//  Copyright © 2016年 wale. All rights reserved.
//

#import "waleFlowLayOut.h"

@interface waleFlowLayOut ()
{
    NSInteger totalNum;
    NSMutableArray *layoutAttributes;
    CGPoint center;
    CGFloat radius;
}

@end


@implementation waleFlowLayOut
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        layoutAttributes=[NSMutableArray new];
        
    }
    return self;
}

/*
 collectionView每次需要重新布局(初始, layout 被设置为invalidated ...)的时候会首先调用
 这个方法prepareLayout()。所以Apple建议我们可以重写这个方法来为自定义布局做一些准备的操
 作,在cell比较少的情况下, 我们一般都可以在这个方法里面计算好所有的cell布局，并且缓存下来,
 在需要的时候直接取相应的值即可, 以提高效率。
 */
-(void)prepareLayout
{
    
    [super prepareLayout];
    totalNum=[self.collectionView numberOfItemsInSection:0];
    layoutAttributes=[NSMutableArray new];
    center=CGPointMake(self.collectionView.bounds.size.width*0.5, self.collectionView.bounds.size.height*0.5);
    radius=MIN(self.collectionView.bounds.size.width,self.collectionView.bounds.size.height)/3.0;
 
    for (NSInteger i=0; i<totalNum; i++) {
        NSIndexPath  *indexpath=[NSIndexPath indexPathForRow:i inSection:0];
        
        
        UICollectionViewLayoutAttributes *attributes=[self layoutAttributesForItemAtIndexPath:indexpath];
        
        [layoutAttributes addObject:attributes];
    }
    
    
    
}
/*
 需要设置collectionView 的滚动范围 collectionViewContentSize()，自定义的时候, 必须重写这个方法, 并且返回正确的滚动范围, collectionView才能正常的滚动
*/
-(CGSize)collectionViewContentSize
{
    
    
    return self.collectionView.bounds.size;
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
   
    
    return layoutAttributes;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
//自定义cell布局的时候重写
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attribute = [super layoutAttributesForItemAtIndexPath:indexPath];
    attribute.size = CGSizeMake(60, 60);
    
    CGFloat angle= 2.0 * (CGFloat)M_PI * (CGFloat)indexPath.row / (CGFloat)totalNum;
    attribute.center = CGPointMake(center.x+radius*cos(angle), center.y + radius*sin(angle));
    
    
    
    return attribute;
}
//自定义SupplementaryView的时候重写
//- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewLayoutAttributes *attribute = [super layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:indexPath];
//    return attribute;
//}
//自定义DecorationView的时候重写
//-(UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewLayoutAttributes *attribute=[super layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:indexPath];
//    return attribute;
//}
@end
