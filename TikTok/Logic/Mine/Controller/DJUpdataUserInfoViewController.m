//
//  DJUpdataUserInfoViewController.m
//  TikTok
//
//  Created by 邓杰 on 2023/9/4.
//

#import "DJUpdataUserInfoViewController.h"
#import "DJColor.h"
#import "DJScreen.h"
#import <TikTok_iOS_SDK/TikTok_iOS_SDK.h>


@interface DJUpdataUserInfoViewController ()
@property (nonatomic, strong, readwrite) DJUserInfoItem *itemsInfo;
@property (nonatomic, strong, readwrite) UIButton *finishButton;
@property (nonatomic, strong, readwrite) DJUser *user;
//@property (nonatomic, strong, readwrite) MMMineTextView *mineTextView;
@property (nonatomic, strong, readwrite) DJUserInfo *userInfo;

// 跟选择有关的button
@property (nonatomic, strong, readwrite) UIButton *pickChangeButton;
@property (nonatomic, strong, readwrite) UILabel *pickButtonLeftLabel;
@property (nonatomic, strong, readwrite) UILabel *pickButtonRightLabel;

// 跟修改头像有关
@property (nonatomic, strong, readwrite) UIImageView *headImageView;
@property (nonatomic, strong, readwrite) UIButton *pickPictureButton;

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
    
    [self.tabBarController.tabBar setHidden:YES];

    
}


#pragma mark - view 生命周期结束
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.tabBarController.tabBar setHidden:NO];
}


@end
