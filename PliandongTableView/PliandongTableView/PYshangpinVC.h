//
//  PYshangpinVC.h
//  PliandongTableView
//
//  Created by Apple on 16/7/14.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProductsDelegate <NSObject>

- (void)willDisplayHeaderView:(NSInteger)section;
- (void)didEndDisplayingHeaderView:(NSInteger)section;

@end

@interface PYshangpinVC : UIViewController

@property(nonatomic, weak) id<ProductsDelegate> delegate;/**< delegate */

/**
 *  当CategoryTableView滚动时,ProductsTableView跟随滚动至指定section
 *
 *  @param section
 */
- (void)scrollToSelectedIndexPath:(NSIndexPath *)indexPath;

@end
