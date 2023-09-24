//
//  DJHomePageViewController.m
//  TikTok
//
//  Created by 邓杰 on 2023/8/11.
//

#import "DJHomePageViewController.h"
#import "DJLoginViewController.h"
#import "DJHomePageView.h"
#import "DJScreen.h" 

@interface DJHomePageViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) DJHomePageView *homeView;

@end

@implementation DJHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor greenColor];
    
    
    self.homeView = [[DJHomePageView alloc] initWithFrame:CGRectMake(VIEW_X(self.view), VIEW_Y(self.view), VIEW_WIDTH(self.view), VIEW_HEIGHT(self.view) - TABBARFULL_HEIGHT)];
    [self.homeView loadHomePageView];
    [self.view addSubview:self.homeView];
    
    [self.homeView.homeScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 4, 0)];
    self.homeView.homeScrollView.delegate = self;
    self.homeView.videoScrollViewArray[2].delegate = self;
    

    // NavigationBar 按钮注册
    [self.homeView.videoNavBar.liveStreamingBtn addTarget:self action:@selector(clickLiveStreamingBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.homeView.videoNavBar.localBtn addTarget:self action:@selector(clickLocalBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.homeView.videoNavBar.attentionBtn addTarget:self action:@selector(clickAttentionBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.homeView.videoNavBar.friendBtn addTarget:self action:@selector(clickFriendBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.homeView.videoNavBar.recommendBtn addTarget:self action:@selector(clickRecommendBtn) forControlEvents:UIControlEventTouchUpInside];
    
    // VideoItem 按钮注册
    [self.homeView.videoScrollViewArray[4].videoItemsArray[0].attentionBtn addTarget:self action:@selector(clickAttentionUserBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.homeView.videoScrollViewArray[4].videoItemsArray[0].likeBtn addTarget:self action:@selector(clickLikeBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.homeView.videoScrollViewArray[4].videoItemsArray[0].favoriteBtn addTarget:self action:@selector(clickFavoriteBtn) forControlEvents:UIControlEventTouchUpInside];

    
}

#pragma mark --UIButton_callback - NavigationBar
- (void)clickLiveStreamingBtn {
    [UIView animateWithDuration:0.3 animations:^{
        self.homeView.videoNavBar.slider.frame = CGRectMake(LIVESTREAMING_CENTER_X(self.homeView.videoNavBar) - VIEW_WIDTH(self.homeView.videoNavBar.slider) / 2,
                                                            VIEW_Y(self.homeView.videoNavBar.slider),
                                                            VIEW_WIDTH(self.homeView.videoNavBar.slider),
                                                            VIEW_HEIGHT(self.homeView.videoNavBar.slider));
        [self.homeView.homeScrollView setContentOffset:CGPointMake(0, 0)];
    }];
}

- (void)clickLocalBtn {

    [UIView animateWithDuration:0.3 animations:^{
        self.homeView.videoNavBar.slider.frame = CGRectMake(LOCAL_CENTER_X(self.homeView.videoNavBar) - VIEW_WIDTH(self.homeView.videoNavBar.slider) / 2,
                                                            VIEW_Y(self.homeView.videoNavBar.slider),
                                                            VIEW_WIDTH(self.homeView.videoNavBar.slider),
                                                            VIEW_HEIGHT(self.homeView.videoNavBar.slider));
        [self.homeView.homeScrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0)];
    }];
}

- (void)clickAttentionBtn {
    [UIView animateWithDuration:0.3 animations:^{
        self.homeView.videoNavBar.slider.frame = CGRectMake(ATTENTION_CENTER_X(self.homeView.videoNavBar) - VIEW_WIDTH(self.homeView.videoNavBar.slider) / 2,
                                                            VIEW_Y(self.homeView.videoNavBar.slider),
                                                            VIEW_WIDTH(self.homeView.videoNavBar.slider),
                                                            VIEW_HEIGHT(self.homeView.videoNavBar.slider));
        [self.homeView.homeScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 2, 0)];
    }];
}

- (void)clickFriendBtn {
    [UIView animateWithDuration:0.3 animations:^{
        self.homeView.videoNavBar.slider.frame = CGRectMake(FRIEND_CENTER_X(self.homeView.videoNavBar) - VIEW_WIDTH(self.homeView.videoNavBar.slider) / 2,
                                                            VIEW_Y(self.homeView.videoNavBar.slider),
                                                            VIEW_WIDTH(self.homeView.videoNavBar.slider),
                                                            VIEW_HEIGHT(self.homeView.videoNavBar.slider));
        [self.homeView.homeScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 3, 0)];
    }];
}

- (void)clickRecommendBtn {
    [UIView animateWithDuration:0.3 animations:^{
        self.homeView.videoNavBar.slider.frame = CGRectMake(RECOMMEND_CENTER_X(self.homeView.videoNavBar) - VIEW_WIDTH(self.homeView.videoNavBar.slider) / 2,
                                                            VIEW_Y(self.homeView.videoNavBar.slider),
                                                            VIEW_WIDTH(self.homeView.videoNavBar.slider),
                                                            VIEW_HEIGHT(self.homeView.videoNavBar.slider));
        [self.homeView.homeScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 4, 0)];
    }];
}


#pragma mark --UIButton_callback - NavigationBar
- (void)clickAttentionUserBtn {
    [self.homeView.videoScrollViewArray[4].videoItemsArray[0].attentionBtn setHidden:YES];
}

- (void)clickLikeBtn {
    [self.homeView.videoScrollViewArray[4].videoItemsArray[0].likeBtn setBackgroundImage:[UIImage imageNamed:@"home_like_red"] forState:UIControlStateNormal];
}

- (void)clickFavoriteBtn {
    [self.homeView.videoScrollViewArray[4].videoItemsArray[0].favoriteBtn setBackgroundImage:[UIImage imageNamed:@"home_favorite_red"] forState:UIControlStateNormal];
}






#pragma mark --NSNotification
- (void)addLoginNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushLoginController) name:@"login" object:nil];
}


- (void)pushLoginController {
    UINavigationController *loginNC = nil;
    DJLoginViewController *loginVC = [[DJLoginViewController alloc] init];
    loginNC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    loginNC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationController presentViewController:loginNC animated:YES completion:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"login" object:nil];
}



#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    // 监听scrollView滑动
    self.homeView.videoNavBar.slider.center = CGPointMake(LIVESTREAMING_CENTER_X(self.homeView.videoNavBar) + (scrollView.bounds.origin.x / (SCREEN_WIDTH * 4)) * (RECOMMEND_CENTER_X(self.homeView.videoNavBar) - LIVESTREAMING_CENTER_X(self.homeView.videoNavBar)), VIEW_Y(self.homeView.videoNavBar.slider) + 1.5);
}




@end
