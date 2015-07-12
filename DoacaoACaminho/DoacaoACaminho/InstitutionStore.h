//
//  InsitutionStore.h
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 09/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InstitutionStore : NSObject

+ (instancetype)sharedStore;
- (NSArray*)getAllInstitutions;
- (NSObject*)getInstitutionById:(NSString*)institutionId;

@end
