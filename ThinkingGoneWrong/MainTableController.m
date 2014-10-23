//
//  MainTableController.m
//  ThinkingGoneWrong
//
//  Created by Kevin Akers on 12/27/13.
//  Copyright (c) 2013 Polemics Applications. All rights reserved.
//

#import "MainTableController.h"
#import "ReferenceTableController.h"

@interface MainTableController ()

@end

@implementation MainTableController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hexellence_x2.png"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"formal"]) {
        ReferenceTableController *Vc2 = [segue destinationViewController];
        Vc2.passedNumber = 0;
        Vc2.theTitle = @"Formal Fallacies";
    }
    
    if ([segue.identifier isEqualToString:@"informal"]) {
        ReferenceTableController *Vc2 = [segue destinationViewController];
        Vc2.passedNumber = 1;
        Vc2.theTitle = @"Informal Fallacies";
    }
    
    if ([segue.identifier isEqualToString:@"belief"]) {
        ReferenceTableController *Vc2 = [segue destinationViewController];
        Vc2.passedNumber = 2;
        Vc2.theTitle = @"Belief/Behavioral/Decision";
    }
    
    if ([segue.identifier isEqualToString:@"social"]) {
        ReferenceTableController *Vc2 = [segue destinationViewController];
        Vc2.passedNumber = 3;
        Vc2.theTitle = @"Social / Attributional";
    }
    
    if ([segue.identifier isEqualToString:@"memory"]) {
        ReferenceTableController *Vc2 = [segue destinationViewController];
        Vc2.passedNumber = 4;
        Vc2.theTitle = @"Memory Errors/Biases";
    }
    
}


@end
