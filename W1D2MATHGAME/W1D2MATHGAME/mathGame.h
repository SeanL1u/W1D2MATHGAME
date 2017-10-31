#import <Foundation/Foundation.h>

@interface mathGame : NSObject
@property NSInteger score;
@property NSString* currentQuestion;
@property NSArray <NSArray*>* questionArray;
@property NSString* instruction;

+(void)start;

@end
