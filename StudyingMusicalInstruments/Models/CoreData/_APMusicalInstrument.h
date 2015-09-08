// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to APMusicalInstrument.h instead.

#import <CoreData/CoreData.h>

extern const struct APMusicalInstrumentAttributes {
	__unsafe_unretained NSString *imageName;
	__unsafe_unretained NSString *instrumentDescription;
	__unsafe_unretained NSString *name;
} APMusicalInstrumentAttributes;

extern const struct APMusicalInstrumentRelationships {
	__unsafe_unretained NSString *type;
} APMusicalInstrumentRelationships;

@class APInstrumentsType;

@interface APMusicalInstrumentID : NSManagedObjectID {}
@end

@interface _APMusicalInstrument : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) APMusicalInstrumentID* objectID;

@property (nonatomic, strong) NSString* imageName;

//- (BOOL)validateImageName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* instrumentDescription;

//- (BOOL)validateInstrumentDescription:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) APInstrumentsType *type;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;

@end

@interface _APMusicalInstrument (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveImageName;
- (void)setPrimitiveImageName:(NSString*)value;

- (NSString*)primitiveInstrumentDescription;
- (void)setPrimitiveInstrumentDescription:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (APInstrumentsType*)primitiveType;
- (void)setPrimitiveType:(APInstrumentsType*)value;

@end
