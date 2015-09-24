//
//  AppDelegate.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>

//#warning Есть глобальное замечание по структуре проекта. Вью контроллеры должны быть в папке ViewControllers, каждый в сове папке. Модели - в папке моделей (каждая в своей папке). Менеджеры/сервисы - в папке сервисов и т.д.

//#warning забыл написать в описании к заданию, что в случае испольщования cocoapods папке Pods должны быть добавлена в gitignore

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

- (NSURL *)applicationDocumentsDirectory;

@end

