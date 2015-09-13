#import "_APMusicalInstrument.h"

@interface APMusicalInstrument : _APMusicalInstrument {}
+ (APMusicalInstrument *)instrumentWithName:(NSString *)name
                                description:(NSString *)description
                                       type:(APInstrumentsType *)type
                                  imageName:(NSString *)imageName;
@end
