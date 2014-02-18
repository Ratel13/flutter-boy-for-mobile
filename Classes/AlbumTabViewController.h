//
//  AlbumTabViewController.h
//  GreTest
//
//  Created by lyy on 13-7-23.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "CCUIKit.h"
#import <UIKit/UIKit.h>
#import <iAd/ADBannerView.h>

@interface AlbumTabViewController : UIViewController<ADBannerViewDelegate>
{
    ADBannerView *adView;
    UILabel *adStatus;
}

+ (AlbumTabViewController *)shareAlbumTabViewController;
- (BOOL)initView;
- (void)bannerViewDidLoadAd:(ADBannerView *)banner;
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave;
- (void)bannerViewActionDidFinish:(ADBannerView *)banner;
- (void)bannerView:(ADBannerView *) didFailToReceiveAdWithError:(NSError *)error;
- (void)adAvailabilityDidChange;

@property (nonatomic, retain) ADBannerView *adView;
@property (nonatomic, retain) UILabel *adStatus;


@end