//
//  DJVideoItem.h
//  TikTok
//
//  Created by 邓杰 on 2023/9/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DJVideoItem : UIView
@property (nonatomic, strong) UIView *videoPlayerView;

@property (nonatomic, strong) UIButton *profileBtn;
@property (nonatomic, strong) UIButton *attentionBtn;

@property (nonatomic, strong) UIButton *followBtn;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UILabel *likeCount;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UILabel *commentCount;
@property (nonatomic, strong) UIButton *favoriteBtn;
@property (nonatomic, strong) UILabel *favoriteCount;
@property (nonatomic, strong) UIButton *transmitBtn;
@property (nonatomic, strong) UILabel *transmitCount;

@property (nonatomic, strong) UILabel *username;
@property (nonatomic, strong) UIButton *userBtn;
@property (nonatomic, strong) UILabel *describe;
@property (nonatomic, strong) UIView *progressBar;

- (void)loadVideoItem;

@end

NS_ASSUME_NONNULL_END
