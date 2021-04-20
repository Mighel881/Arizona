#import <UIKit/UIKit.h>




@interface SBFLockScreenDateView : UIView
@end


@interface SBUIProudLockIconView : UIView
-(void)updateLockGlyphPosition;
@end


@interface NSDistributedNotificationCenter : NSNotificationCenter
+ (instancetype)defaultCenter;
- (void)postNotificationName:(NSString *)name object:(NSString *)object userInfo:(NSDictionary *)userInfo;
@end




static NSString *plistPath = @"/var/mobile/Library/Preferences/com.luki.arizonaprefs.plist";


static BOOL lockGlyphPosition;
static BOOL alternatePosition;
static BOOL poggers;
static int style;




CGFloat coordinatesForX;
CGFloat coordinatesForY;
CGFloat lockCoordinatesForX;
CGFloat lockCoordinatesForY;




static void loadWithoutAFuckingRespring() {

	NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
	NSMutableDictionary *prefs = dict ? [dict mutableCopy] : [NSMutableDictionary dictionary];
    poggers = prefs[@"poggers"] ? [prefs[@"poggers"] boolValue] : NO;
    style = prefs[@"style"] ? [prefs[@"style"] integerValue] : 2;
    alternatePosition = prefs[@"alternatePosition"] ? [prefs[@"alternatePosition"] boolValue] : NO;
    lockGlyphPosition = prefs[@"lockGlyphPosition"] ? [prefs[@"lockGlyphPosition"] boolValue] : NO;
    int xValue = prefs[@"xValue"] ? [prefs[@"xValue"] intValue] : 1;
	coordinatesForX = (float)xValue;
	int yValue = prefs[@"yValue"] ? [prefs[@"yValue"] intValue] : 1;
	coordinatesForY = (float)yValue;
    int lockXValue = prefs[@"lockXValue"] ? [prefs[@"lockXValue"] intValue] : 1;
	lockCoordinatesForX = (float)lockXValue;
	int lockYValue = prefs[@"lockYValue"] ? [prefs[@"lockYValue"] intValue] : 1;
	lockCoordinatesForY = (float)lockYValue;

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


    //if(![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/PreferenceLoader/Preferences/cclockp.plist"]) {


        if(alternatePosition) {


            CGRect newFrame = CGRectMake(coordinatesForX, coordinatesForY, frame.size.width, frame.size.height);


            %orig(newFrame);
        

        } else


        %orig;
        loadWithoutAFuckingRespring();


    //}


}


%end




%hook SBUIProudLockIconView

%new

-(void)updateLockGlyphPosition { // move the FaceID lock glyph


    loadWithoutAFuckingRespring();
    
    if(poggers && lockGlyphPosition) {


        self.frame = CGRectMake(lockCoordinatesForX, lockCoordinatesForY, self.frame.size.width, self.frame.size.height);


    }

}


-(void)didMoveToWindow {

    %orig;
    [self updateLockGlyphPosition];


	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLockGlyphPosition) name:@"glyphUpdated" object:nil];

}

-(void)didMoveToSuperview {


    %orig;
    [self updateLockGlyphPosition];


}

%end




%ctor {


    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
	NSMutableDictionary *prefs = dict ? [dict mutableCopy] : [NSMutableDictionary dictionary];
    poggers = prefs[@"poggers"] ? [prefs[@"poggers"] boolValue] : NO;
    style = prefs[@"style"] ? [prefs[@"style"] integerValue] : 2;
    alternatePosition = prefs[@"alternatePosition"] ? [prefs[@"alternatePosition"] boolValue] : NO;
    lockGlyphPosition = prefs[@"lockGlyphPosition"] ? [prefs[@"lockGlyphPosition"] boolValue] : NO;
    int xValue = prefs[@"xValue"] ? [prefs[@"xValue"] intValue] : 1;
	coordinatesForX = (float)xValue;
	int yValue = prefs[@"yValue"] ? [prefs[@"yValue"] intValue] : 1;
	coordinatesForY = (float)yValue;
    int lockXValue = prefs[@"lockXValue"] ? [prefs[@"lockXValue"] intValue] : 1;
	lockCoordinatesForX = (float)lockXValue;
	int lockYValue = prefs[@"lockYValue"] ? [prefs[@"lockYValue"] intValue] : 1;
	lockCoordinatesForY = (float)lockYValue;


}