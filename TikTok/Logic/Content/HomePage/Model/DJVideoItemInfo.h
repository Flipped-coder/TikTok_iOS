//
//  DJVideoItemInfo.h
//  TikTok
//
//  Created by 邓杰 on 2023/9/26.
//

#import <Foundation/Foundation.h>
#import "DJVideoItemView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DJVideoItemInfo : NSObject

@property (nonatomic, strong) NSString *videoURL;
@property (nonatomic, strong) NSString *videoCoverURL;
@property (nonatomic, strong) NSString *avatarURL;
@property (nonatomic, strong) NSString *likeNumber;
@property (nonatomic, strong) NSString *commemtNumber;
@property (nonatomic, strong) NSString *favariteNumber;
@property (nonatomic, strong) NSString *transmitNumber;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *describe;

@property (nonatomic) BOOL isLike;
@property (nonatomic) BOOL isFavarite;

+ (void)resetVideoInfo:(DJVideoItemInfo *)videoInfo view:(DJVideoItemView *)videoItemView;

@end

NS_ASSUME_NONNULL_END
