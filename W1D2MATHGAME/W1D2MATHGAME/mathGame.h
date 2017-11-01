#import <Foundation/Foundation.h>

@interface mathGame : NSObject
@property NSInteger score;
@property NSString* currentQuestion;
@property NSArray <NSArray*>* questionArray;
@property BOOL game;
@property NSDate* start_time;
@property NSDate* end_time;
+(void)start;
-(NSArray*)questionGenerator;
-(void)storyloop;
-(NSString*) getandConvert;

@end
