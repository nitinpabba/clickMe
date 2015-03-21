//
//  ViewController.h
//  clickMe
//
//  Created by Nitin Pabba on 3/18/15.
//  Copyright (c) 2015 Nitin Pabba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    NSInteger seconds;
    NSInteger count ;
    NSTimer *timer;
    
AVAudioPlayer *buttonTap;
    AVAudioPlayer *countDown;
    AVAudioPlayer *bgMusic;
    
}
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


- (IBAction)clickMeButton:(id)sender;
 -(void)subtractTime;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;



@end


