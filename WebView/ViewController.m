//
//  OnlineAppCreator.com
//  WebViewGold 3.6 (Objective-C)
//
/************************************************************************************************************************/
NSString *host = @"vidamaisverde.com.br";  // Domain host without http:// or www. (e.g. "google.com")
NSString *webviewurl = @"https://www.vidamaisverde.com.br";  //Your URL including http:// and www.
NSString *uselocalhtmlfolder = @"false";  //Set to "true" to use local "local-www/index.html" file instead of URL
NSString *openallexternalurlsinsafaribydefault = @"false";  //Set to "true" to open links in Safari, which are not your domain host
NSString *preventoverscroll = @"true";  //Set to "true" to stop the WebView bounce animation (recommended for most cases)
NSString *deletechache = @"false";  //Set to "true" to delete the chache while starting the app
NSString *okbutton = @"OK";  //Text label of the "OK" buttons
NSString *useragent = @"";  //Customized UserAgent for WebView URL requests (leave it empty to use the default iOS UserAgent)
NSString *firstrunmessagetitle = @"Welcome!";  //Title label of the "First run" alert box
NSString *firstrunmessage = @"Thank you for downloading this app!"; //Text label of the "First run" alert box
NSString *offlinetitle = @"Connection error";  //Title label of the "Offline" alert box
NSString *offlinemsg = @"Please check your connection.";  //Text of the "Offline" alert box
NSString *screen1 = @"Connection down?";  //Text label 1 of the "Offline" screen
NSString *screen2 = @"WiFi and mobile data are supported.";  //Text label 2 of the "Offline" screen
NSString *buttontext = @"Try again";  //Text label of the "Try again" button
NSString *ratemyapptitle = @"Do you like my app?";  //Title label of the "Rate my app" dialog box
NSString *ratemyapptext = @"If so, please take a moment to rate my app.";  //Text label of the "Rate my app" dialog
NSString *ratemyappyes = @"Rate"; //Text label of the "Yes" button on "Rate my app" dialog box
NSString *ratemyappno = @"No";  //Text label of the "No" button on "Rate my app" dialog box
NSString *ratemyappurl = @"http://itunes.apple.com";  //Your App Store URL for the "Rate my app" dialog (there is a "View in App Store" link in iTunes Connect)
NSString *becomefacebookfriendstitle = @"Stay tuned";  //Title label of the "Follow on Facebook" dialog
NSString *becomefacebookfriendstext = @"Become friends on Facebook?";  //Text label of the "Follow on Facebook" dialog
NSString *becomefacebookfriendsyes = @"Yes";  //Text label of the "Yes" button of the "Follow on Facebook" dialog
NSString *becomefacebookfriendsno = @"No";  //Text label of the "No" button of the "Follow on Facebook" dialog
NSString *becomefacebookfriendsurl = @"https://www.facebook.com/OnlineAppCreator/"; //URL of your Facebook fanpage
NSString *imagedownloadedtitle = @"Image saved to your photo gallery.";  //Title label of the "Image saved to your photo gallery" dialog box
NSString *imagenotfound = @"Image not found.";  //Title label of the "Image not found" dialog box


#define statusbarbackgroundcolor [UIColor colorWithRed:0/255.0f green:0/255.0f blue:255/255.0f alpha:1.0]
NSString *usemystatusbarbackgroundcolor = @"false"; //Set to "true" to activate the custom status bar background color
//Use a service like "RGB Color Picker": http://www.colorpicker.com

#define statusbarcolor [UIColor colorWithRed:225/255.0f green:0/255.0f blue:0/255.0f alpha:1.0]
NSString *usemystatusbarcolor = @"false"; //Set to "true" to activate the custom status bar text color (inofficial API, see http://stackoverflow.com/questions/23512700/how-to-set-text-color-of-status-bar-other-than-white-and-black)
//Use a service like "RGB Color Picker": http://www.colorpicker.com }

