//
//  TableViewController.m
//  debugging
//
//  Created by Hirad Motamed on 2015-07-30.
//  Copyright (c) 2015 Pendar Labs. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView* tableView;
@property (nonatomic, weak) IBOutlet UITextField* textField;
@property (nonatomic, strong) NSMutableArray* texts;

@end



@implementation TableViewController

-(IBAction)addCurrentMessage:(id)sender {
    NSString* newMsg = self.textField.text;
    NSIndexPath* targetIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.texts insertObject:newMsg atIndex:0];
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[targetIndexPath]
                          withRowAnimation:UITableViewRowAnimationLeft];
    [self.tableView endUpdates];
    
    self.textField.text = nil;
}


#pragma mark UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.texts count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault)
                                      reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = self.texts[indexPath.row];
    
    return cell;
}

@end
