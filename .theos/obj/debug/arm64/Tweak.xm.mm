#line 1 "Tweak.xm"
#import "Tweak.h"

void reloadColors() {
    fetchColor = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.archergs.labelPrefs.plist"];
	nongColor = fetchColor[@"nongColor"];
	unlockColor = fetchColor[@"unlockColor"];
	[preferences setObject:nongColor forKey:@"nongColor"];
	[preferences setObject:unlockColor forKey:@"unlockColor"];
	NSLog(@"nongColor: %@", nongColor);
}


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBTelephonyManager; @class SBUICallToActionLabel; @class NCNotificationListSectionRevealHintView; 


#line 12 "Tweak.xm"
static void (*_logos_orig$Labels$NCNotificationListSectionRevealHintView$setLegibilitySettings$)(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST, SEL, _UILegibilitySettings *); static void _logos_method$Labels$NCNotificationListSectionRevealHintView$setLegibilitySettings$(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST, SEL, _UILegibilitySettings *); static void (*_logos_orig$Labels$NCNotificationListSectionRevealHintView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Labels$NCNotificationListSectionRevealHintView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Labels$SBUICallToActionLabel$setText$)(_LOGOS_SELF_TYPE_NORMAL SBUICallToActionLabel* _LOGOS_SELF_CONST, SEL, NSString *); static void _logos_method$Labels$SBUICallToActionLabel$setText$(_LOGOS_SELF_TYPE_NORMAL SBUICallToActionLabel* _LOGOS_SELF_CONST, SEL, NSString *); static void (*_logos_orig$Labels$SBUICallToActionLabel$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBUICallToActionLabel* _LOGOS_SELF_CONST, SEL); static void _logos_method$Labels$SBUICallToActionLabel$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBUICallToActionLabel* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Labels$SBTelephonyManager$_reallySetOperatorName$inSubscriptionContext$)(_LOGOS_SELF_TYPE_NORMAL SBTelephonyManager* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Labels$SBTelephonyManager$_reallySetOperatorName$inSubscriptionContext$(_LOGOS_SELF_TYPE_NORMAL SBTelephonyManager* _LOGOS_SELF_CONST, SEL, id, id); 









static void _logos_method$Labels$NCNotificationListSectionRevealHintView$setLegibilitySettings$(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _UILegibilitySettings * settings){
	NSString *customColor = [preferences objectForKey:@"nongColor"];
	[settings setPrimaryColor:LCPParseColorString(customColor, @"#FFFFFF")];
	_logos_orig$Labels$NCNotificationListSectionRevealHintView$setLegibilitySettings$(self, _cmd, settings);
}

static void _logos_method$Labels$NCNotificationListSectionRevealHintView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$Labels$NCNotificationListSectionRevealHintView$layoutSubviews(self, _cmd);
	
	id isEnabled = [preferences objectForKey:@"isEnabled"];
	NSString *customText = [preferences objectForKey:@"customTextNotif"];
	NSUInteger characterCount = [customText length];
	NSString *customColor = [preferences objectForKey:@"nongColor"];

	NSLog(@"Custom color: %@", customColor);

	
	if ([isEnabled isEqual:@1] && characterCount > 0){
		NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
		if ([[customText stringByTrimmingCharactersInSet: set] length] == 0)
		{
			customText = @"";
		}
		[self revealHintTitle].string = customText;
	}
	if ([isEnabled isEqual:@1]){
		NSLog(@"Running color code");
		




	}
}





static void _logos_method$Labels$SBUICallToActionLabel$setText$(_LOGOS_SELF_TYPE_NORMAL SBUICallToActionLabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * arg1){
	id isEnabled = [preferences objectForKey:@"isEnabled"];
	if ([isEnabled isEqual:@1]){
		arg1 = [preferences objectForKey:@"customTextUnlock"];
	}

	_logos_orig$Labels$SBUICallToActionLabel$setText$(self, _cmd, arg1);
}

