//
//  RootViewController.h
//  SocketIO-Demo
//
//  Created by Jakey on 14/12/25.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIOSocket.h"

@interface RootViewController : UIViewController
@property(nonatomic,strong)SIOSocket *socket;
@property (weak, nonatomic) IBOutlet UITextField *messageText;

- (IBAction)enterTouched:(id)sender;
- (IBAction)loginTouched:(id)sender;
- (IBAction)logoutTouched:(id)sender;
- (IBAction)sendTouched:(id)sender;
@end
