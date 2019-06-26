//
//  AppDelegate.h
//  My_BaseProj
//
//  Created by Administrator on 03/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

+ (instancetype)sharedInstance;

//- (void)saveContext;


@end

