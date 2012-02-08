//
//  CameraAppDelegate.h
//  Camera
//
//  Created by 西巻 宏一 on 11/03/24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraViewController;

@interface CameraAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CameraViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CameraViewController *viewController;

@end

