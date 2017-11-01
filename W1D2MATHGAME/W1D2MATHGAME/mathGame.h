#import <Foundation/Foundation.h>

@interface mathGame : NSObject
@property NSInteger score;
@property NSString* currentQuestion;
@property NSArray <NSArray*>* questionArray;
@property BOOL game;
+(void)start;
-(NSArray*)questionGenerator;
-(void)storyloop;
-(NSString*) getandConvert;

@end
