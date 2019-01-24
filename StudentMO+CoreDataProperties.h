//
//  StudentMO+CoreDataProperties.h
//  PeerReview8
//
//  Created by Ananta Shahane on 6/21/17.
//  Copyright © 2017 Ananta Shahane. All rights reserved.
//

#import "StudentMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface StudentMO (CoreDataProperties)

+ (NSFetchRequest<StudentMO *> *)fetchRequest;

@property (nonatomic) int16_t grades;
@property (nullable, nonatomic, copy) NSString *year;
@property (nullable, nonatomic, retain) NSSet<PersonMO *> *person;

@end

@interface StudentMO (CoreDataGeneratedAccessors)

- (void)addPersonObject:(PersonMO *)value;
- (void)removePersonObject:(PersonMO *)value;
- (void)addPerson:(NSSet<PersonMO *> *)values;
- (void)removePerson:(NSSet<PersonMO *> *)values;

@end

NS_ASSUME_NONNULL_END
