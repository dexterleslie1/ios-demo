//
//  TestingTableView.m
//  ios-ui-uitableview
//
//  Created by john on 19/7/9.
//  Copyright © 2019年 future. All rights reserved.
//

#import "TestingTableView.h"

@implementation TestingTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init{
    self = [super init];
    if(self){
        self.data = [[NSMutableArray alloc] init];
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell1"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"testCell1"];
    }
    
    NSNumber *number = self.data[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Row %@", number];
    return cell;
}

@end
