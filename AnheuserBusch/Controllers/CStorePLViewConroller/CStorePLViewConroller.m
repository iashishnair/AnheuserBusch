//
//  CStorePLViewConroller.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 30/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "CStorePLViewConroller.h"
#import "CStorePLTableViewCell.h"

@interface CStorePLViewConroller () <UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation CStorePLViewConroller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createUI {
    
    
    [self.view addSubview:self.tableView];
    
    [self addConstraints];
    
    
    
}

- (void)addConstraints {
    
    NSDictionary *views = @{@"tableView": self.tableView};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views]];

}

- (UITableView *)tableView {
    
    if(!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString* cellIdentifier =@"cellIdentifier";
    
    CStorePLTableViewCell *cell = (CStorePLTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        
        cell = [[CStorePLTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    return cell;
}



@end
