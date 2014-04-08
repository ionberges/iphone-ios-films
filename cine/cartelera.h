
#import <Foundation/Foundation.h>
#import "pelicula.h"

@interface cartelera : NSObject

+ (cartelera *)sharedInstance;
@property (strong,nonatomic) NSMutableArray *peliculas;


@property (strong,nonatomic) NSURL *cacheMini;
@property (strong,nonatomic) NSArray *listado;


@end
