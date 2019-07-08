//
//  ViewController.m
//  ios-nsfilenamager
//
//  Created by john on 19/7/8.
//  Copyright © 2019年 future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"image1.png" ofType:nil];
    NSLog(@"Image path:%@", imagePath);
    
    NSString *documentDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *imagesDirectory = [documentDirectoryPath stringByAppendingString:@"/ImagesTemp"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    [fileManager createDirectoryAtPath:imagesDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    if(error){
        NSLog(@"Error creating directory %@", error);
    }
    
    NSString *imageDestinationPath = [imagesDirectory stringByAppendingString:@"/tmp1.png"];
    [fileManager removeItemAtPath:imageDestinationPath error:&error];
    [fileManager copyItemAtPath:imagePath toPath:imageDestinationPath error:&error];
    if(error){
        NSLog(@"Error copy file %@", error);
    }
    
    UIImage *uiImage = [UIImage imageWithContentsOfFile:imageDestinationPath];
    UIImageView *uiImageView = [[UIImageView alloc] initWithImage:uiImage];
    uiImageView.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:uiImageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
