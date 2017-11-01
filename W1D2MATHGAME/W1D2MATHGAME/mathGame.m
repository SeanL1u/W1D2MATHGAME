#import "mathGame.h"

NSInteger numberize(NSString* whatever){
    NSInteger outputnum = [whatever integerValue];
    return outputnum;}
//////////////////////////////////////

@implementation mathGame
-(instancetype)init {self = [super init];return self;}

-(NSArray*)questionGenerator {
    int num1 = arc4random() % 11;
    int num2 = arc4random() % 11;
    int sum = num1 + num2 ;
    NSString* num1S = [NSString stringWithFormat: @"%d", num1];
    NSString* num2S = [NSString stringWithFormat: @"%d", num2];
    NSString* sumS = [NSString stringWithFormat: @"%d", sum];
    NSLog(@"Anwser : %@", sumS);
    return @[num1S,num2S,sumS];}

-(NSString*) getandConvert{
    char inputstr[4];
    scanf("%s", inputstr);
     if(strcmp(inputstr,"quit\n") != (0)){ self.game = NO;}
    NSString* whatever = [NSString stringWithUTF8String:inputstr]; return whatever;}
-(void)storyloop{
    while (self.game){
        NSArray* questionGenerated = [self questionGenerator ];
        NSString* num1S = questionGenerated [0];
        NSString* num2S = questionGenerated [1];
        NSInteger sum = numberize(questionGenerated [2]);
        NSLog( (@"%@ + %@ = ?") ,(num1S), num2S);
        NSString* inputanwserS = (self.getandConvert);
        NSInteger inputanwser = numberize(inputanwserS);
        //NSLog(@"%hhd",self.game);
        
        if (inputanwser == sum){
            self.score += 1;
            NSLog(@"CORRECT!\n");}
        else {NSLog(@"Wrong :(\n");}
        NSLog(@"YOUR SCORE IS %ld",(long)self.score);}}

+(void)start{ mathGame* Player1 = [[mathGame alloc] init];
    Player1.score = 0;
    Player1.game = YES;
    [Player1 storyloop];
}


@end

