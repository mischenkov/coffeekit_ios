//
//  MasterViewController.m
//  CoffeeKit
//
//  Created by Mischenkov Anatoly on 24/09/14.
//  Copyright (c) 2014 mischenkov.com. All rights reserved.
//

#import "MasterViewController.h"
#import "Venue.h"

#import "AFNetworking.h"
#import "RKObjectManager.h"
#import "RKResponseDescriptor.h"

#define kCLIENTID @"ZEV4UK1J4T4RWCN4TOIMNZIMUC1EQBC1EDSRSGL1MLTT1RXD"
#define kCLIENTSECRET @"5EYW1UAL1NAEQINRIMPXUKM4C5JST4CPKT3AQ50FW2VFY5KV"

@interface MasterViewController ()

@property (nonatomic, strong) NSArray *venues;

@end

@implementation MasterViewController

- (void)awakeFromNib {
	[super awakeFromNib];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self configureRestKit];
	[self loadVenues];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return _venues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

	Venue *venue = _venues[indexPath.row];
	cell.textLabel.text = venue.name;

	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return YES;
}

#pragma mark Helper functions

- (void)configureRestKit
{
	NSURL *baseURL = [NSURL URLWithString:@"https://api.foursquare.com"];
	AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
	
	// initialize RestKit
	RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
	
	// setup object mappings
	RKObjectMapping *venueMapping = [RKObjectMapping mappingForClass:[Venue class]];
	[venueMapping addAttributeMappingsFromArray:@[@"name"]];
	
	// register mappings with the provider using a response descriptor
	RKResponseDescriptor *responseDescriptor =
	[RKResponseDescriptor responseDescriptorWithMapping:venueMapping
												 method:RKRequestMethodGET
											pathPattern:@"/v2/venues/search"
												keyPath:@"response.venues"
											statusCodes:[NSIndexSet indexSetWithIndex:200]];
	[objectManager addResponseDescriptor:responseDescriptor];
}

- (void)loadVenues
{
	NSString *latLon = @"37.33, -122.03";
	NSString *clientID = kCLIENTID;
	NSString *clientSecret = kCLIENTSECRET;

	NSDictionary *queryParams = @{@"ll": latLon,
								  @"client_id":clientID,
								  @"client_secret":clientSecret,
								  @"categoryId": @"4bf58dd8d48988d1e0931735",
								  @"v":@"20140118"};
	[[RKObjectManager sharedManager] getObjectsAtPath:@"/v2/venues/search" parameters:queryParams success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
		_venues = mappingResult.array;
		[self.tableView reloadData];
	} failure:^(RKObjectRequestOperation *operation, NSError *error) {
		NSLog(@"Something goes wrong");
	}];
}
@end
