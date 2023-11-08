//
//  DJVideoPlayerView.m
//  TikTok
//
//  Created by 邓杰 on 2023/11/6.
//

#import "DJVideoPlayerView.h"
#import <AVFoundation/AVFoundation.h>
#import "DJScreen.h"

@interface DJVideoPlayerView()
@property (nonatomic, strong, readwrite) UIImageView *coverView;
@property (nonatomic, strong, readwrite) UIImageView *playButton;
@property (nonatomic, copy, readwrite) NSString *videoUrl;
@property (nonatomic, strong) AVPlayer *avPlayer;

@end

@implementation DJVideoPlayerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150, frame.size.width, frame.size.height-300)];
            _coverView;
        })];
        
        [self addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50) / 2, (frame.size.height - 5) / 2, 50, 50)];
            _playButton;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

#pragma mark - private
- (void)_tapToPlay {
    NSLog(@"tapToPlay");
    [_playButton setHidden:YES];
    
    [_avPlayer play];
    
}


#pragma mark - public
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"Video_play"];
    _videoUrl = videoUrl;
    
    NSURL *videourl = [[NSURL alloc] initWithString:_videoUrl];
    
    AVAsset *asset = [AVAsset assetWithURL:videourl];
    
    NSArray *array = asset.tracks;
    //获取视频大小...不用之前的naturalSize 方法是因为被弃用了
    CGSize videoSize = CGSizeZero;
        for (AVAssetTrack *track in array) {
            if ([track.mediaType isEqualToString:AVMediaTypeVideo]) {
                CGSize realSize = CGSizeApplyAffineTransform(track.naturalSize, track.preferredTransform);
                videoSize = CGSizeMake(fabs(realSize.width), fabs(realSize.height));
            }
        }
    NSLog(@"width = %f,height = %f",videoSize.width,videoSize.height);
    
    if(videoSize.width != 0 && videoSize.height != 0)
        [_coverView setFrame:CGRectMake(0,
                                       (SCREEN_HEIGHT - TABBARFULL_HEIGHT - videoSize.height * SCREEN_WIDTH / videoSize.width) / 2,
                                        SCREEN_WIDTH,
                                        videoSize.height * SCREEN_WIDTH / videoSize.width)];

    
    
    
    
    AVPlayerItem *videoItem = [AVPlayerItem playerItemWithAsset:asset];
    _avPlayer = [AVPlayer playerWithPlayerItem:videoItem];
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    playerLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:playerLayer];
}





@end
