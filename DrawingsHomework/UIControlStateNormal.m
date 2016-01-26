//
//  ViewController.m
//  DrawingsHomework
//
//  Created by Admin on 23.12.15.
//  Copyright © 2015 Alina Egorova. All rights reserved.
//

#import "ViewController.h"
#import "AEStar.h"

@interface ViewController () {
    
    BOOL onOffErasier;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIColor* background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"wood.jpg"]];
    self.view.backgroundColor = background;
    
    [self setColor];
    
    [self.redSlider setThumbImage: [UIImage imageNamed:@"slider.png"] forState:UIControlStateNormal];
    [self.greenSlider setThumbImage: [UIImage imageNamed:@"slider.png"] forState:UIControlStateNormal];
    [self.blueSlider setThumbImage: [UIImage imageNamed:@"slider.png"] forState:UIControlStateNormal];
    [self.widthSlider setThumbImage: [UIImage imageNamed:@"slider.png"] forState:UIControlStateNormal];
    
    
    self.redLabel.text = @"R:";
    self.greenLabel.text = @"G:";
    self.blueLabel.text = @"B:";
    
    self.square.layer.borderWidth = 1.f;
    self.square.layer.borderColor = [[UIColor grayColor] CGColor];
    [self.view bringSubviewToFront:self.square];
    
    self.brush.backgroundColor = [UIColor blackColor];
    self.brush.layer.cornerRadius = 36.f;
    self.brush.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    UIImage* image = [UIImage imageNamed:@"photoshop7.png"];
    UIImage* resizedImage = [self imageWithImage:image scaledToSize:CGSizeMake(56,72)];

    [self.erasier setBackgroundImage:resizedImage forState:UIControlStateNormal];
    
    UIImage* clean = [UIImage imageNamed:@"clean.png"];
    UIImage* resizedCleanImage = [self imageWithImage:clean scaledToSize:CGSizeMake(45,40)];
    
    [self.clean setBackgroundImage:resizedCleanImage forState:UIControlStateNormal];
    
    onOffErasier = NO;
    
    
    
    
    
}

- (void) viewDidAppear:(BOOL)animated {
    
    CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI_2);
    self.widthSlider.transform = trans;
    

}

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [self.star setNeedsDisplay];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
   
}

#pragma mark - UISliders

- (IBAction)actionSlider:(UISlider*) sender {
    
    [self setColor];
    self.brush.backgroundColor = self.star.paintColor;
    
}

- (IBAction)setWidth:(UISlider *)sender {
    
    self.brush.transform = CGAffineTransformMakeScale(self.widthSlider.value / 7.0, self.widthSlider.value / 7.0);
    
    [self.star makeBrushWidth:self.widthSlider.value];
    
}

- (void)setColor {
    
    CGFloat red = self.redSlider.value;
    CGFloat green = self.greenSlider.value;
    CGFloat blue = self.blueSlider.value;
    
    [self.star setColorWithRed:red withGreen:green withBlue:blue];
    
}

#pragma mark - Buttons

- (IBAction)takeErasier:(UIButton *)sender {
    
    if (!onOffErasier) {
        
        [self.star setColorWithRed:1 withGreen:1 withBlue:1];
        onOffErasier = YES;
        [UIView animateWithDuration:0.3f animations:^{
            self.erasier.transform = CGAffineTransformMakeRotation(M_PI);
            self.erasier.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
        }];
        
    } else {
        
        [self setColor];
        onOffErasier = NO;
        self.erasier.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        
        
    }
    
}

- (IBAction)cleanAll:(UIButton *)sender {
    
    self.star.canvas.image = nil;
    
}

- (UIImage*)imageWithImage:(UIImage*) image scaledToSize:(CGSize) newSize {
    
    UIGraphicsBeginImageContext(newSize);
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

@end
