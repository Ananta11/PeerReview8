//
//  PersonMO+CoreDataProperties.m
//  PeerReview8
//
//  Created by Ananta Shahane on 6/21/17.
//  Copyright © 2017 Ananta Shahane. All rights reserved.
//

#import "PersonMO+CoreDataProperties.h"

@implementation PersonMO (CoreDataProperties)

+ (NSFetchRequest<PersonMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic id;
@dynamic personName;
@dynamic professorPerson;
@dynamic studentPerson;

@end
