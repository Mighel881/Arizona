#import <UIKit/UIKit.h>




@interface SBFLockScreenDateView : UIView
@end




@interface NSDistributedNotificationCenter : NSNotificationCenter
+ (instancetype)defaultCenter;
- (void)postNotificationName:(NSString *)name object:(NSString *)object userInfo:(NSDictionary *)userInfo;
@end




static NSString *plistPath = @"/var/mobile/Library/Preferences/com.luki.arizonaprefs.plist";


static BOOL alternatePosition;
static BOOL poggers;
static int style;




CGFloat coordinatesForX;
CGFloat coordinatesForY;




static void loadWithoutAFuckingRespring() {

	NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
	NSMutableDictionary *prefs = dict ? [dict mutableCopy] : [NSMutableDictionary dictionary];
    poggers = prefs[@"poggers"] ? [prefs[@"poggers"] boolValue] : NO;
    style = prefs[@"style"] ? [prefs[@"style"] integerValue] : 2;
    alternatePosition = prefs[@"alternatePosition"] ? [prefs[@"alternatePosition"] boolValue] : NO;
    int xValue = prefs[@"xValue"] ? [prefs[@"xValue"] intValue] : 1;
	coordinatesForX = (float)xValue;
	int yValue = prefs[@"yValue"] ? [prefs[@"yValue"] intValue] : 1;
	coordinatesForY = (float)yValue;

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




%hook SBFLockScreenDateView


-(void)setFrame:(CGRect)frame {


    if(alternatePosition) {


        CGRect newFrame = CGRectMake(coordinatesForX, coordinatesForY, frame.size.width, frame.size.height);


        %orig(newFrame);
        

    } else


        %orig;
        loadWithoutAFuckingRespring();


}


%end




%ctor {

    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
	NSMutableDictionary *prefs = dict ? [dict mutableCopy] : [NSMutableDictionary dictionary];
    poggers = prefs[@"poggers"] ? [prefs[@"poggers"] boolValue] : NO;
    style = prefs[@"style"] ? [prefs[@"style"] integerValue] : 2;
    alternatePosition = prefs[@"alternatePosition"] ? [prefs[@"alternatePosition"] boolValue] : NO;
    int xValue = prefs[@"xValue"] ? [prefs[@"xValue"] intValue] : 1;
	coordinatesForX = (float)xValue;
	int yValue = prefs[@"yValue"] ? [prefs[@"yValue"] intValue] : 1;
	coordinatesForY = (float)yValue;

}