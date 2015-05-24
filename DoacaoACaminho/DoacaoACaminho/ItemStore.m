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

- (instancetype) initPrivate{
    return (self = [super init]);
}

- (NSArray *) getAllItens{
    PFQuery *query = [PFQuery queryWithClassName:@"Item"];
    
    NSArray *allObjects;
    NSError *error;
    allObjects = [query findObjects:&error ];

    if (error) {
        NSLog(@"Error: %@ %@", error, [error userInfo]);
    }
    return allObjects;
}

- (NSArray*)getItemsOnCategory:(NSString *)category {
    PFQuery *categoryQuery = [PFQuery queryWithClassName:@"Item_Category"];
    [categoryQuery whereKey:@"name" equalTo:category];
    
    PFQuery *itemQuery = [PFQuery queryWithClassName:@"Item"];
    [itemQuery whereKey:@"itemCategory" matchesKey:@"objectId" inQuery:categoryQuery];

    NSArray *objects = [itemQuery findObjects];
    
    return objects;
}

@end