/*************************************************************************************************************************/

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    BOOL backgroundaudio;
    NSError *setCategoryError = nil;
    backgroundaudio = [audioSession setCategory:AVAudioSessionCategoryPlayback
                             error:&setCategoryError];
    if ([usemystatusbarcolor  isEqual: @"true"]) {
    [self setStatusBarColor:statusbarcolor];
    }
    if ([usemystatusbarbackgroundcolor  isEqual: @"true"]) {
    [self.statusbarView setBackgroundColor:statusbarbackgroundcolor];
    }
    if ([useragent  isEqual: @""]) {}else{
    NSDictionary *customuseragent = [NSDictionary dictionaryWithObjectsAndKeys:useragent, @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:customuseragent];
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    CGRect phonecheck = [[UIScreen mainScreen] bounds];
    double statusbar = 20;
    double height = phonecheck.size.height = phonecheck.size.height-statusbar;
    _webView.frame= CGRectMake(0, 20, phonecheck.size.width, height);
    _loadingSign.center = CGPointMake((phonecheck.size.width/2), (phonecheck.size.height/2));
    if (phonecheck.size.height == 667-statusbar) {
        _offline.frame= CGRectMake(103,228,170,170);
        _text1.frame= CGRectMake(40,400,295,50);
        _text2.frame= CGRectMake(25,435,326,50);
        _tryButton.frame= CGRectMake(110,520,150,20);
    }
    if (phonecheck.size.height == 736-statusbar) {
        _offline.frame= CGRectMake(123,205,170,170);
        _text1.frame= CGRectMake(60,346,295,50);
        _text2.frame= CGRectMake(44,374,326,50);
        _tryButton.frame= CGRectMake(132,453,150,20);
    }
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    NSURL*url = [NSURL URLWithString:webviewurl];
    host = url.host;
    _webView.delegate = self;
    if ([preventoverscroll  isEqual: @"true"]) {
        _webView.scrollView.bounces = NO;
    }
    if ([deletechache  isEqual: @"true"]) {
        [[NSURLCache sharedURLCache] removeAllCachedResponses];
    }
    _webView.scalesPageToFit = YES;
    [_webView.scrollView setBouncesZoom:NO];
    [_webView setAutoresizingMask:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth)];
    _offline.hidden = true;
    [_loadingSign stopAnimating];
    _loadingSign.hidden = true;
    [_tryButton setTitle:buttontext forState:UIControlStateNormal];
    [_tryButton setTitle:buttontext forState:UIControlStateSelected];
    _text1.text = screen1;
    _text2.text = screen2;
    _text1.hidden = true;
    _text2.hidden = true;
    _tryButton.hidden = true;
    NSString *onlinecheck = [url absoluteString];
    if ([uselocalhtmlfolder  isEqual: @"true"]) {
        NSURL *urllocal = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]];
        [_webView loadRequest:[NSURLRequest requestWithURL:urllocal]];
    } else{
        if ([onlinecheck length] == 0){
            _offline.hidden = false;
            _webView.hidden = true;
            _text1.hidden = false;
            _text2.hidden = false;
            _tryButton.hidden = false;
            _loadingSign.hidden = true;
        }
        else {
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            
            [_webView loadRequest:request];
        }
    }
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    srand(time(NULL));
    int randnum = arc4random()%10;
    if ([user boolForKey:@"ratemyapp"] == 0) {
        { if (randnum==1){
            [user setObject:[NSString stringWithFormat:@"1"] forKey:@"ratemyapp"];
            [user synchronize];
            [UIAlertView alertViewWithTitle:ratemyapptitle
                                    message: ratemyapptext
                          cancelButtonTitle:ratemyappno
                          otherButtonTitles:[NSArray arrayWithObjects:ratemyappyes, nil]
                                  onDismiss:^(int buttonIndex)
             {
                 NSString *prefeedback = [NSString stringWithFormat:ratemyappurl];
                 NSURL *feedback = [NSURL URLWithString:prefeedback];
                 [[UIApplication sharedApplication] openURL:feedback];
             }
                                   onCancel:^()
             {
             }
             ];
        }}}
    if ([user boolForKey:@"becomefbfriends"] == 0) {
        { if (randnum==2){
            [user setObject:[NSString stringWithFormat:@"1"] forKey:@"becomefbfriends"];
            [user synchronize];
            [UIAlertView alertViewWithTitle:becomefacebookfriendstitle
                                    message: becomefacebookfriendstext
                          cancelButtonTitle:becomefacebookfriendsno
                          otherButtonTitles:[NSArray arrayWithObjects:becomefacebookfriendsyes, nil]
                                  onDismiss:^(int buttonIndex)
             {
                 NSString *prefeedback = [NSString stringWithFormat:becomefacebookfriendsurl];
                 NSURL *feedback = [NSURL URLWithString:prefeedback];
                 [[UIApplication sharedApplication] openURL:feedback];
             }
                                   onCancel:^()
             {
             }
             ];
        }}}
    if ([user boolForKey:@"firstrun"] == 0) {{
        UIAlertView *showfirstrunmessage = [[UIAlertView alloc] initWithTitle: firstrunmessagetitle message: firstrunmessage delegate: self cancelButtonTitle: okbutton otherButtonTitles: nil];
        [user setObject:[NSString stringWithFormat:@"1"] forKey:@"firstrun"];
        [user synchronize];
        [showfirstrunmessage show];
    }}
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)tryagain:(id)sender {
    NSURL*url = [NSURL URLWithString:webviewurl];
    NSString *onlinecheckagain = [[NSString alloc] initWithContentsOfURL:url];
    if ([onlinecheckagain length] == 0) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: offlinetitle message: offlinemsg delegate: self cancelButtonTitle: okbutton otherButtonTitles: nil];
    [alert show];
    }
    else {
        _offline.hidden = true;
        _text1.hidden = true;
        _text2.hidden = true;
        _tryButton.hidden = true;
        _webView.hidden = false;
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }

}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    [_loadingSign startAnimating];
    _loadingSign.hidden = false;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_loadingSign stopAnimating];
    _loadingSign.hidden = true;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSURL* url = [NSURL URLWithString:webviewurl];
    
    NSString *onlinecheckagain = [[NSString alloc] initWithContentsOfURL:url];
    if ([onlinecheckagain length] == 0) {
        webView.hidden = true;
        _loadingSign.hidden = true;
        _offline.hidden = false;
        _text1.hidden = false;
        _text2.hidden = false;
        _tryButton.hidden = false;
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *requestURL = [request URL];
    
    if ([requestURL.scheme isEqualToString:@"mailto"] || [requestURL.scheme isEqualToString:@"tel"] || [requestURL.scheme isEqualToString:@"maps"]){
        [[UIApplication sharedApplication] openURL:requestURL];
        return NO;
    }
    
    if([requestURL.absoluteString hasPrefix:@"savethisimage://?url="]) {
        
        NSString* imageURL = [requestURL.absoluteString substringFromIndex:[@"savethisimage://?url=" length]];
        [self downloadImageAndSaveToGallary:imageURL];
        [_loadingSign stopAnimating];
        _loadingSign.hidden = true;
        return NO;
    }
    
    if(![host isEqualToString:[requestURL host]] && ( navigationType == UIWebViewNavigationTypeLinkClicked ) &&  [openallexternalurlsinsafaribydefault isEqual: @"true"]) {
        [[UIApplication sharedApplication] openURL:requestURL];
        [_loadingSign stopAnimating];
        _loadingSign.hidden = true;
        return NO;
    }
    if ([[requestURL host] isEqualToString:@"push.send.cancel"]) { [[UIApplication sharedApplication] cancelAllLocalNotifications]; return NO;}
    if ([[requestURL host] isEqualToString:@"push.send"]) {
        NSURL *prerequest = requestURL;
        NSString *finished = [prerequest absoluteString];
        NSArray *requested = [finished componentsSeparatedByString: @"="];
        NSString *seconds = [requested objectAtIndex: 1];
        NSArray *logindetails = [finished componentsSeparatedByString: @"msg!"];
        NSString *logindetected = [logindetails objectAtIndex: 1];
        NSArray *logindetailsmore = [logindetected componentsSeparatedByString: @"&!#"];
        NSString *msg0 = [logindetailsmore objectAtIndex: 0];
        NSString *button0 = [logindetailsmore objectAtIndex: 1];
        NSString *msg = [msg0 stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
        NSString *button = [button0 stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
        double sendafterseconds = [seconds doubleValue];
        UILocalNotification *pushmsg1 =     [[UILocalNotification alloc] init];
        pushmsg1.fireDate = [[NSDate date] dateByAddingTimeInterval:sendafterseconds];
        pushmsg1.timeZone = [NSTimeZone defaultTimeZone];
        pushmsg1.alertBody = msg;
        pushmsg1.soundName = UILocalNotificationDefaultSoundName;
        pushmsg1.alertAction = button;
        [[UIApplication sharedApplication]     scheduleLocalNotification:pushmsg1];
        return NO;
    }
    if (uselocalhtmlfolder == @"true") {
        if ( ( [ [ requestURL scheme ] isEqualToString: @"http" ] || [ [ requestURL scheme ] isEqualToString: @"https" ] || [ [ requestURL scheme ]isEqualToString: @"mailto" ]) && ( navigationType == UIWebViewNavigationTypeLinkClicked ) ) {
            [[UIApplication sharedApplication] openURL:requestURL];
            return NO;
        }else{
            return YES;
        }}else{
            
            /* Open specific URL "http://m.facebook.com" links in Safari START */
            if ([[requestURL host] isEqualToString:@"m.facebook.com"]) /* WITHOUT HTTP/HTTPS */{
                [_loadingSign stopAnimating];
                _loadingSign.hidden = true;
                [[UIApplication sharedApplication] openURL:requestURL];
                return NO;
            } /* Open specific URL "http://m.facebook.com" links in Safari END */
            
            return YES;
        }
}

-(void) downloadImageAndSaveToGallary: (NSString *) imageURLString {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageURLString]];
        if ( data == nil ) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_loadingSign stopAnimating];
                _loadingSign.hidden = true;
                [[UIAlertView alertViewWithTitle:imagenotfound message:nil cancelButtonTitle:okbutton] show];
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                UIImageWriteToSavedPhotosAlbum([[UIImage alloc] initWithData:data], nil, nil, nil);
            });
            [_loadingSign stopAnimating];
            _loadingSign.hidden = true;
            
            [[UIAlertView alertViewWithTitle:imagedownloadedtitle message:nil cancelButtonTitle:okbutton] show];
        });
    });
    
}
- (BOOL) setStatusBarColor: (UIColor *) color
{
    id statusBarWindow = [[UIApplication sharedApplication] valueForKey:@"statusBarWindow"];
    id statusBar = [statusBarWindow valueForKey:@"statusBar"];
    SEL setForegroundColor_sel = NSSelectorFromString(@"setForegroundColor:");
    if([statusBar respondsToSelector:setForegroundColor_sel]) {
        [statusBar performSelector:setForegroundColor_sel withObject:color];
        return YES;
    } else {
        return NO;
    }
}
@end
