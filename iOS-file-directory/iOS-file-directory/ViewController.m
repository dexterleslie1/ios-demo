//
//  ViewController.m
//  iOS-file-directory
//
//  Created by MacOS on 2020/10/17.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // home目录路径
    NSString *homeDirectory = NSHomeDirectory();
    NSLog(@"home目录路径为 %@", homeDirectory);
    
    // xxx.app目录路径
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSLog(@"xxx.app目录路径为 %@", bundlePath);
    
    // bundle中文件资源
    NSString *image1Path = [[NSBundle mainBundle] pathForResource:@"image1.png" ofType:nil];
    NSLog(@"图片image1.png路径为 %@", image1Path);
    NSString *expectedPath = [bundlePath stringByAppendingPathComponent:@"image1.png"];
    NSAssert([expectedPath isEqualToString:image1Path], @"期望路径 %@ 和实际路径 %@ 不相符", expectedPath, image1Path);
    
    // Documents目录
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"Documents目录路径为 %@", documentDirectory);
    
    // Documents目录创建子目录
    NSString *documentSubdirImages = [documentDirectory stringByAppendingPathComponent:@"Images"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    [fileManager createDirectoryAtPath:documentSubdirImages withIntermediateDirectories:YES attributes:nil error:&error];
    if(error){
        NSLog(@"Documents目录中创建子目录Images失败，原因 %@", error);
    }
    BOOL isDirectory;
    BOOL exists = [fileManager fileExistsAtPath:documentSubdirImages isDirectory:&isDirectory];
    NSAssert(exists && isDirectory, @"子目录 %@ 不存在", documentSubdirImages);
    
    // 复制bundle中image1.png到Documents/Images子目录中
    NSString *targetImage1Path = [documentSubdirImages stringByAppendingPathComponent:@"targetImage1.png"];
    [fileManager removeItemAtPath:targetImage1Path error:&error];
    if(error) {
        NSLog(@"删除文件 %@ 错误，原因 %@", targetImage1Path, error);
    }
    [fileManager copyItemAtPath:image1Path toPath:targetImage1Path error:&error];
    if(error) {
        NSLog(@"复制文件 %@ 到 %@ 错误，原因 %@", image1Path, targetImage1Path, error);
    }
    
    // 显示Documents/Images子目录中内容
    NSArray<NSString *> *files = [fileManager contentsOfDirectoryAtPath:documentSubdirImages error:&error];
    if(error) {
        NSLog(@"使用参数 %@ 调用 contentsOfDirectoryAtPath 错误，原因 %@" , documentSubdirImages, error);
    }
    NSAssert(files.count==1, @"file.count=%ld不等于1", files.count);
    NSString *pathTemporary = [documentSubdirImages stringByAppendingPathComponent: files[0]];
    NSAssert([pathTemporary isEqualToString:targetImage1Path], @"期望路径 %@ 不等于 实际路径 %@", targetImage1Path, pathTemporary);
}


@end
