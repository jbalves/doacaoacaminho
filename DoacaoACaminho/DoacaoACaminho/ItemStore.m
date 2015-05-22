//
//  ItemStore.m
//  DoacaoACaminho
//
//  Created by Robert Pinto de Oliveira on 21/05/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "ItemStore.h"

@implementation ItemStore

+ (instancetype)sharedStore {
    static ItemStore *sharedStore;
    if(!sharedStore)
        sharedStore = [[self alloc] initPrivate];
    
    return sharedStore;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Couldn't create instance" reason:@"Use [ItemStore sharedStore]"userInfo:NULL];
}

-(instancetype) initPrivate{
    return (self = [super init]);
}

-(NSArray *) getAllItens{
    NSMutableArray *allObjects = [NSMutableArray new];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Item"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            [allObjects addObjectsFromArray:objects];
            NSLog(@"Successfully retrieved %lu scores.", allObjects.count);
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    NSLog(@"objetos recuperados -> %lu", allObjects.count);
    return allObjects.copy;
}

@end
