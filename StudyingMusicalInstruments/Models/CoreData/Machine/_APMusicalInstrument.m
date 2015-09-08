// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to APMusicalInstrument.m instead.

#import "_APMusicalInstrument.h"

const struct APMusicalInstrumentAttributes APMusicalInstrumentAttributes = {
	.imageName = @"imageName",
	.instrumentDescription = @"instrumentDescription",
	.name = @"name",
};

const struct APMusicalInstrumentRelationships APMusicalInstrumentRelationships = {
	.type = @"type",
};

@implementation APMusicalInstrumentID
@end

@implementation _APMusicalInstrument

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"APMusicalInstrument" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"APMusicalInstrument";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"APMusicalInstrument" inManagedObjectContext:moc_];
}

- (APMusicalInstrumentID*)objectID {
	return (APMusicalInstrumentID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic imageName;

@dynamic instrumentDescription;

@dynamic name;

@dynamic type;

@end

