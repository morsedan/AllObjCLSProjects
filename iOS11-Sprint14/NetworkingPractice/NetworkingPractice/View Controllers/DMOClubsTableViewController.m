//
//  DMOClubsTableViewController.m
//  NetworkingPractice
//
//  Created by morse on 1/23/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "DMOClubsTableViewController.h"
#import "DMOClubController.h"
#import "DMOClub.h"
#import "DMODetailViewController.h"

@interface DMOClubsTableViewController ()

@end

@implementation DMOClubsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[DMOClubController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.controller loadFromPersistentStore];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    NSLog(@"viewWillAppear");
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.controller.savedClubs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClubCell" forIndexPath:indexPath];
    
    DMOClub *club = self.controller.savedClubs[indexPath.row];
    NSString *dateString = [self timeString:club];
    
    cell.textLabel.text = club.name;
    cell.detailTextLabel.text = dateString;
    
    return cell;
}

- (NSString *)timeString:(DMOClub *)club {
    if (club.time != 0) {
        return [NSString stringWithFormat:@"%i", club.time];
    } else {
        return @"Not available";
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (IBAction)addTapped:(id)sender {
    [self performSegueWithIdentifier:@"ShowDetailSegue" sender:self];
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    DMODetailViewController *detailVC = segue.destinationViewController;
    detailVC.clubController = self.controller;
    
    if ([segue.identifier isEqualToString:@"ShowClubDetailSegue"]) {
        DMOClub *club = self.controller.savedClubs[indexPath.row];
        detailVC.club = club;
    }
}


@end
