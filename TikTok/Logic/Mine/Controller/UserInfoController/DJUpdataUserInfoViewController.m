//
//  DJUpdataUserInfoViewController.m
//  TikTok
//
//  Created by 邓杰 on 2023/9/4.
//

#import "DJUpdataUserInfoViewController.h"
#import "DJUpdataUserInfoView.h"
#import "DJColor.h"
#import "DJScreen.h"
#import <TikTok_iOS_SDK/TikTok_iOS_SDK.h>


@interface DJUpdataUserInfoViewController ()
@property (nonatomic, strong, readwrite) DJUserInfoItem *itemsInfo;
@property (nonatomic, strong, readwrite) DJUser *user;
@property (nonatomic, strong, readwrite) DJUserInfo *userInfo;
@property (nonatomic, strong, readwrite) DJUpdataUserInfoView *updataView;



@end

@implementation DJUpdataUserInfoViewController

- (instancetype)initWithItemsInfo:(DJUserInfoItem *)infoItem {
    self = [super init];
    if (self) {
        _itemsInfo = infoItem;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationItem setTitle:self.itemsInfo.text];
    [self.navigationController.navigationBar setAlpha:1];
    
    self.updataView = [[DJUpdataUserInfoView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.updataView loadUpdataUserInfoViewWithInfoType:self.itemsInfo.infoType];
    [self.view addSubview:self.updataView];

    
}





@end
