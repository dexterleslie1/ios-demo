//
//  ViewController.m
//  iOS-image-compression
//
//  Created by MacOS on 2020/1/9.
//  Copyright © 2020 MacOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOriginal;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCompression;
@property (weak, nonatomic) IBOutlet UIButton *buttonCompression;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 显示原图
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpeg" inDirectory:@"Images"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    [self.imageViewOriginal setImage: image];

    [self.buttonCompression addTarget:self action:@selector(buttonCompressionOnClick:) forControlEvents:UIControlEventTouchDown];
}

- (void) buttonCompressionOnClick:(id) sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpeg" inDirectory:@"Images"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    
    CGFloat ratio = (CGFloat)800/image.size.width;
    CGSize size = CGSizeMake((NSUInteger)(image.size.width * ratio),
                                           (NSUInteger)(image.size.height * ratio));
    UIGraphicsBeginImageContext(size);
    // Use image to draw (drawInRect:), image is larger but more compression time
    // Use result image to draw, image is smaller but less compression time
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *imageReduceFrame = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *dataOriginal = UIImageJPEGRepresentation(image, 1.0);
    NSData *data = UIImageJPEGRepresentation(imageReduceFrame, 0.5);
    
    NSString *imageBase64 = [NSString stringWithFormat:@"%@",[data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]] ;
    
    UIImage *imageCompression = [UIImage imageWithData:data];
    
    [self.imageViewCompression setImage:imageCompression];
    NSLog(@"原图 %lu KB，压缩后图片 %lu KB", dataOriginal.length/1024, data.length/1024);
    NSLog(@"原图宽：%f，高：%f，压缩后图片宽：%f，高：%f", image.size.width, image.size.height,
          imageCompression.size.width, imageCompression.size.height);
    
    NSLog(@"图片压缩后base64：%@", imageBase64);
}

@end
