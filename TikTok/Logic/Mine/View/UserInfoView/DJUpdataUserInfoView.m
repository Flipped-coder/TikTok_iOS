//
//  DJUpdataUserInfoView.m
//  TikTok
//
//  Created by 邓杰 on 2023/9/6.
//

#import "DJUpdataUserInfoView.h"
#import "DJScreen.h"
#import "DJColor.h"

@implementation DJUpdataUserInfoView

- (void)loadUpdataUserInfoViewWithInfoType:(DJInfoType)infoType {
    CGRect viewFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    switch (infoType) {
        case DJInfoTypeAvatar:     self.childView = [[DJAvatarInfoView alloc] initWithFrame:viewFrame];        break;
        case DJInfoTypeNickname:   self.childView = [[DJNicknameInfoView alloc] initWithFrame:viewFrame];      break;
        case DJInfoTypeBirthday:   self.childView = [[DJBirthdayInfoView alloc] initWithFrame:viewFrame];      break;
        case DJInfoTypeGender:     self.childView = [[DJGenderInfoView alloc] initWithFrame:viewFrame];        break;
        case DJInfoTypeAddress:    self.childView = [[DJAddressInfoView alloc] initWithFrame:viewFrame];       break;
        case DJInfoTypeSignature:  self.childView = [[DJSignatureInfoView alloc] initWithFrame:viewFrame];     break;
        default: return;
    }
    
    [self addSubview:self.childView];
}

@end



@implementation DJAvatarInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


@end


@implementation DJNicknameInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:({
            _textView = [[UITextField alloc] initWithFrame:CGRectMake(15, 100, SCREEN_WIDTH - 30, 100)];
            _textView.borderStyle = UITextBorderStyleRoundedRect;
            _textView.placeholder = @"请输入新昵称";
            _textView.backgroundColor = LIGHT_GRAY;
            _textView.textColor = [UIColor blackColor];
            _textView.textAlignment = NSTextAlignmentLeft;
            _textView.font = [UIFont systemFontOfSize:15];
            _textView;
        })];
        
    }
    return self;
}

@end



@implementation DJBirthdayInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end



@implementation DJGenderInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end



@implementation DJAddressInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end



@implementation DJSignatureInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end


