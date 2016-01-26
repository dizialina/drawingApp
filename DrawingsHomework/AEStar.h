//
//  AEStar.h
//  DrawingsHomework
//
//  Created by Admin on 23.12.15.
//  Copyright © 2015 Alina Egorova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AEStar : UIView

@property (weak, nonatomic) IBOutlet UIImageView* canvas;
@property (strong, nonatomic) UIColor* paintColor;
@property (assign, nonatomic) CGFloat brushWidth;

- (void) setColorWithRed:(CGFloat) red withGreen:(CGFloat) green withBlue:(CGFloat) blue;
- (void) makeBrushWidth:(CGFloat)brushWidth;

@end
