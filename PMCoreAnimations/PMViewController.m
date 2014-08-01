//
//  PMViewController.m
//  PMCoreAnimations
//
//  Created by Paola Mata Maldonado on 7/23/14.
//
//

#import "PMViewController.h"

@interface PMViewController ()

@end

@implementation PMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"NYCTL.jpg"];
    self.imageLayer = [CALayer layer];
	self.imageLayer.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
	self.imageLayer.position = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/3);
	self.imageLayer.contents = (id)image.CGImage;
	
	// Add layer as a sublayer of the UIView's layer
	[self.view.layer addSublayer:self.imageLayer];
    
    [self logoAnimation];
}

-(void)logoAnimation{

	CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	rotationAnimation.toValue = @(2.0 * M_PI);
	rotationAnimation.duration = 1.0f;
	rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

	CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @0.0;
	scaleAnimation.toValue = @1.0;
	scaleAnimation.duration = 1.0f;
	scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.fromValue = @1.0f;
    fadeAnimation.toValue = @0.0f;
    fadeAnimation.beginTime = 1.0;
    fadeAnimation.duration = 2.25;
    fadeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 3.25f;
    animationGroup.autoreverses = YES;
    animationGroup.repeatCount = 0.5;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeBoth;
    [animationGroup setAnimations:@[rotationAnimation, scaleAnimation, fadeAnimation]];

	[self.imageLayer addAnimation:animationGroup forKey:@"animationGroup"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
