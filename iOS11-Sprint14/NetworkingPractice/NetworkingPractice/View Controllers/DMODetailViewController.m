//
//  ViewController.m
//  NetworkingPractice
//
//  Created by morse on 1/23/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "DMODetailViewController.h"
#import "DMOClubController.h"
#import "DMOClub.h"

@interface DMODetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITextView *aboutTextView;


@end

@implementation DMODetailViewController

// FIXME: if founded = 0, display "Not available"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.searchBar setDelegate:self];
    [self updateViews];
}

- (void)updateViews {
    
    self.nameLabel.text = self.club.name;
    self.aboutTextView.text = self.club.about;
    self.timeLabel.text = [self timeString];
}

- (NSString *)timeString {
    if (self.club.time != 0) {
        return [NSString stringWithFormat:@"%i", self.club.time];
    } else {
        return @"Not available";
    }
}

- (IBAction)saveTapped:(id)sender {
    if (self.club) {
        NSLog(@"saveTapped");
        [self.clubController saveClub:self.club];
        [self.navigationController popViewControllerAnimated:true];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchTerm = searchBar.text;
    
    [self.clubController searchForClubWithName:searchTerm completion:^(DMOClub *club, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Club: %@, Error: %@", club.name, error);
            self.club = club;
            [self updateViews];
            NSLog(@"called!");
        });
    }];
}



@end
