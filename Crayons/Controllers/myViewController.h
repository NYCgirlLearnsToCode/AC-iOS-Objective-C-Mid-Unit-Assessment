//
//  myViewController.h
//  Crayons
//
//  Created by Lisa J on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *colorsTableView;
@property (strong, nonatomic) NSArray* colors;
@end
