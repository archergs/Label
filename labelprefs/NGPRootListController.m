#include "NGPRootListController.h"

@implementation NGPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

// credit to Nepeta (@NepetaDev) for the respring code.  
-(void)respring{
	// Creates an NSTask that restarts backboardd
	NSLog(@"respringing...");
	NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/usr/bin/killall"];
    [task setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
    [task launch];
}

-(void)save{
	// dismisses keyboard and sets value for text field (it doesnt actually do the latter, but allows it to happen.)
	[self.view endEditing: YES];
}

@end
