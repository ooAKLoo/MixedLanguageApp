//
//  MainViewController.h
//  MixedLanguageApp
//
//  Created by 杨东举 on 2025/3/13.
//
// MainViewController.h
#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (nonatomic, strong) NSString *statusMessage;
@property (nonatomic, strong) NSTimer *statusUpdateTimer;

@end
