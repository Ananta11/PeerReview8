//
//  ProfessorMO+CoreDataProperties.h
//  PeerReview8
//
//  Created by Ananta Shahane on 6/21/17.
//  Copyright © 2017 Ananta Shahane. All rights reserved.
//

#import "ProfessorMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ProfessorMO (CoreDataProperties)

+ (NSFetchRequest<ProfessorMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *subject;
@property (nonatomic) int16_t researches;
@property (nullable, nonatomic, retain) NSSet<PersonMO *> *person;

@end

@interface ProfessorMO (CoreDataGeneratedAccessors)

- (void)addPersonObject:(PersonMO *)value;
- (void)removePersonObject:(PersonMO *)value;
- (void)addPerson:(NSSet<PersonMO *> *)values;
- (void)removePerson:(NSSet<PersonMO *> *)values;

@end

NS_ASSUME_NONNULL_END
