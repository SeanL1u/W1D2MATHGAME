#import "mathGame.h"

NSString* getandConvert(){
    
    char inputstr[255] = "\n";
    
    while (strcmp(inputstr, "\n") == 0) {fgets(inputstr,255,stdin);}
    NSString* whatever = [NSString stringWithUTF8String:inputstr];
    return whatever;}

NSInteger numberize(NSString* whatever){
    NSInteger outputnum = [whatever integerValue];
    return outputnum;}

//////////////////////////////////////

@implementation mathGame
-(instancetype)init {self = [super init];return self;}

-(NSArray*)questionGenerator {
//    int num1;// = SSRandomIntBetween(1,10);
//    int num2;// = SSRandomIntBetween(1,10);
//    NSString* question = (@"%i + %i =",num1,num2);
//    NSString* answer = @"%i", (num1,num2);
   return @[@"%i + %i = /n", @"answer"];}

+(void)start{ mathGame* Player1 = [[mathGame alloc] init];
    
    Player1.score = 0;
    while (TRUE) {
    NSLog(@"%@",[Player1 questionGenerator ][0]);
        NSString* anwser = getandConvert();
    if ( anwser == [Player1 questionGenerator][1]){ Player1.score += 1;NSLog(@"CORRECT!\n");}
        if ([anwser  isEqual: @"EXIT"]){break;}
        else {NSLog(@"Wrong :(\n");}
            NSLog(@"%ld",(long)Player1.score);}
}
    
    
    
    
    @end
    
