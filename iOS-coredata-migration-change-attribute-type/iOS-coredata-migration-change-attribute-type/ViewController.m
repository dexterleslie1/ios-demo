//
//  ViewController.m
//  iOS-coredata-migration-change-attribute-type
//
//  Created by MacOS on 2021/1/17.
//

#import "ViewController.h"
#import "CoreDataManager.h"
#import "Person+CoreDataClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[CoreDataManager sharedInstance] setupUserDB:@"0001"];
    
    [self.buttonAddUser addTarget:self action:@selector(onClickedButtonAddUser:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) onClickedButtonAddUser:(UIButton *) button {
    NSManagedObjectContext *context = [[CoreDataManager sharedInstance] getChildContext];
    [context performBlockAndWait:^{
        Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
        person.name = @"person1";
//        person.age = @"46";
        person.age = 46;
        
        [[CoreDataManager sharedInstance] save:context];
        NSLog(@"新增完毕");
    }];
}

@end
