//
//  LearnCell.h
//  Learnxib
//
//  Created by mm on 2018/3/31.
//  Copyright © 2018年 mm. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LearnM;
@interface LearnCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UISwitch *switch1;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *juhua;
-(void)setData:(LearnM *)M;
@end
