//
//  ProfessorMO+CoreDataClass.m
//  PeerReview8
//
//  Created by Ananta Shahane on 6/21/17.
//  Copyright © 2017 Ananta Shahane. All rights reserved.
//

#import "ProfessorMO+CoreDataClass.h"

@implementation ProfessorMO

-(NSString *)description{
    return [NSString stringWithFormat:@"(%@) (Prof. %@) (%@) (%ld)",self.id, self.personName, self.subject, (NSInteger)self.researches];
}
@end
