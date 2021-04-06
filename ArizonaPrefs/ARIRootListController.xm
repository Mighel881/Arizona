#include "ARIRootListController.h"




static BOOL alternatePosition;
static BOOL poggers;
static int style;


CGFloat coordinatesForX;
CGFloat coordinatesForY;




static NSString *plistPath = @"/var/mobile/Library/Preferences/com.luki.arizonaprefs.plist";


#define tint [UIColor colorWithRed: 0.02 green: 0.79 blue: 0.95 alpha: 1.00]


@implementation ARIRootListController


-(void)loadWithoutAFuckingRespring {

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

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}


-(void)viewDidLoad {

	[super viewDidLoad];

	UIImage *banner = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/ArizonaPrefs.bundle/pogbanner.png"];
	
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,UIScreen.mainScreen.bounds.size.width,UIScreen.mainScreen.bounds.size.width * banner.size.height / banner.size.width)];
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headerImageView.image = banner;
    self.headerImageView.translatesAutoresizingMaskIntoConstraints = NO;
    //self.headerImageView.clipsToBounds = YES;

    [self.headerView addSubview:self.headerImageView];
    [NSLayoutConstraint activateConstraints:@[
        [self.headerImageView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
        [self.headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
        [self.headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],   
        [self.headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
    ]];

}


-(void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    CGRect frame = self.table.bounds;
    frame.origin.y = -frame.size.height;

    self.navigationController.navigationController.navigationBar.barTintColor = [UIColor clearColor];
    [self.navigationController.navigationController.navigationBar setShadowImage: [UIImage new]];
    self.navigationController.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

 
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.tableHeaderView = self.headerView;
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY > 200) {
        [UIView animateWithDuration:0.2 animations:^{
            self.iconView.alpha = 1.0;
            self.titleLabel.alpha = 0.0;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.iconView.alpha = 0.0;
            self.titleLabel.alpha = 1.0;
        }];
    }

    if (offsetY > 0) offsetY = 0;
    self.headerImageView.frame = CGRectMake(0, offsetY, self.headerView.frame.size.width, 200 - offsetY);
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.navigationController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];

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




@implementation ArizonaTableCell


- (void)tintColorDidChange {

	[super tintColorDidChange];

	self.textLabel.textColor = tint;
	self.textLabel.highlightedTextColor = tint;
}


- (void)refreshCellContentsWithSpecifier:(PSSpecifier *)specifier {

	[super refreshCellContentsWithSpecifier:specifier];

	if ([self respondsToSelector:@selector(tintColor)]) {
		self.textLabel.textColor = tint;
		self.textLabel.highlightedTextColor = tint;
	}
}


@end