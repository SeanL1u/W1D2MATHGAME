#import <Foundation/Foundation.h>

@interface MathGame : NSObject
@property (nonatomic, assign) NSInteger score;
@property NSString* currentQuestion;
@property NSArray <NSArray*>* questionArray;
@property BOOL game;
@property (nonatomic, strong) NSDate* start_time;
@property (nonatomic) NSDate* end_time;
+(void)start;
-(NSArray*)questionGenerator;
-(void)storyloop;
-(NSString*) getandConvert;

@end
