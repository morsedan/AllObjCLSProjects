//
//  PokemenTableViewController.m
//  ConcurrencyPractice
//
//  Created by morse on 1/28/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "DMOPokemenTableViewController.h"
#import "ConcurrencyPractice-Swift.h"
#import "DMOPokemonDetailViewController.h"
#import "DMOPokemon.h"

@interface DMOPokemenTableViewController ()

@property NSArray<DMOPokemon *> *pokemen;

@end

@implementation DMOPokemenTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadNames];
}

- (void)loadNames {
    [PokemonController.sharedController fetchAllPokemonWithCompletion:^(NSArray<DMOPokemon *> *pokemonNames, NSError *error) {
        
        if (error) {
            NSLog(@"%@", error);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.pokemen = pokemonNames;
            [self.tableView reloadData];
        });
    }];
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.pokemen.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Pokemon Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[NSString stringWithFormat:@"%@", self.pokemen[indexPath.row].name] capitalizedString];
    
    return cell;
}

 #pragma mark - Navigation
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
     DMOPokemon *pokemon = self.pokemen[indexPath.row];
     
     [PokemonController.sharedController fillInDetailsFor:pokemon];
 }

@end
