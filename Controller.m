#import "Controller.h"

@implementation Controller
- (IBAction)decrease:(id)sender {
    NSLog(@"Decrease!");
	polygon.numberOfSides-=1;
	[self updateInterface];
}

- (IBAction)increase:(id)sender {
    NSLog(@"Increase!");
	polygon.numberOfSides+=1;
	[self updateInterface];
}

- (void)updateInterface{
	// save preference
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	[prefs setInteger:polygon.numberOfSides forKey:@"defaultNumberOfSides"];
	
	// updating the interface
	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", polygon.numberOfSides];
	increaseButton.enabled = polygon.numberOfSides < polygon.maximumNumberOfSides;
	decreaseButton.enabled = polygon.numberOfSides > polygon.minimumNumberOfSides;
	[polygonView setNeedsDisplay]; 
	NSLog(@"%@", polygon);
}

- (void) awakeFromNib {
	polygon.minimumNumberOfSides=3;
	polygon.maximumNumberOfSides=12;
	polygon.numberOfSides = [self defaultSides];
	[self updateInterface];
	NSLog(@"My polygon: %@", polygon);
}

- (int) defaultSides {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	int sides= [prefs integerForKey:@"defaultNumberOfSides"];
	return sides==0 ? 5 : sides;
}
@end
