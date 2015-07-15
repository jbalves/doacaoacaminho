//
//  HistoryStore.m
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 09/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <Parse/Parse.h>
#import "DonationStore.h"
#import "InstitutionStore.h"

@interface DonationStore()

@end

@implementation DonationStore

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Could not access instance. Use [HistoryStore sharedStore]" reason:@"This is a singleton class" userInfo:nil];
}

- (instancetype)initPrivate {
    return (self = [super init]);
}

+ (instancetype)sharedStore {
    static DonationStore *sharedStore;
    if(!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (NSArray *)getAllUserDonations {
    PFQuery *donationQuery = [PFQuery queryWithClassName:@"Donation"];
    /** quando o login estiver pronto, descomentar a linha abaixo e comentar as
        próximas duas linhas de código
     **/
//    [donationQuery whereKey:@"user" equalTo:[PFUser currentUser]];
    
    PFUser *user = [PFQuery getUserObjectWithId:@"CvOkJ1SXJE"];
    [donationQuery whereKey:@"user" equalTo:user];
    
    NSArray *allDonations = NULL;
    NSError *error;
    
    allDonations = [donationQuery findObjects:&error];
    if (error)
        NSLog(@"Error in DataBase operation: %@ %@", error, [error userInfo]);
    NSLog(@"%lu", (unsigned long)allDonations.count);
    
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
        NSDictionary *retrievedData = [[NSDictionary alloc] initWithObjectsAndKeys:obj, @"donationObject",
                                       [dateFormat stringFromDate:creationDate], @"donationDate",
                                       [institution valueForKey:@"name"], @"institutionName",
                                       institution, @"institutionObject", nil];
        
        [donationsInfo addObject:retrievedData];
        NSLog(@"%@", retrievedData);
    }
    
    donations = NULL;
    dateFormat = NULL;
    creationDate = NULL;
    institution = NULL;

    return donationsInfo;
}

- (NSArray*)getDonationItemsByDonation:(NSObject*)donation {
    PFRelation *itemsRelation = [(PFObject*)donation relationForKey:@"items"];
    
    PFQuery *itemsQuery = [itemsRelation query];
    
    NSError *error;
    NSArray *results = [itemsQuery findObjects:&error];
    
    if (error)
        NSLog(@"Error in DataBase operation: %@ %@", error, [error userInfo]);
    
    return results;
}

@end
