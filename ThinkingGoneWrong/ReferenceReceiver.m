//
//  ReferenceReceiver.m
//  ThinkingGoneWrong
//
//  Created by Kevin Akers on 12/27/13.
//  Copyright (c) 2013 Polemics Applications. All rights reserved.
//

#import "ReferenceReceiver.h"

@interface ReferenceReceiver ()

@end

@implementation ReferenceReceiver

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hexellence_x2.png"]]];
    
    self.theLabel.text = self.theTitle;
    self.theText.text = self.theDefinition;
    
    //Attempting Quartz Core
    [self.theLabel.layer setBorderColor:[[[UIColor blueColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.theLabel.layer setBorderWidth:2.0];
    self.theLabel.layer.cornerRadius = 15;
    self.theLabel.clipsToBounds = YES;
}

-(IBAction)comment {
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    [composer setMailComposeDelegate:self];
    if ([MFMailComposeViewController canSendMail]) {
        [composer setToRecipients:[NSArray arrayWithObjects:@"polemicsapp@yahoo.com", nil]];
        
        NSString *titleString = self.theTitle;
        NSMutableString *subject = [NSMutableString stringWithCapacity:100];
        [subject appendFormat:@"Comment Fallacies/Biases: %@",titleString];
        [composer setSubject:subject];
        [composer setMessageBody:@"--Tell us your suggestion/comment--" isHTML:NO];
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:composer animated:YES completion:nil];
        
    }
    else
        [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)share {
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    [composer setMailComposeDelegate:self];
    if ([MFMailComposeViewController canSendMail]) {
        
        [composer setSubject:@"Fallacies & Biases App"];
        [composer setMessageBody:[NSString stringWithFormat:@"Check out this Term from the Fallacies & Biases App on the App store by <a href='http://www.polemicsapps.com'>Polemics Applications</a>.<BR><BR>%@ - %@", self.theTitle, self.theDefinition] isHTML:YES];
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:composer animated:YES completion:nil];
        
    }
    else
        [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error"
                                                        message:[NSString stringWithFormat:@"error %@", [error description]]
                                                       delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:nil, nil];
        [alert show];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
