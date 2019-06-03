#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIControl.h>
#import <Cephei/HBPreferences.h>
#import "libcolorpicker.h"

HBPreferences *preferences;
NSDictionary *fetchColor;
NSString *nongColor;
NSString *unlockColor;

@interface _UILegibilitySettings : NSObject
@property (nonatomic,retain) UIColor * primaryColor;
@property (nonatomic,retain) UIColor * contentColor;
@property (nonatomic,retain) UIColor * secondaryColor;
@end

@interface SBUILegibilityLabel : UIView
@property (nonatomic,retain) _UILegibilitySettings * legibilitySettings;
@property (nonatomic,copy) NSString * string;
-(void)_updateLabelForLegibilitySettings;
-(void)_updateLegibilityView;
-(void)setPrimaryColor:(UIColor *)color;
@end

@interface NCNotificationListSectionRevealHintView
-(SBUILegibilityLabel *)revealHintTitle;
-(void)setLegibilitySettings:(_UILegibilitySettings *)settings;
@end

@interface NCNotificationCombinedListViewController : UIViewController
-(NCNotificationListSectionRevealHintView *)revealHintView;
@end



@interface SBTelephonySubscriptionContext
@property (nonatomic,copy) NSString * cachedCTOperatorName;
@end

@interface SBTelephonyManager
-(SBTelephonySubscriptionContext *)subscriptionContext;
@end




@interface SBUICallToActionLabel 
-(NSString *)text;
-(SBUILegibilityLabel *)label;
@end
