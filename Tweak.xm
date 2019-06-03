#import "Tweak.h"

void reloadColors() {
    fetchColor = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.archergs.labelPrefs.plist"];
	nongColor = fetchColor[@"nongColor"];
	unlockColor = fetchColor[@"unlockColor"];
	[preferences setObject:nongColor forKey:@"nongColor"];
	[preferences setObject:unlockColor forKey:@"unlockColor"];
	NSLog(@"nongColor: %@", nongColor);
}

%group Labels

/*%hook NCNotificationCombinedListViewController
-(void)viewWillAppear:(BOOL)arg1{
	orig;
}
%end */

%hook NCNotificationListSectionRevealHintView

-(void)setLegibilitySettings:(_UILegibilitySettings *)settings{
	NSString *customColor = [preferences objectForKey:@"nongColor"];
	[settings setPrimaryColor:LCPParseColorString(customColor, @"#FFFFFF")];
	%orig(settings);
}

-(void)layoutSubviews {
    %orig;
	// get the values from the prefs
	id isEnabled = [preferences objectForKey:@"isEnabled"];
	NSString *customText = [preferences objectForKey:@"customTextNotif"];
	NSUInteger characterCount = [customText length];
	NSString *customColor = [preferences objectForKey:@"nongColor"];

	NSLog(@"Custom color: %@", customColor);

	// if the enabled switch is on, set the custom text!
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
		/*[self revealHintTitle].legibilitySettings.primaryColor = LCPParseColorString(customColor, @"#FFFFFF");
		[[self revealHintTitle] setTextColor:LCPParseColorString(customColor, @"#FFFFFF")];

		[[self revealHintTitle] _updateLabelForLegibilitySettings];
		[[self revealHintTitle] _updateLegibilityView];*/
	}
}

%end

%hook SBUICallToActionLabel


-(void)layoutSubviews{
	%orig;

	// get the values from the prefs
	id isEnabled = [preferences objectForKey:@"isEnabled"];
	NSString *customText = [preferences objectForKey:@"customTextUnlock"];
	NSUInteger characterCount = [customText length];
	//NSString *customColor = [preferences objectForKey:@"unlockColor"];

	// if the enabled switch is on, set the custom text!
	if ([isEnabled isEqual:@1] && characterCount > 0){
		NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
		if ([[customText stringByTrimmingCharactersInSet: set] length] == 0)
		{
			customText = @"";
		}
		[self label].string = customText;
		/*[self label].legibilitySettings.primaryColor = LCPParseColorString(customColor, @"#FFFFFF");

		[[self label] _updateLabelForLegibilitySettings];
		[[self label] _updateLegibilityView];*/
	}
}
%end

%hook SBTelephonyManager
-(void)_reallySetOperatorName:(id)arg1 inSubscriptionContext:(id)arg2{
	
	// get the values from the prefs
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
	
	return %orig(arg1, arg2);
}
%end

// end group
%end

%ctor{
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.archergs.labelPrefs"];
	[preferences registerDefaults:@{
		@"isEnabled": @YES,
		@"customTextCarrier": @"",
		@"customTextNotif": @"",
		@"customTextUnlock": @"",
		@"nongColor": @"#FFFFFF:1.0"
	}];
	%init(Labels);

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadColors, (CFStringRef)@"com.archergs.labelPrefs.color", NULL, (CFNotificationSuspensionBehavior)kNilOptions);
}