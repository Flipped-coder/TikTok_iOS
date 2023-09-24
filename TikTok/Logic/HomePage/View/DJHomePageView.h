//
//  DJHomePageView.h
//  TikTok
//
//  Created by 邓杰 on 2023/9/22.
//

#import <UIKit/UIKit.h>
#import "DJVideoNavBar.h"
#import "DJVideoItem.h"
#import "DJVideoScrollView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DJHomePageView : UIView
@property (nonatomic, strong) DJVideoNavBar *videoNavBar;
@property (nonatomic, strong) UIScrollView *homeScrollView;
@property (nonatomic, strong) NSMutableArray<DJVideoScrollView *> *videoScrollViewArray;
@property (nonatomic, strong) DJVideoItem *videoItem;



- (void)loadHomePageView;

@end

NS_ASSUME_NONNULL_END
