//
//  LearnCell.m
//  Learnxib
//
//  Created by mm on 2018/3/31.
//  Copyright © 2018年 mm. All rights reserved.
//

#import "LearnCell.h"
#import "LearnM.h"
@implementation LearnCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)setData:(LearnM *)M{
    if (M.isRote == YES) {
        [self.juhua startAnimating];
    }else{
        [self.juhua stopAnimating];
    }
    
    if (M.isClick == YES) {
        [self.switch1 setOn:YES];
    }else{
        [self.switch1 setOn:NO];
    }
    
    [self.switch1 addTarget:self action:@selector(TargetClick) forControlEvents:UIControlEventTouchUpInside];
    self.titleLbl.text = M.titleStr;
}

-(void)TargetClick{
    NSLog(@"事件发生啦");
}

@end
