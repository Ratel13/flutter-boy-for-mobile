//
//  AlbumTabViewController.cpp
//  GreTest
//
//  Created by lyy on 13-7-23.
//
//

#include "AlbumTabViewController.h"

#import "CCUIKit.h"

#import "EAGLView.h"


using namespace std;

@implementation AlbumTabViewController

@synthesize adStatus;
@synthesize adView;
#define iPhone5_macro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
+ (AlbumTabViewController *)shareAlbumTabViewController
{
    static AlbumTabViewController * g_AlbumTabViewController;
    if (!g_AlbumTabViewController)
    {
        g_AlbumTabViewController = [[AlbumTabViewController alloc] init];
        
    }
    return  g_AlbumTabViewController;
}
- (BOOL)initView
{
    adView = [[ADBannerView alloc] initWithFrame:CGRectMake(0,0, 320, 50)];
    self.adView.delegate = self;
    self.adView.backgroundColor = [UIColor whiteColor];
    [[EAGLView sharedEGLView] addSubview:adView];
   
    return true;
}

- (void)adAvailabilityDidChange {
    NSLog(@"[iAd]: Ads are available! Let's display one!");
    
    //    if([ADManager sharedAdManager].canPresentModalAd == YES)
    //        [[ADManager sharedAdManager] presentModalAdFromViewController:self];
}

- (void)cancelBannerViewAction {
    NSLog(@"Banner was cancelled!");
    
    self.adStatus.text = @"[iAd]: Bannes was closed.";
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    NSLog(@"[iAd]: Ad did load.");
    self.adStatus.text = @"[iAd]: Ad did load.";
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    NSLog(@"[iAd]: An action was started from the banner. Application will quit: %d", willLeave);
    
    self.adStatus.text = @"[iAd]: An action was started from the banner. Application will quit: %d", willLeave;
    
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
    NSLog(@"[iAd]: Action finished.");
    
    self.adStatus.text = @"[iAd]: Action finished.";
}

- (void)bannerView:(ADBannerView *) didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"[iAd]: Faild to load the banner: %@", error);
    
    self.adStatus.text = @"[iAd]: Faild to load the banner: %@", error;
}

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
@end