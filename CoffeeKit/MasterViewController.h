//
//  MasterViewController.h
//  CoffeeKit
//
//  Created by Mischenkov Anatoly on 24/09/14.
//  Copyright (c) 2014 mischenkov.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController
@end

@interface VenueCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *checkinsLabel;
@end

