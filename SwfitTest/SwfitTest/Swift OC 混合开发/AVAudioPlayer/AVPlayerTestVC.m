//
//  AVPlayerTestVC.m
//  SwfitTest
//
//  Created by fz on 2020/11/3.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

#import "AVPlayerTestVC.h"
#import <AVFoundation/AVFoundation.h>

@interface AVPlayerTestVC ()
{
    AVAudioRecorder *recorder;
    NSTimer *levelTimer;
}
@property(nonatomic,strong)UILabel *labelVoice;
@property(nonatomic,strong)CALayer *layerVoice;
@end

@implementation AVPlayerTestVC

- (UILabel *)labelVoice
{
    if (!_labelVoice)
    {
        _labelVoice = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 120, 50)];
        _labelVoice.backgroundColor = [UIColor orangeColor];
        
        self.layerVoice = [CALayer layer];
        self.layerVoice.backgroundColor = [[UIColor greenColor]CGColor];
        self.layerVoice.frame = _labelVoice.bounds;
        [_labelVoice.layer addSublayer:_layerVoice];
    }
    return _labelVoice;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.labelVoice];
       
      [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord withOptions:AVAudioSessionCategoryOptionDefaultToSpeaker | AVAudioSessionCategoryOptionMixWithOthers | AVAudioSessionCategoryOptionAllowBluetooth error:nil];
       
       /* 不需要保存录音文件 */
       NSURL *url = [NSURL fileURLWithPath:@"/dev/null"];
       
       NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithFloat: 44100.0], AVSampleRateKey,
                                 [NSNumber numberWithInt: kAudioFormatAppleLossless], AVFormatIDKey,
                                 [NSNumber numberWithInt: 2], AVNumberOfChannelsKey,
                                 [NSNumber numberWithInt: AVAudioQualityMax], AVEncoderAudioQualityKey,
                                 nil];
       
       NSError *error;
       recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
       if (recorder)
       {
           [recorder prepareToRecord];
           recorder.meteringEnabled = YES;
           [recorder record];
           levelTimer = [NSTimer scheduledTimerWithTimeInterval: 0.3 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: YES];
       }
       else
       {
           NSLog(@"%@", [error description]);
       }
}


/* 该方法确实会随环境音量变化而变化，但具体分贝值是否准确暂时没有研究 */
- (void)levelTimerCallback:(NSTimer *)timer {
    [recorder updateMeters];
    
    float   level;                // The linear 0.0 .. 1.0 value we need.
    float   minDecibels = -60.0f; // use -80db Or use -60dB, which I measured in a silent room.
    float   decibels    = [recorder averagePowerForChannel:0];
    
    if (decibels < minDecibels)
    {
        level = 0.0f;
    }
    else if (decibels >= 0.0f)
    {
        level = 1.0f;
    }
    else
    {
        float   root            = 5.0f; //modified level from 2.0 to 5.0 is neast to real test
        float   minAmp          = powf(10.0f, 0.05f * minDecibels);
        float   inverseAmpRange = 1.0f / (1.0f - minAmp);
        float   amp             = powf(10.0f, 0.05f * decibels);
        float   adjAmp          = (amp - minAmp) * inverseAmpRange;
        
        level = powf(adjAmp, 1.0f / root);
    }
    
    NSLog(@"音量等级%f" ,level);
    
    /* level 范围[0 ~ 1], 转为[0 ~120] 之间 */
    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"voice updated :%f",level * 120);
        self.layerVoice.frame = CGRectMake(0, 0, level * 120, 50);
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
