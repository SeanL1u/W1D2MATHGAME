#import "mathGame.h"

NSInteger numberize(NSString* whatever){
    NSInteger outputnum = [whatever integerValue];
    return outputnum;}

@implementation mathGame
-(instancetype)init {self = [super init];return self;}

-(NSArray*)questionGenerator {
    self.start_time = [NSDate date];
    NSArray* operators = @[@"+",@"-",@"x",@"/"];
    int num1 = arc4random() % 11;
    int num2 = arc4random() % 11;
    int result = 0;
    int operator_index = arc4random() % 3;
    NSString*operator = operators[operator_index];
    
    switch (operator_index) {
        case 0:
            result = num1 + num2;
            break;
        case 1:
            result = num1 - num2;
            break;
        case 2:
            result = num1 * num2;
            break;
        case 3:
            result = num1 / num2;
            break;
        default:
            break;
    }
    NSString* num1S = [NSString stringWithFormat: @"%d", num1];
    NSString* num2S = [NSString stringWithFormat: @"%d", num2];
    NSString* resultS = [NSString stringWithFormat: @"%d", result];
    NSLog(@"Anwser : %@", resultS);
    return @[num1S,num2S,resultS,operator];}

//------------------------------------------------
-(NSString*) getandConvert{
    char inputstr[4];
    scanf("%s", inputstr);
     if(strcmp(inputstr,"quit") == (0)){self.game = NO;
         self.end_time = [NSDate date];
         NSTimeInterval interval = [self.end_time timeIntervalSinceDate:self.start_time];
         NSLog(@"Time used: %f\nTotal Score %ld",interval,(long)self.score);}
    
    NSString* whatever = [NSString stringWithUTF8String:inputstr];
    return whatever;}

-(void)storyloop{
    while (self.game){
        NSArray* questionGenerated = [self questionGenerator ];
        NSString* num1S = questionGenerated [0];
        NSString* num2S = questionGenerated [1];
        NSString* operator = questionGenerated [3];
        NSInteger result = numberize(questionGenerated [2]);
        
        NSLog( (@"%@ %@ %@ = ?") ,(num1S),operator,num2S);
        NSString* inputanwserS = (self.getandConvert);
        NSInteger inputanwser = numberize(inputanwserS);
        //NSLog(@"%hhd",self.game);
        
        if (inputanwser == result){
            self.score += 1;
            NSLog(@"CORRECT!\n");}
        else if ([inputanwserS isEqualToString: @"quit"] != YES){
            NSLog(@"Wrong :(\n");}}
    
        NSLog(@"YOUR SCORE IS %ld",(long)self.score);}

+(void)start{ mathGame* Player1 = [[mathGame alloc] init];
    Player1.score = 0;
    Player1.game = YES;
    [Player1 storyloop];
}


@end

