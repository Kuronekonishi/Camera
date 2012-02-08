//
//  CameraViewController.m
//  Camera
//
//  Created by 西巻 宏一 on 11/03/24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"

@implementation CameraViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

-(IBAction)showCameraSheet
{
	UIActionSheet* sheet;
	sheet=[[UIActionSheet alloc]
		   initWithTitle:@"Select Source Type" 
		   delegate:self 
		   cancelButtonTitle:@"Cancel" 
		   destructiveButtonTitle:nil 
		   otherButtonTitles:@"Photo Library",@"Camera",@"Saved Photos",nil];
	[sheet autorelease];
	
	[sheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	// ボタンインデックスをチェックする
    if (buttonIndex >= 3) {
        return;
    }
	
    // ソースタイプを決定する
    UIImagePickerControllerSourceType   sourceType = 0;
    switch (buttonIndex) {
		case 0: {
			sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
			break;
		}
		case 1: {
			sourceType = UIImagePickerControllerSourceTypeCamera;
			break;
		}
		case 2: {
			sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
			break;
		}
    }
	
    // 使用可能かどうかチェックする
    if (![UIImagePickerController isSourceTypeAvailable:sourceType]) {  
        return;
    }
	
    // イメージピッカーを作る
    UIImagePickerController*    imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker autorelease];
    imagePicker.sourceType = sourceType;
    imagePicker.allowsImageEditing = YES;
    imagePicker.delegate = self;
	
    // イメージピッカーを表示する
    [self presentModalViewController:imagePicker animated:YES];
	
}

- (void)imagePickerController:(UIImagePickerController*)picker 
        didFinishPickingImage:(UIImage*)image 
				  editingInfo:(NSDictionary*)editingInfo
{
    // イメージピッカーを隠す
    [self dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker
{
    // イメージピッカーを隠す
    [self dismissModalViewControllerAnimated:YES];
}

@end
