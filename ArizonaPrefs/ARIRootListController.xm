#include "ARIRootListController.h"




static int style;
static BOOL poggers;
static NSString *plistPath = @"/var/mobile/Library/Preferences/com.luki.arizonaprefs.plist";




@implementation ARIRootListController

-(void)loadWithoutAFuckingRespring {

	NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
	NSMutableDictionary *prefs = dict ? [dict mutableCopy] : [NSMutableDictionary dictionary];
    poggers = prefs[@"poggers"] ? [prefs[@"poggers"] boolValue] : NO;
	style = prefs[@"style"] ? [prefs[@"style"] integerValue] : 2;

}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}


-(id)readPreferenceValue:(PSSpecifier*)specifier {
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:plistPath]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}


-(void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:plistPath]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:plistPath atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	if (notificationName) {
		[self loadWithoutAFuckingRespring];
	}
}


-(void)discord {


	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://discord.gg/3ktkSq5ACK"] options:@{} completionHandler:nil];


}


-(void)meredith {


	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://parcility.co/package/com.twickd.luki120.meredith"] options:@{} completionHandler:nil];


}


-(void)perfectSpotify {


	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://parcility.co/package/com.twickd.luki120.perfectspotify/twickd"] options:@{} completionHandler:nil];


}


@end