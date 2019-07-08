//
//  MainTabBarViewController.m
//  ios-ui-uitabbarcontroller
//
//  Created by john on 19/7/8.
//  Copyright © 2019年 future. All rights reserved.
//

#import "MainTabBarViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for(int i=0; i<10; i++){
        UIViewController *viewController1 = [[UIViewController alloc] init];
        viewController1.view.backgroundColor = [UIColor whiteColor];
        viewController1.title = [NSString stringWithFormat:@"Title %d", i];
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController1];
        navigationController.tabBarItem.title = [NSString stringWithFormat:@"item%d", i];
        navigationController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", i];
        [self addChildViewController:navigationController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
