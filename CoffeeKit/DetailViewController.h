//
//  DetailViewController.h
//  CoffeeKit
//
//  Created by Mischenkov Anatoly on 24/09/14.
//  Copyright (c) 2014 mischenkov.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

