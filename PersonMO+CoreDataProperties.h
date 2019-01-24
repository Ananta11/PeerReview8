//
//  PersonMO+CoreDataProperties.h
//  PeerReview8
//
//  Created by Ananta Shahane on 6/21/17.
//  Copyright © 2017 Ananta Shahane. All rights reserved.
//

#import "PersonMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PersonMO (CoreDataProperties)

+ (NSFetchRequest<PersonMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, copy) NSString *personName;
@property (nullable, nonatomic, retain) ProfessorMO *professorPerson;
@property (nullable, nonatomic, retain) StudentMO *studentPerson;

@end

NS_ASSUME_NONNULL_END
