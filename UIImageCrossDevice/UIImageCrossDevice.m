//
//  UIImageCrossDevice.m
//  iOS-utilities
//
//  Created by Christof Dorner on 1/5/11.
//  Copyright 2011 Christof Dorner. All rights reserved.
//

#import "UIImageCrossDevice.h"


@implementation UIImageCrossDevice

+(id)imageWithContentsOfFile:(NSString *)path {
	return [[[UIImageCrossDevice alloc] initWithContentsOfFile:path] autorelease];
}

- (id)initWithContentsOfFile:(NSString *)path {
	if ([UIScreen instancesRespondToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2.0) {
		NSString *path2x = [[path stringByDeletingLastPathComponent] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@@2x.%@", [[path lastPathComponent] stringByDeletingPathExtension], [path pathExtension]]];
		if ([[NSFileManager defaultManager] fileExistsAtPath:path2x]) {
			return [self initWithCGImage:[[UIImage imageWithData:[NSData dataWithContentsOfFile:path2x]] CGImage] scale:2.0 orientation:UIImageOrientationUp];
		}
	}
	
	return [super initWithContentsOfFile:path];
}

@end
