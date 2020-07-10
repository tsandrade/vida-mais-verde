//  Created by Mugunth on 21/03/11.
//  Read this: http://blog.mugunthkumar.com/coding/ios-code-block-based-uialertview-and-uiactionsheet

typedef void (^VoidBlock)();

typedef void (^DismissBlock)(int buttonIndex);
typedef void (^CancelBlock)();
typedef void (^PhotoPickedBlock)(UIImage *chosenImage);

#define kPhotoActionSheetTag 10000