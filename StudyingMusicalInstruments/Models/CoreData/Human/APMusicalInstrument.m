#import "APMusicalInstrument.h"

@implementation APMusicalInstrument

+ (APMusicalInstrument *)instrumentWithName:(NSString *)name
                                description:(NSString *)description
                                       type:(APInstrumentsType *)type
                                  imageName:(NSString *)imageName {
    
    APMusicalInstrument *newMusicalInstrument  = [[APMusicalInstrument alloc] init];
    newMusicalInstrument.name = name;
    newMusicalInstrument.instrumentDescription = description;
    newMusicalInstrument.type = type;
    newMusicalInstrument.imageName = imageName;
    return newMusicalInstrument;
}



@end
