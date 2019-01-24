//
//  StudentMO+CoreDataProperties.m
//  PeerReview8
//
//  Created by Ananta Shahane on 6/21/17.
//  Copyright © 2017 Ananta Shahane. All rights reserved.
//

#import "StudentMO+CoreDataProperties.h"

@implementation StudentMO (CoreDataProperties)

+ (NSFetchRequest<StudentMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic grades;
@dynamic year;
@dynamic person;

@end
