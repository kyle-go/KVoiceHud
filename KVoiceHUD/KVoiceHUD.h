
#import <UIKit/UIKit.h>

@interface KVoiceHUD : UIView

@property (nonatomic, strong) NSString *recordFilePath;
@property (nonatomic, assign) CGFloat recordTime;

- (id)initWithParentView:(UIView *)view;
- (void)startRecording;
- (void)endRecording;

//可选设置
//最长录音时间，默认60秒
- (void)setMaxRecordTime:(CGFloat)maxRecordTime;
- (void)setTips:(NSString *)tips;

@end

