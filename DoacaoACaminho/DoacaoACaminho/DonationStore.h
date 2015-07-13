//
//  HistoryStore.h
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 09/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DonationStore : NSObject

+ (instancetype) sharedStore;
- (NSArray *)getAllUserDonations;
- (NSArray *)getUserDonationInfo;
- (NSArray*)getDonationItemsByDonation:(PFObject*)donation;

@end
