//
//  DJHomePageView.m
//  TikTok
//
//  Created by 邓杰 on 2023/9/22.
//

#import "DJHomePageView.h"
#import "DJVideoNavBar.h"
#import "DJScreen.h"

#define VIDEOTYPE_COUNT 5

@implementation DJHomePageView

- (void)loadHomePageView {
    
    // 加载rootScrollView
    self.homeScrollView = [[UIScrollView alloc] init];
    [self.homeScrollView setFrame:CGRectMake(0, 0, VIEW_WIDTH(self), VIEW_HEIGHT(self))];
    [self.homeScrollView setContentSize:CGSizeMake(VIEW_WIDTH(self) * VIDEOTYPE_COUNT, VIEW_HEIGHT(self))];
    [self.homeScrollView setAlwaysBounceHorizontal:YES];
    [self.homeScrollView setBounces:NO];
    [self.homeScrollView setPagingEnabled:YES];
    [self.homeScrollView setShowsVerticalScrollIndicator:NO];
    [self.homeScrollView setShowsHorizontalScrollIndicator:NO];
    
    
    // 加载 videoScrollView
    self.videoScrollViewArray = [NSMutableArray arrayWithCapacity:VIDEOTYPE_COUNT];
    for (int i = 0; i < VIDEOTYPE_COUNT; i++) {
        self.videoScrollViewArray[i] = [[DJVideoScrollView alloc] initWithFrame:CGRectMake(
                                                   VIEW_WIDTH(self.homeScrollView) * i,
                                                   0,
                                                   VIEW_WIDTH(self.homeScrollView),
                                                   VIEW_HEIGHT(self.homeScrollView))];
        [self.videoScrollViewArray[i] setAlwaysBounceVertical:YES];
        [self.videoScrollViewArray[i] loadVideoScrollView];
        [self.homeScrollView addSubview:self.videoScrollViewArray[i]];
    }
    self.videoScrollViewArray[0].backgroundColor = [UIColor grayColor];
    self.videoScrollViewArray[1].backgroundColor = [UIColor blueColor];
    self.videoScrollViewArray[4].backgroundColor = [UIColor greenColor];
    [self addSubview:self.homeScrollView];
    
    
    // 加载自定义navigationBar
    self.videoNavBar = [[DJVideoNavBar alloc] initWithFrame:CGRectMake(0, TOPSTATUSBAR_HEIGHT, SCREEN_WIDTH, NAVIGATION_HEIGHT)];
    [self.videoNavBar loadVideoNavBar];
    [self addSubview:self.videoNavBar];
    
}


@end
