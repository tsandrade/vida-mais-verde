//
//  OnlineAppCreator.com
//  WebViewGold 3.6 (Objective-C)
//

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingSign;
@property (weak, nonatomic) IBOutlet UIImageView *offline;
@property (weak, nonatomic) IBOutlet UILabel *text1;
@property (weak, nonatomic) IBOutlet UILabel *text2;
@property (weak, nonatomic) IBOutlet UIButton *tryButton;
@property (weak, nonatomic) IBOutlet UIView *statusbarView;

- (IBAction)tryagain:(id)sender;

@end

