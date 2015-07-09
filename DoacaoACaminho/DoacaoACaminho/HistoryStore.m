//
//  HistoryStore.m
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 09/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <Parse/Parse.h>
#import "HistoryStore.h"

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

- (NSArray *)getAllUserHistory; {
    PFQuery *donationQuery = [PFQuery queryWithClassName:@"Donation"];
    [donationQuery whereKey:@"user" equalTo:[PFUser currentUser].objectId];
    
    NSArray *allDonations;
    NSError *error;
    
    allDonations = [donationQuery findObjects:&error];
    if (error)
        NSLog(@"Error in DataBase operation: %@ %@", error, [error userInfo]);
    
    return allDonations;
}

@end
