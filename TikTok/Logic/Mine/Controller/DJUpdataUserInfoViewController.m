//
//  DJUpdataUserInfoViewController.m
//  TikTok
//
//  Created by 邓杰 on 2023/9/4.
//

#import "DJUpdataUserInfoViewController.h"
#import "DJColor.h"

@interface DJUpdataUserInfoViewController ()
@property (nonatomic, strong, readwrite) DJUserInfoItem *itemsInfo;

@end

@implementation DJUpdataUserInfoViewController

- (instancetype)initWithItemsInfo:(DJUserInfoItem *)infoItem {
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController.navigationBar setAlpha:1];
        [self.tabBarController.tabBar setHidden:YES];
        
        self.itemsInfo = infoItem;
        self.view.backgroundColor = WECHAT_BACKGROUND_GREY;
        self.navigationItem.title = self.itemsInfo.text;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - view 生命周期结束
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.tabBarController.tabBar setHidden:NO];
}


@end
