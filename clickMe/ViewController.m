//
//  ViewController.m
//  clickMe
//
//  Created by Nitin Pabba on 3/18/15.
//  Copyright (c) 2015 Nitin Pabba. All rights reserved.
//

#import "ViewController.h"



@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
      self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    count = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%ld", (long)count];
    self.scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    self.timeLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    
    buttonTap = [self getImageUrlfromFileName:@"ButtonTap" type:@"wav"];
    countDown = [self getImageUrlfromFileName:@"SecondBeep" type:@"wav"];
    bgMusic = [self getImageUrlfromFileName:@"HallOfTheMountainKing" type:@"mp3"];

    // Intialization code
    seconds = 10;
    self.timeLabel.text = [NSString stringWithFormat:@"Time : %ld", (long)seconds];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target: self selector:@selector(subtractTime) userInfo:nil repeats:YES];
    [bgMusic play];
    
   // self.scoreLabel.back
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self viewDidLoad];
}

-(AVAudioPlayer*)getImageUrlfromFileName:(NSString*)file type:(NSString*)type{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    
    NSURL *url = [NSURL fileURLWithPath:path ];
    
    NSError *errorObject;
    
    AVAudioPlayer *audioPath = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&errorObject];
    
    if (!audioPath) {
        NSLog(@"%@",[errorObject description]);
    }
    
    return audioPath;
    

}

- (IBAction)clickMeButton:(id)sender {
    
    count++;

    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%ld", (long)count];
    [buttonTap play];
    
}

-(void)subtractTime
{
    seconds--;
    self.timeLabel.text =[NSString stringWithFormat:@"Time: %li",(long)seconds];
    [countDown play];
    if (seconds == 0)
    {
        [timer invalidate];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!"
                                                        message:[NSString stringWithFormat:@"You scored %li points", (long)count]
                                                       delegate:self
                                              cancelButtonTitle:@"Play Again"
                                              otherButtonTitles:nil];
        
        [alert show];
        [bgMusic stop];
        [self viewDidLoad];
    }
}

@end
