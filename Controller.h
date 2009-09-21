#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonUIView.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	IBOutlet PolygonShape *polygon;
	IBOutlet PolygonUIView *polygonView;
}
- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
- (void)updateInterface;
- (int) defaultSides;
@end
