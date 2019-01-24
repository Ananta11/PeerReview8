//
//  ProfessorMO+CoreDataProperties.m
//  PeerReview8
//
//  Created by Ananta Shahane on 6/21/17.
//  Copyright © 2017 Ananta Shahane. All rights reserved.
//

#import "ProfessorMO+CoreDataProperties.h"

@implementation ProfessorMO (CoreDataProperties)

+ (NSFetchRequest<ProfessorMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Professor"];
}

@dynamic subject;
@dynamic researches;
@dynamic person;

@end
