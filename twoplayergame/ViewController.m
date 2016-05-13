//
//  ViewController.m
//  twoplayergame
//
//  Created by Edmund Ng on 2016-05-09.
//  Copyright © 2016 paperchasers. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Equation;
@property (weak, nonatomic) IBOutlet UILabel *Player1Lives;
@property (weak, nonatomic) IBOutlet UILabel *Player2Lives;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UILabel *turns;
@property (nonatomic, strong) Player* player1;
@property (nonatomic, strong) Player* player2;
@property (nonatomic, assign) BOOL isItPlayer1;
@property (nonatomic, assign) int computerAnswer;
@property (nonatomic, strong) NSMutableString* userAnswer;



@end

@implementation ViewController
//hi

- (IBAction)Button9:(id)sender {
    [self.userAnswer appendString:@"9"];
    [self updateViews];
}
- (IBAction)Button4:(id)sender {
    [self.userAnswer  appendString:@"4"];
    self.answerLabel.text = self.userAnswer;
}

- (IBAction)Button8:(id)sender {
    [self.userAnswer appendString:@"8"];
    self.answerLabel.text = self.userAnswer;
}
- (IBAction)Button7:(id)sender {
    [self.userAnswer appendString:@"7"];
    self.answerLabel.text = self.userAnswer;
}
- (IBAction)Button3:(id)sender {
    [self.userAnswer appendString:@"3"];
    self.answerLabel.text = self.userAnswer;
    
}
- (IBAction)Button1:(id)sender {
    [self.userAnswer appendString:@"1"];
    self.answerLabel.text = self.userAnswer;
}
- (IBAction)Button5:(id)sender {
    [self.userAnswer appendString:@"5"];
    self.answerLabel.text = self.userAnswer;
}
- (IBAction)Button2:(id)sender {
    [self.userAnswer appendString:@"2"];
    self.answerLabel.text = self.userAnswer;
}
- (IBAction)Button6:(id)sender {
    [self.userAnswer appendString:@"6"];
    self.answerLabel.text = self.userAnswer;
}
- (IBAction)Button0:(id)sender {
    [self.userAnswer appendString:@"0"];
    self.answerLabel.text = self.userAnswer;
}


- (IBAction)ButtonEnter:(id)sender {
    
    
    
    NSInteger userAnswerInt = [self.userAnswer integerValue];
    

    
    self.isItPlayer1 = !self.isItPlayer1;
    
    
    if (self.computerAnswer != userAnswerInt) {
        
        if (self.isItPlayer1) {
            [ self.player1 loselives: 1];
        } else {
            [ self.player2 loselives:1];
        }
        
    }
    
    self.isItPlayer1 = !self.isItPlayer1;
    [self generateQuestion];
    
    [self endgame];
    
    [self updateViews];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.player1 = [[Player alloc] initWithName:@"player 1" andwithLives: 3];
    self.player2 = [[Player alloc] initWithName : @"player 2 " andwithLives:3];
    
    [self generateQuestion];
    
    
    
    
    [self updateViews];
    
    
}


-(void)generateQuestion{
    
    int num1 = arc4random_uniform(21);
    int num2 = arc4random_uniform(21);
    
    self.computerAnswer = num1 + num2;
    self.userAnswer = [[NSMutableString alloc] init];
    
    // 
    self.Equation.text = [NSString stringWithFormat:@"%i + %i = ",num1,num2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateViews {
    self.answerLabel.text = self.userAnswer;
    self.Player1Lives.text = [NSString stringWithFormat:@"Player 1 Lives : %i",self.player1.lives];
    self.Player2Lives.text = [NSString stringWithFormat:@"Player 2 Lives : %i",self.player2.lives];
    
    
    if (_isItPlayer1) {
        self.turns.text = @"Player 1";
        _isItPlayer1 = false;
    } else {
        self.turns.text = @"Player 2";
        _isItPlayer1 = true ;
    }
}

-(void) endgame {
    if (self.player1.lives == 0 || self.player2.lives == 0) {
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Game Over"
                              message:@""
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        
        self.player1 = [[Player alloc] initWithName:@"player 1" andwithLives: 3];
        self.player2 = [[Player alloc] initWithName : @"player 2 " andwithLives:3];
        

    }
    
}
@end
