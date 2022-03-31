//
//  ViewController.h
//  NetworkingPractice
//
//  Created by morse on 1/23/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DMOClubController;
@class DMOClub;

@interface DMODetailViewController : UIViewController <UISearchBarDelegate>

@property DMOClubController *clubController;
@property DMOClub *club;


@end

