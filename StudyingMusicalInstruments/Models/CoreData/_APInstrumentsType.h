// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to APInstrumentsType.h instead.

#import <CoreData/CoreData.h>

extern const struct APInstrumentsTypeAttributes {
	__unsafe_unretained NSString *type;
} APInstrumentsTypeAttributes;

extern const struct APInstrumentsTypeRelationships {
	__unsafe_unretained NSString *instruments;
} APInstrumentsTypeRelationships;

@class APMusicalInstrument;

@interface APInstrumentsTypeID : NSManagedObjectID {}
@end

@interface _APInstrumentsType : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) APInstrumentsTypeID* objectID;

@property (nonatomic, strong) NSNumber* type;

@property (atomic) int16_t typeValue;
- (int16_t)typeValue;
- (void)setTypeValue:(int16_t)value_;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *instruments;

- (NSMutableSet*)instrumentsSet;

@end

@interface _APInstrumentsType (InstrumentsCoreDataGeneratedAccessors)
- (void)addInstruments:(NSSet*)value_;
- (void)removeInstruments:(NSSet*)value_;
- (void)addInstrumentsObject:(APMusicalInstrument*)value_;
- (void)removeInstrumentsObject:(APMusicalInstrument*)value_;

@end

@interface _APInstrumentsType (CoreDataGeneratedPrimitiveAccessors)

- (NSMutableSet*)primitiveInstruments;
- (void)setPrimitiveInstruments:(NSMutableSet*)value;

@end
