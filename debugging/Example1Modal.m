//
//  Example1Modal.m
//  debugging
//
//  Created by Hirad Motamed on 2015-07-30.
//  Copyright (c) 2015 Pendar Labs. All rights reserved.
//

#import "Example1Modal.h"
#import "Example1.h"

@implementation Example1Modal

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showAlert:) name:ShowUserAlertNotification object:nil];
}

-(void)showAlert:(NSNotification*)notification {
    
    NSString* msg = [NSString stringWithFormat:@"Hello World!"];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Coolsauce!" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

-(IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
