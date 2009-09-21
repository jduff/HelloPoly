#import "PolygonUIView.h"

@implementation PolygonUIView

-(void) drawRect:(CGRect)rect{
	CGContextRef context = UIGraphicsGetCurrentContext(); 
	CGContextBeginPath (context); 
	
	NSArray * points = [PolygonUIView pointsForPolygonInRect:[self bounds] numberOfSides:polygon.numberOfSides];
	NSLog(@"%d", [points count]);
	NSLog(@"%d", polygon.numberOfSides);
	for(NSValue * point in points) {
		CGPoint val = [point CGPointValue];
		if([points indexOfObject:point]==0)
			CGContextMoveToPoint (context, val.x, val.y);
		else
			CGContextAddLineToPoint (context, val.x, val.y); 
	}
	
	CGContextClosePath (context); 
	[[UIColor redColor] setFill]; 
	[[UIColor blackColor] setStroke]; 
	CGContextDrawPath (context, kCGPathFillStroke);
	polygonLabel.text = polygon.name;
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides { 
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
	float radius = 0.9 * center.x; 
	NSMutableArray *result = [NSMutableArray array]; 
	float angle = (2.0 * M_PI) / numberOfSides; 
	float exteriorAngle = M_PI - angle; 
	float rotationDelta = angle - (0.5 * exteriorAngle); 
	
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
		float newAngle = (angle * currentAngle) - rotationDelta; 
		float curX = cos(newAngle) * radius; 
		float curY = sin(newAngle) * radius; 
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, 
																center.y + curY)]]; 
	} 
	
	return result;
} 

@end
