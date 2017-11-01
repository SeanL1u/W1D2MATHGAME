#import "mathGame.h"

NSString* getandConvert(){
    char inputstr[4];
    scanf("%s", inputstr);
    //NSLog(@"%s",inputstr);
    //while (strcmp(inputstr, "\n") == 0){fgets (inputstr,255,stdin);}
    NSString* whatever = [NSString stringWithUTF8String:inputstr];
    //NSLog(@"%@", whatever);
    return whatever;}

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

+(void)start{ mathGame* Player1 = [[mathGame alloc] init];
    Player1.score = 0;
    while (YES){
        NSArray* questionGenerated = [Player1 questionGenerator ];
        NSString* num1S = questionGenerated [0];
        NSString* num2S = questionGenerated [1];
        NSInteger sum = numberize(questionGenerated [2]);
        NSLog( (@"%@ + %@ = ?") ,(num1S), num2S);
        
        
        NSString* inputanwserS = getandConvert();
        NSInteger inputanwser = numberize(inputanwserS);
        
        
        //NSLog(@"%ldnumin",(long)numInputanwser);
        //NSLog(@"%ldnuman",(long)numAnwser);

    if (inputanwser == sum){
        Player1.score += 1;
        NSLog(@"CORRECT!\n");}
    else {NSLog(@"Wrong :(\n");}
        
    NSLog(@"YOUR SCORE IS %ld",(long)Player1.score);}}




    @end