static void _logos_method$Labels$SBUICallToActionLabel$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBUICallToActionLabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$Labels$SBUICallToActionLabel$layoutSubviews(self, _cmd);
	
	

	
	id isEnabled = [preferences objectForKey:@"isEnabled"];
	NSString *customText = [preferences objectForKey:@"customTextUnlock"];
	NSUInteger characterCount = [customText length];
	

	
	if ([isEnabled isEqual:@1] && characterCount > 0){
		NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
		if ([[customText stringByTrimmingCharactersInSet: set] length] == 0)
		{
			customText = @"";
		}
		




	}
}



static void _logos_method$Labels$SBTelephonyManager$_reallySetOperatorName$inSubscriptionContext$(_LOGOS_SELF_TYPE_NORMAL SBTelephonyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2){
	
	
	
	
	
	id isEnabled = [preferences objectForKey:@"isEnabled"];
	NSString *customText = [preferences objectForKey:@"customTextCarrier"];
	NSUInteger characterCount = [customText length];

	NSLog(@"%@", customText);

	if ([isEnabled isEqual:@1] && characterCount > 0){
		NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
		if ([[customText stringByTrimmingCharactersInSet: set] length] == 0)
		{
			customText = @"";
		}
		arg1 = customText;
		arg2 = [self subscriptionContext];
	}
	
	return _logos_orig$Labels$SBTelephonyManager$_reallySetOperatorName$inSubscriptionContext$(self, _cmd, arg1, arg2);
}





static __attribute__((constructor)) void _logosLocalCtor_fcba1d29(int __unused argc, char __unused **argv, char __unused **envp){
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.archergs.labelPrefs"];
	[preferences registerDefaults:@{
		@"isEnabled": @YES,
		@"customTextCarrier": @"",
		@"customTextNotif": @"",
		@"customTextUnlock": @"",
		@"nongColor": @"#FFFFFF:1.0"
	}];
	{Class _logos_class$Labels$NCNotificationListSectionRevealHintView = objc_getClass("NCNotificationListSectionRevealHintView"); MSHookMessageEx(_logos_class$Labels$NCNotificationListSectionRevealHintView, @selector(setLegibilitySettings:), (IMP)&_logos_method$Labels$NCNotificationListSectionRevealHintView$setLegibilitySettings$, (IMP*)&_logos_orig$Labels$NCNotificationListSectionRevealHintView$setLegibilitySettings$);MSHookMessageEx(_logos_class$Labels$NCNotificationListSectionRevealHintView, @selector(layoutSubviews), (IMP)&_logos_method$Labels$NCNotificationListSectionRevealHintView$layoutSubviews, (IMP*)&_logos_orig$Labels$NCNotificationListSectionRevealHintView$layoutSubviews);Class _logos_class$Labels$SBUICallToActionLabel = objc_getClass("SBUICallToActionLabel"); MSHookMessageEx(_logos_class$Labels$SBUICallToActionLabel, @selector(setText:), (IMP)&_logos_method$Labels$SBUICallToActionLabel$setText$, (IMP*)&_logos_orig$Labels$SBUICallToActionLabel$setText$);MSHookMessageEx(_logos_class$Labels$SBUICallToActionLabel, @selector(layoutSubviews), (IMP)&_logos_method$Labels$SBUICallToActionLabel$layoutSubviews, (IMP*)&_logos_orig$Labels$SBUICallToActionLabel$layoutSubviews);Class _logos_class$Labels$SBTelephonyManager = objc_getClass("SBTelephonyManager"); MSHookMessageEx(_logos_class$Labels$SBTelephonyManager, @selector(_reallySetOperatorName:inSubscriptionContext:), (IMP)&_logos_method$Labels$SBTelephonyManager$_reallySetOperatorName$inSubscriptionContext$, (IMP*)&_logos_orig$Labels$SBTelephonyManager$_reallySetOperatorName$inSubscriptionContext$);}

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadColors, (CFStringRef)@"com.archergs.labelPrefs.color", NULL, (CFNotificationSuspensionBehavior)kNilOptions);
}
