//
//  HistoryStore.m
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 09/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <Parse/Parse.h>
#import "HistoryStore.h"
#import "InstitutionStore.h"

@interface HistoryStore()

@end

@implementation HistoryStore

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Could not access instance. Use [HistoryStore sharedStore]" reason:@"This is a singleton class" userInfo:nil];
}

- (instancetype)initPrivate {
    return (self = [super init]);
}

+ (instancetype)sharedStore {
    static HistoryStore *sharedStore;
    if(!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (NSArray *)getAllUserDonations {
//    PFUser *user = [PFQuery getUserObjectWithId:@"CvOkJ1SXJE"];
    
    PFQuery *donationQuery = [PFQuery queryWithClassName:@"Donation"];
    [donationQuery whereKey:@"user" equalTo:[PFUser currentUser]];
    
    NSArray *allDonations = NULL;
    NSError *error;
    
    allDonations = [donationQuery findObjects:&error];
    if (error)
        NSLog(@"Error in DataBase operation: %@ %@", error, [error userInfo]);
    NSLog(@"%ld", allDonations.count);
    
    return allDonations;
}

- (NSArray*)getUserDonationInfo {
    NSMutableArray *donationsInfo = [[NSMutableArray alloc] init];
    
    NSObject *institution;
    NSDate *creationDate;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    NSArray *donations = [self getAllUserDonations];
    for(NSObject *obj in donations) {
        NSLog(@"donationId: %@", [obj valueForKey:@"objectId"]);
        institution = [[InstitutionStore sharedStore] getInstitutionById:[[obj valueForKey:@"institution"] valueForKey:@"objectId"]];
        creationDate = (NSDate*)[obj valueForKey:@"createdAt"];
        NSDictionary *retrievedData = [[NSDictionary alloc] initWithObjectsAndKeys:[obj valueForKey:@"objectId"], @"donationId",
                                       [dateFormat stringFromDate:creationDate], @"donationDate",
                                       [institution valueForKey:@"name"], @"institutionName", nil];
        
        [donationsInfo addObject:retrievedData];
        NSLog(@"%@", retrievedData);
    }
    
    donations = NULL;
    dateFormat = NULL;
    creationDate = NULL;
    institution = NULL;

    return donationsInfo;
}

@end
