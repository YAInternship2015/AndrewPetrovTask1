//
//  AppDelegate.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning Есть глобальное замечание по структуре проекта. Вью контроллеры должны быть в папке ViewControllers, каждый в сове папке. Модели - в папке моделей (каждая в своей папке). Менеджеры/сервисы - в папке сервисов и т.д.

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

