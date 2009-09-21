//
//  PolygonShape.h
//  Assignment2
//
//  Created by John Duff on 16/09/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolygonShape : NSObject {
	int numberOfSides;
	int minimumNumberOfSides;
	int maximumNumberOfSides;
}

@property (assign) int numberOfSides;
@property (assign) int minimumNumberOfSides;
@property (assign) int maximumNumberOfSides;

@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;
@property (readonly) NSString* name;

- (id)init;
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;
- (NSString *)description;
@end
