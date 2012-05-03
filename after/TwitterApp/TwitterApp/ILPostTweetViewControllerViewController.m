//
//  ILPostTweetViewControllerViewController.m
//  TwitterApp
//
//  Created by jeremy Templier on 01/05/12.
//  Copyright (c) 2012 particulier. All rights reserved.
//

#import "ILPostTweetViewControllerViewController.h"

@interface ILPostTweetViewControllerViewController ()
@property (nonatomic, strong) TWTweetComposeViewController *tweetSheet;
@end

@implementation ILPostTweetViewControllerViewController
@synthesize messageTextView;
@synthesize tweetSheet;

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

    if ([TWTweetComposeViewController canSendTweet]) {
        self.tweetSheet = [[TWTweetComposeViewController alloc] init];
    }
}

- (void)viewDidUnload
{
    [self setMessageTextView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark Actions

- (IBAction)imageSwitchPressed:(UISwitch*)sender 
{
    if (sender.on) {
        [self.tweetSheet addImage:[UIImage imageNamed:@"ifox.png"]];
    } else {
        [self.tweetSheet removeAllImages];
    }
}

- (IBAction)linkSwitchPressed:(UISwitch*)sender 
{
    if (sender.on) {
        [self.tweetSheet addURL:[NSURL URLWithString:@"http://ioslibraries.com"]];
    } else {
        [self.tweetSheet removeAllURLs];
    }
}

- (IBAction)sendPressed:(id)sender 
{
    if (![self.messageTextView.text isEqualToString:@""]) {
        if ([TWTweetComposeViewController canSendTweet])
        {
            [self.tweetSheet setInitialText:self.messageTextView.text];
            [self presentModalViewController:self.tweetSheet animated:YES];
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] 
                                      initWithTitle:@"Oups"                                                             
                                      message:@"Veuillez verifier votre connexion internet ou votre compte twitter."                                                          
                                      delegate:self                                              
                                      cancelButtonTitle:@"OK"                                                   
                                      otherButtonTitles:nil];
            [alertView show];
        }
    }
}

- (IBAction)sendPressed:(id)sender 
{
    if (![self.messageTextView.text isEqualToString:@""]) {
        if ([TWTweetComposeViewController canSendTweet])
        {
            ACAccountStore *accountStore = [[ACAccountStore alloc] init];
            
            ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
            
            [accountStore requestAccessToAccountsWithType:accountType withCompletionHandler:^(BOOL granted, NSError *error) {
                if(granted) {
                    NSArray *accountsArray = [accountStore accountsWithAccountType:accountType];
                    if ([accountsArray count] > 0) {
                        ACAccount *twitterAccount = [accountsArray objectAtIndex:0];
                        TWRequest *postRequest = [[TWRequest alloc] initWithURL:[NSURL URLWithString:@"http://api.twitter.com/1/statuses/update.json"] parameters:[NSDictionary dictionaryWithObject:self.messageTextView.text forKey:@"status"] requestMethod:TWRequestMethodPOST];
                        [postRequest setAccount:twitterAccount];
                        [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                            NSString *output = [NSString stringWithFormat:@"HTTP response status: %i", [urlResponse statusCode]];
                            
                            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Status" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            [alert show];
                        }];
                    }
                }
            }];
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] 
                                      initWithTitle:@"Oups"                                                             
                                      message:@"Veuillez verifier votre connexion internet ou votre compte twitter."                                                          
                                      delegate:self                                              
                                      cancelButtonTitle:@"OK"                                                   
                                      otherButtonTitles:nil];
            [alertView show];
        }
    }
}

@end
