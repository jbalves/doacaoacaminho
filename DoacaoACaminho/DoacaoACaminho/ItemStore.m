//
//  ItemStore.m
//  DoacaoACaminho
//
//  Created by Robert Pinto de Oliveira on 21/05/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "ItemStore.h"

@implementation ItemStore
+ (instancetype)sharedStore
{
    static ItemStore *sharedStore;
    if(!sharedStore){
        sharedStore = [[self alloc] initPrivate];
       
    }
     return sharedStore;
}

-(instancetype) initPrivate{
    self=[super init];
    return self;
}

-(NSArray *) getAllItens{
    NSArray *objects;
    
    PFQuery *query = [PFQuery queryWithClassName:@"Item"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    return objects;
}

@end
