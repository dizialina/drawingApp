//
//  AEStar.m
//  DrawingsHomework
//
//  Created by Admin on 23.12.15.
//  Copyright © 2015 Alina Egorova. All rights reserved.
//

#import "AEStar.h"

@implementation AEStar {
    
    CGPoint lastPoint;
    BOOL swipeState;
    
}

- (void) drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    //NSLog(@"drawRect %@", NSStringFromCGRect(rect));
    
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [[UIColor grayColor] CGColor];
    
    self.brushWidth = 0.75f;
    
    
    
    
    
    
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch* touch = [touches anyObject];
    lastPoint = [touch locationInView:self];
    
    
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.canvas.image drawInRect:CGRectMake(0.f, 0.f, self.frame.size.width, self.frame.size.height)];
    
    CGContextMoveToPoint(context, lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(context, point.x, point.y);
    
    CGContextSetLineWidth(context, self.brushWidth * 12);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextSetStrokeColorWithColor(context, [self.paintColor CGColor]);
    CGContextStrokePath(context);
    
    self.canvas.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    lastPoint = point;
    
    
}

- (void) setColorWithRed:(CGFloat) red withGreen:(CGFloat) green withBlue:(CGFloat) blue {
    
    self.paintColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
    
}

- (void) makeBrushWidth:(CGFloat)brushWidth {
    
    self.brushWidth = brushWidth;
    
}


@end
