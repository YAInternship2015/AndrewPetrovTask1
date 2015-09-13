// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to APInstrumentsType.m instead.

#import "_APInstrumentsType.h"

const struct APInstrumentsTypeAttributes APInstrumentsTypeAttributes = {
	.typeName = @"typeName",
};

const struct APInstrumentsTypeRelationships APInstrumentsTypeRelationships = {
	.instruments = @"instruments",
};

@implementation APInstrumentsTypeID
@end

@implementation _APInstrumentsType

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"APInstrumentsType" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"APInstrumentsType";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"APInstrumentsType" inManagedObjectContext:moc_];
}

- (APInstrumentsTypeID*)objectID {
	return (APInstrumentsTypeID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic typeName;

@dynamic instruments;

- (NSMutableSet*)instrumentsSet {
	[self willAccessValueForKey:@"instruments"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"instruments"];

	[self didAccessValueForKey:@"instruments"];
	return result;
}

@end

