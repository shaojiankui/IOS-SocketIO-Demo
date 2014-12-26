//
//  RootViewController.m
//  SocketIO-Demo
//
//  Created by Jakey on 14/12/25.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "RootViewController.h"
#import "NSDictionary+JsonString.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)enterTouched:(id)sender {
    [SIOSocket socketWithHost: @"http://localhost:3000" response: ^(SIOSocket *socket) {
        self.socket = socket;
        
        [self.socket on: @"talk-client" callback: ^(SIOParameterArray *args) {
            NSLog(@"connnection is success:%@",[args description]);
            
        }];
        [self.socket emit:@"connection"];
    }];
}

- (IBAction)loginTouched:(id)sender {
    
    NSDictionary *dic = @{@"username":@"jakey",@"userid": UUID()};
    NSArray *dataArray = @[[dic jsonString]];

    [self.socket on: @"login" callback:^(NSArray *args) {
        NSLog(@"socket=%@",args);
        
    }];
    [self.socket emit:@"login" args:dataArray];
}

- (IBAction)logoutTouched:(id)sender {
    [self.socket on: @"logout" callback:^(NSArray *args) {
        NSLog(@"socket=%@",args);
        
    }];
    [self.socket emit:@"logout"];
}

- (IBAction)sendTouched:(id)sender {
    NSArray *dataArray = @[self.messageText.text];
    
    [self.socket on: @"message" callback:^(NSArray *args) {
        NSLog(@"socket=%@",args);
        
    }];
    [self.socket emit:@"message" args:dataArray];
}

NSString *UUID()
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    CFRelease(uuid_string_ref);
    return uuid;
}
@end
