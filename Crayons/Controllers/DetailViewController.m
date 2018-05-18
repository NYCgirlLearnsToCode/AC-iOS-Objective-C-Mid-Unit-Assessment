//
//  DetailViewController.m
//  Crayons
//
//  Created by Lisa J on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "DetailViewController.h"
#import "Crayon.h"

@interface DetailViewController ()


@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UISlider *rSlider;
@property (weak, nonatomic) IBOutlet UISlider *bSlider;
@property (weak, nonatomic) IBOutlet UISlider *gSlider;
@property (weak, nonatomic) IBOutlet UILabel *rLabel;
@property (weak, nonatomic) IBOutlet UILabel *bLabel;
@property (weak, nonatomic) IBOutlet UILabel *gLabel;
@property (weak, nonatomic) IBOutlet UILabel *aLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation DetailViewController

UIColor *custom;
int r;
int g;
int b;
double a;

- (void)viewDidLoad {
    [super viewDidLoad];
    _colorLabel.text = self.recievedColor.name;
    _rSlider.value = self.recievedColor.red/255;
    _gSlider.value = self.recievedColor.green/255;
    _bSlider.value = self.recievedColor.blue/255;
    _rLabel.text = self.rLabel.text = [NSString stringWithFormat:@"Red: %f", self.rSlider.value*255];
    _gLabel.text = self.gLabel.text = [NSString stringWithFormat:@"Green: %f", self.gSlider.value*255];
    _bLabel.text = self.bLabel.text = [NSString stringWithFormat:@"Blue: %f", self.bSlider.value*255];
    self.stepper.value = 1.0;
    a = 1.0;
    self.aLabel.text = [NSString stringWithFormat:@"Alpha: %f", self.stepper.value];
    self.view.backgroundColor = [UIColor colorWithRed:self.recievedColor.red/255 green:self.recievedColor.green/255 blue:self.recievedColor.blue/255 alpha:a];
    NSLog(@"recieved %@",_recievedColor);
    // Do any additional setup after loading the view.
}


- (IBAction)rSliderChanged:(id)sender {
    self.rLabel.text = [NSString stringWithFormat:@"Red: %f", self.rSlider.value * 255];
    r = _rSlider.value * 255;
    NSLog(@"%d",r);
    custom = [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:_stepper.value];
    self.view.backgroundColor = custom;
}
- (IBAction)bSliderChanged:(id)sender {
    self.bLabel.text = [NSString stringWithFormat:@"Blue: %f", self.bSlider.value * 255];
    b = _bSlider.value * 255;
    custom = [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:_stepper.value];
    self.view.backgroundColor = custom;
}
- (IBAction)gSliderChanged:(id)sender {
    self.gLabel.text = [NSString stringWithFormat:@"Green: %f", self.gSlider.value * 255];
    g = _gSlider.value * 255;
    custom = [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:_stepper.value];
    self.view.backgroundColor = custom;
}
- (IBAction)stepperChanged:(id)sender {
    self.aLabel.text = [NSString stringWithFormat:@"Alpha: %f", self.stepper.value];
    a = _stepper.value;
    custom = [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha: a];
    self.view.backgroundColor = custom;
    
    
}
- (IBAction)resetPressed:(id)sender {
    _rSlider.value = self.recievedColor.red/255;
    _gSlider.value = self.recievedColor.green/255;
    _bSlider.value = self.recievedColor.blue/255;
    _stepper.value = 1.0;
     self.aLabel.text = [NSString stringWithFormat:@"Alpha: %f", self.stepper.value];
    self.view.backgroundColor = [UIColor colorWithRed:self.recievedColor.red/255.0f green:self.recievedColor.green/255.0f blue:self.recievedColor.blue/255.0f alpha: 1.0];
}


@end
