//
//  ViewController.m
//  debugging
//
//  Created by Hirad Motamed on 2015-07-30.
//  Copyright (c) 2015 Pendar Labs. All rights reserved.
//

#import "Example1.h"
#import "Example1Modal.h"

@interface InternalObserver : NSObject
@property (nonatomic, weak) UIViewController* parent;
-(void)showAlert:(NSNotification*)notification;
@end

@implementation InternalObserver

-(void)showAlert:(NSNotification*)notification {
    
    NSString* msg = [NSString stringWithFormat:@"Hello World!"];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Coolsauce!" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self.parent presentViewController:alert animated:YES completion:nil];
}

@end



NSString* const ShowUserAlertNotification = @"show_user_alert_notification";

@interface Example1 ()

@property (nonatomic, strong) InternalObserver* observer;

@end

@implementation Example1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self initializeObserver];
    
    NSTimer* __unused timer = [NSTimer scheduledTimerWithTimeInterval:8
                                                               target:self
                                                             selector:@selector(emitNotification:)
                                                             userInfo:nil
                                                              repeats:YES];
}

-(void)initializeObserver {
    NSLog(@"Creating a new observer object! WOOT!");
    
    self.observer = [InternalObserver new];
    self.observer.parent = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self.observer
                                             selector:@selector(showAlert:)
                                                 name:ShowUserAlertNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)emitNotification:(NSTimer *)timer {
    NSLog(@"Posting the notification...");
    [[NSNotificationCenter defaultCenter] postNotificationName:ShowUserAlertNotification
                                                        object:nil];
}

-(IBAction)shakeThingsUp:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Example1Modal* modal = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([Example1Modal class])];
    [self presentViewController:modal animated:YES completion:nil];
}

@end
