//
//  DANVersionsTableViewController.m
//  Day1
//
//  Created by morse on 1/3/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "DANVersionsTableViewController.h"
#import "DANVersionController.h"
#import "DANVersion.h"

@interface DANVersionsTableViewController ()

@end

@implementation DANVersionsTableViewController
// If this doesn't work, it *may* be because the controller is not initialized.
// Called when we create a ViewController from a Storyboard
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[DANVersionController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controller.versions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VersionCell" forIndexPath:indexPath];
    //    DANVersion *version = [self.controller.versions objectAtIndex:indexPath.row], // ]
    // [, [, ESC
    DANVersion *version = [self.controller.versions objectAtIndex:indexPath.row]; // ESC
    
    // Dot syntax
    cell.textLabel.text = version.name;
    cell.detailTextLabel.text = version.releaseDate;
    
    // Method call syntax (Original Obj-C syntax)
    [[cell textLabel] setText:[version name]];
    [[cell detailTextLabel] setText:[version releaseDate]];
    
    return cell;
}
 
@end
