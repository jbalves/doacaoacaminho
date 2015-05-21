//
//  ItemStore.h
//  DoacaoACaminho
//
//  Created by Robert Pinto de Oliveira on 21/05/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface ItemStore : NSObject

+(instancetype) sharedStore;
-(NSArray *)getAllItens;
@end
