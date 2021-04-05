#import <UIKit/UIKit.h>




@interface SBFLockScreenDateView : UIView
@end


@interface NSDistributedNotificationCenter : NSNotificationCenter
+ (instancetype)defaultCenter;
- (void)postNotificationName:(NSString *)name object:(NSString *)object userInfo:(NSDictionary *)userInfo;
@end




static NSString *plistPath = @"/var/mobile/Library/Preferences/com.luki.arizonaprefs.plist";


static BOOL poggers;
static int style;




static void loadWithoutAFuckingRespring() {

	NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
	NSMutableDictionary *prefs = dict ? [dict mutableCopy] : [NSMutableDictionary dictionary];
    poggers = prefs[@"poggers"] ? [prefs[@"poggers"] boolValue] : NO;
    style = prefs[@"style"] ? [prefs[@"style"] integerValue] : 2;

}




%hook SBFLockScreenDateView


-(void)setAlignmentPercent:(double)arg1 {


    %orig;

    if (poggers && style == 2) {
        %orig(1);
        loadWithoutAFuckingRespring();

    }

    else if(poggers && style == 1) {

        %orig(0);
        loadWithoutAFuckingRespring();

    }

    else if(poggers && style == 0) {

        %orig(-1);
        loadWithoutAFuckingRespring();

    }


    loadWithoutAFuckingRespring();

}


%end




%ctor {

    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
	NSMutableDictionary *prefs = dict ? [dict mutableCopy] : [NSMutableDictionary dictionary];
    poggers = prefs[@"poggers"] ? [prefs[@"poggers"] boolValue] : NO;
    style = prefs[@"style"] ? [prefs[@"style"] integerValue] : 2;

}