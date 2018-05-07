//
//  AppDelegate.h
//  sheetViewDemo
//
//  Created by Aphy_Cui on 2018/5/7.
//  Copyright © 2018年 CYF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

