#import "MathGame.h"

NSInteger numberize(NSString* whatever){
    return [whatever integerValue];
}

@implementation MathGame


-(NSString*) getandConvert{
    char inputstr[4];
    scanf("%s", inputstr);
    NSString* whatever = [NSString stringWithUTF8String:inputstr];
    
    
    
    return whatever;
}

//------------------------------------------------

-(NSArray*)questionGenerator {
    self.start_time = [NSDate date];
    NSArray* operators = @[@"+",@"-",@"x",@"/"];
    int leftValue = arc4random() % 11;
    int rightValue = arc4random() % 11;
    int result = 0;
    int operator_index = arc4random() % 3;
    NSString *operator = operators[operator_index];
    
    switch (operator_index) {
        case 0:
            result = leftValue + rightValue;
            break;
        case 1:
            result = leftValue - rightValue;
            break;
        case 2:
            result = leftValue * rightValue;
            break;
        case 3:
            result = leftValue / rightValue;
            break;
        default:
            break;
    }
    NSString* left = [NSString stringWithFormat: @"%d", leftValue];
    NSString* right = [NSString stringWithFormat: @"%d", rightValue];
    //    NSString* resultString = [NSString stringWithFormat: @"%d", result];
    NSLog(@"Anwser : %@", @(result));
    return @[left,right,@(result),operator];
    
}
//------------------------------------------------

-(void)storyloop{
    while (self.game){
        NSArray* questionGenerated = [self questionGenerator];
        NSString* leftValue = questionGenerated[0];
        NSString* rightValue = questionGenerated[1];
        NSString* operator = questionGenerated[3];
        NSInteger result = [questionGenerated[2] integerValue];
        
        NSLog( (@"%@ %@ %@ = ?") ,(leftValue),operator,rightValue);
        NSString* inputanwserS = [self getandConvert];
        if([inputanwserS isEqualToString: @"quit"]){
            self.game = NO;
            self.end_time = [NSDate date];
            NSTimeInterval interval = [self.end_time timeIntervalSinceDate:self.start_time];
            NSLog(@"Time used: %f\nTotal Score %ld",interval,(long)self.score);
            continue;
        }
        
        NSInteger inputanwser = numberize(inputanwserS);
        //NSLog(@"%hhd",self.game);
        
        if (inputanwser == result){
            self.score += 1;
            NSLog(@"CORRECT!\n");
        }
        else{
            NSLog(@"Wrong :(\n");
        }
        
    }
    
    NSLog(@"YOUR SCORE IS %ld",(long)self.score);}

+(void)start{
    MathGame* player1 = [[MathGame alloc] init];
    player1.score = 0;
    player1.game = YES;
    [player1 storyloop];
}


@end

