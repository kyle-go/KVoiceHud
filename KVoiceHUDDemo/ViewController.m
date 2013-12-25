//
//  ViewController.m
//  KVoiceHUDDemo
//
//  Created by kyle on 13-12-25.
//  Copyright (c) 2013年 kyle. All rights reserved.
//

#import "ViewController.h"
#import "KVoiceHUD.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController {
    KVoiceHUD *_voiceHud;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _voiceHud = [[KVoiceHUD alloc] initWithParentView:self.view];
    _voiceHud.recordFilePath = [NSString stringWithFormat:@"%@/Documents/sound.caf", NSHomeDirectory()];
    [self.view addSubview:_voiceHud];
    
    // Set record start action for UIControlEventTouchDown
    [_button addTarget:self action:@selector(recordStart) forControlEvents:UIControlEventTouchDown];
    // Set record end action for UIControlEventTouchUpInside
    [_button addTarget:self action:@selector(recordEnd) forControlEvents:UIControlEventTouchUpInside];
    // Set record cancel action for UIControlEventTouchUpOutside
    [_button addTarget:self action:@selector(recordCancel) forControlEvents:UIControlEventTouchUpOutside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) recordStart
{
    [_voiceHud startRecording];
}

-(void) recordEnd
{
    [_voiceHud endRecording];
    NSLog(@"录音时长%f, 文件路径：%@", _voiceHud.recordTime, _voiceHud.recordFilePath);
}

-(void) recordCancel
{
    [_voiceHud endRecording];
    NSLog(@"取消了！！");
}

@end
