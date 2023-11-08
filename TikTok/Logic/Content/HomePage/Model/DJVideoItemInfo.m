//
//  DJVideoItemInfo.m
//  TikTok
//
//  Created by 邓杰 on 2023/9/26.
//

#import "DJVideoItemInfo.h"
#import "DJScreen.h"
#import "DJVideoItemView.h"

@implementation DJVideoItemInfo

- (instancetype)init {
    self = [super init];
    if (self) {
        _avatarURL = @"bg3";
        _likeNumber = @"4252";
        _commemtNumber = @"5315";
        _favariteNumber = @"3114";
        _transmitNumber = @"1531";
        _userName = @"aaaa";
        _describe = @"hello";
        
    }
    return self; 
}

+ (void)resetVideoInfo:(DJVideoItemInfo *)videoInfo view:(DJVideoItemView *)videoItemView {
    
    [videoItemView.profileBtn setBackgroundImage:[UIImage imageNamed:videoInfo.avatarURL] forState:UIControlStateNormal];
    [videoItemView.likeCount setText:[NSString stringWithFormat:@"%@", videoInfo.likeNumber]];
    [videoItemView.commentCount setText:[NSString stringWithFormat:@"%@", videoInfo.commemtNumber]];
    [videoItemView.favoriteCount setText:[NSString stringWithFormat:@"%@", videoInfo.favariteNumber]];
    [videoItemView.transmitCount setText:[NSString stringWithFormat:@"%@", videoInfo.transmitNumber]];
    
    [videoItemView.describe setText:videoInfo.describe];
    CGSize describe_size = [videoItemView.describe sizeThatFits:CGSizeMake(SCREEN_WIDTH - 120, MAXFLOAT)];
    [videoItemView.describe setFrame:CGRectMake(15,
                                                VIEW_Y(videoItemView.progressBar) - describe_size.height - 15,
                                                describe_size.width,
                                                describe_size.height)];
    [videoItemView.username setText:videoInfo.userName];
    CGSize username_size = [videoItemView.username sizeThatFits:CGSizeMake(MAXFLOAT, 25)];
    [videoItemView.username setFrame:CGRectMake(15, VIEW_Y(videoItemView.describe) - 32, username_size.width, 25)];
    
    [videoItemView.videoPlayerView layoutWithVideoCoverUrl:videoInfo.videoCoverURL videoUrl:videoInfo.videoURL];
    
}


@end

