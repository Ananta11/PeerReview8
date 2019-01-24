//
//  StudentMO+CoreDataClass.m
//  PeerReview8
//
//  Created by Ananta Shahane on 6/21/17.
//  Copyright © 2017 Ananta Shahane. All rights reserved.
//

#import "StudentMO+CoreDataClass.h"

@implementation StudentMO
-(NSString *)description{
    return [NSString stringWithFormat:@"(%@) (Stud. %@) (%@) (%ld)",self.id, self.personName, self.year, (NSInteger)self.grades];
}
@end
