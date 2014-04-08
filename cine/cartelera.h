//
//  cartelera.h
//  cine
//
//  Created by iMac 6 on 20/02/13.
//  Copyright (c) 2013 iMac 6. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pelicula.h"

@interface cartelera : NSObject

+ (cartelera *)sharedInstance;
@property (strong,nonatomic) NSMutableArray *peliculas;

//@property (strong,nonatomic) NSURL *cache;
@property (strong,nonatomic) NSURL *cacheMini;
@property (strong,nonatomic) NSArray *listado;

//typedef void(^consulta500pxCompletion)(void);
//-(void)consulta500px:(NSString *)feature completion:(consulta500pxCompletion)completion;

@end
