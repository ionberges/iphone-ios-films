#import <Foundation/Foundation.h>

@interface Carte : NSObject

+ (Carte *)sharedInstance;
@property (strong,nonatomic) NSMutableArray *peliculas;


@property (strong,nonatomic) NSURL *cacheMini;
@property (strong,nonatomic) NSArray *listado;

typedef void(^consulta500pxCompletion)(void);

-(void)consulta500px:(NSString *)feature completion:(consulta500pxCompletion)completion;

@end
