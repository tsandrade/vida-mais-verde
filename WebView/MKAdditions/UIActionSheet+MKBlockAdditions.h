//  Created by Mugunth on 21/03/11.
//  Read this: http://blog.mugunthkumar.com/coding/ios-code-block-based-uialertview-and-uiactionsheet


#import <UIKit/UIKit.h>
#import "MKBlockAdditions.h"

@interface UIActionSheet (MKBlockAdditions) <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
+(void) actionSheetWithTitle:(NSString*) title
                     message:(NSString*) message
                     buttons:(NSArray*) buttonTitles
                  showInView:(UIView*) view
                   onDismiss:(DismissBlock) dismissed                   
                    onCancel:(CancelBlock) cancelled;


+ (void) actionSheetWithTitle:(NSString*) title                     
                      message:(NSString*) message          
       destructiveButtonTitle:(NSString*) destructiveButtonTitle
                      buttons:(NSArray*) buttonTitles
                   showInView:(UIView*) view
                    onDismiss:(DismissBlock) dismissed                   
                     onCancel:(CancelBlock) cancelled;


+ (void) photoPickerWithTitle:(NSString*) title
                   showInView:(UIView*) view
                    presentVC:(UIViewController*) presentView
                onPhotoPicked:(PhotoPickedBlock) photoPicked                   
                     onCancel:(CancelBlock) cancelled;

@end
