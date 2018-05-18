//
//  DetailViewController.h
//  Crayons
//
//  Created by Lisa J on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Crayon.h"

@interface DetailViewController : UIViewController
@property (strong, nonatomic) Crayon *recievedColor;
@property int *number;

@end
