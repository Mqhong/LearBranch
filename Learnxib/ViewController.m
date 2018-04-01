//
//  ViewController.m
//  Learnxib
//
//  Created by mm on 2018/3/31.
//  Copyright © 2018年 mm. All rights reserved.
//

#import "ViewController.h"
#import "LearnCell.h"
#import "LearnM.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *table;
@property(nonatomic,strong) NSArray *tableViewArr;
@end
//这是在master中进行的修改
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initData];
    [self _initView];
}
-(void)_initData{
    NSMutableArray *marr = [NSMutableArray array];
    for (int i = 0; i< 40; i++) {
        LearnM *m = [LearnM new];
        m.titleStr = [NSString stringWithFormat:@"%i",i];
        [marr addObject:m];
    }
    self.tableViewArr = [NSArray arrayWithArray:marr];
}
-(void)_initView{
    [self.view addSubview:self.table];
    [self.table registerNib:[UINib nibWithNibName:@"LearnCell" bundle:nil] forCellReuseIdentifier:@"LearnCell"];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"fuck:%li",indexPath.row);
    LearnM *m = self.tableViewArr[indexPath.row];
    m.isClick = !m.isClick;
    m.isRote = !m.isRote;
//    [self.table reloadData];
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LearnCell *cell = (LearnCell *)[tableView dequeueReusableCellWithIdentifier:@"LearnCell"];
    
    if (cell == nil) {
        cell = [[LearnCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LearnCell"];
    }
    [cell setData:self.tableViewArr[indexPath.row]];
    
//    cell.textLabel.text = [NSString stringWithFormat:@"fuck"];
//    cell.titleLbl.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableViewArr count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(UITableView *)table{
    if (_table == nil) {
        _table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
