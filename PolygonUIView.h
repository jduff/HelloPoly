#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface PolygonUIView : UIView {
    IBOutlet PolygonShape *polygon;
	IBOutlet UILabel	  *polygonLabel;
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;
@end
