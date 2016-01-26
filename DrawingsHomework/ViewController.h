//
//  ViewController.h
//  DrawingsHomework
//
//  Created by Admin on 23.12.15.
//  Copyright © 2015 Alina Egorova. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AEStar;

@interface ViewController : UIViewController

@property(weak, nonatomic) IBOutlet AEStar* star;

@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISlider *widthSlider;

@property (weak, nonatomic) IBOutlet UIView* square;
@property (weak, nonatomic) IBOutlet UIView* brush;

@property (weak, nonatomic) IBOutlet UIButton *erasier;
@property (weak, nonatomic) IBOutlet UIButton *clean;

- (IBAction)actionSlider:(UISlider*) sender;
- (IBAction)setWidth:(UISlider *)sender;
- (IBAction)takeErasier:(UIButton *)sender;
- (IBAction)cleanAll:(UIButton *)sender;





@end

