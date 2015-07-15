//
//  InsitutionStore.m
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 09/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <Parse/Parse.h>
#import "InstitutionStore.h"


@interface InstitutionStore()

@end

@implementation InstitutionStore

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Could not access instance. Use [HistoryStore sharedStore]" reason:@"This is a singleton class" userInfo:nil];
}

- (instancetype)initPrivate {
    return (self = [super init]);
}

+ (instancetype)sharedStore {
    static InstitutionStore *sharedStore;
    if(!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (NSArray*)getAllInstitutions {
    PFQuery *querry = [PFQuery queryWithClassName:@"Institution"];
    return querry.findObjects;
}

- (NSObject*)getInstitutionById:(NSString*)institutionId {
    PFQuery *institutionQuerry = [PFQuery queryWithClassName:@"Institution"];
    [institutionQuerry whereKey:@"objectId" equalTo:institutionId];
    
    NSArray *results;
    NSError *error;
    
    results = [institutionQuerry findObjects:&error];
    if(error)
        NSLog(@"Error in DataBase operation: %@ %@", error, [error userInfo]);
    
    if(results.count == 0)
        return NULL;
        
    return results[0];
}

@end
