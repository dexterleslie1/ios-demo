//
//  ViewController.m
//  iOS-group-folder
//
//  Created by MacOS on 2020/1/9.
//  Copyright © 2020 MacOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image1" ofType:@"png"];
    NSLog(@"Image path for group %@", path);
    
    path = [[NSBundle mainBundle] pathForResource:@"image1" ofType:@"png" inDirectory:@"FolderReferences"];
    NSLog(@"Image path for folder references %@", path);
}


@end
