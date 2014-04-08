#import "Carte.h"
#import "pelicula.h"

@implementation Carte



+ (Carte *)sharedInstance
{
    static Carte *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Carte alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self crearDirectorio];
      
        
    }
    return self;
}
-(void)crearDirectorio
{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    NSURL *cache = [NSURL fileURLWithPath:cachePath];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    _cacheMini = [cache URLByAppendingPathComponent:@"mini" isDirectory:YES];
    if(![fileManager fileExistsAtPath:[_cacheMini path]]) {
        NSError *error;
        [fileManager createDirectoryAtURL:_cacheMini withIntermediateDirectories:YES attributes:nil error:&error];
        if(error) NSLog(@"%@", error);
    }
}


-(void)consulta500px:(NSString *)feature completion:(consulta500pxCompletion)completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^{
                       
       
                       
                       self.peliculas=[[NSMutableArray alloc]init];
                       
                     
                       NSURL *nsurl=[NSURL URLWithString:feature];
                       NSData *datos=[NSData dataWithContentsOfURL:nsurl];
                       
                       NSError *error=nil;
                       NSDictionary *resultado=[NSJSONSerialization JSONObjectWithData:datos options:NSJSONReadingMutableContainers error:&error];
                       
                       for (NSArray *c in [resultado valueForKey:@"peliculas"]) {
                       
                           pelicula *nuevapeli=[[pelicula alloc]init];
                           nuevapeli.titulo=[c valueForKey:@"titulo"];
                           nuevapeli.idpelicula=[c valueForKey:@"imdb_id"];
                           nuevapeli.urlportada=[c valueForKey:@"imdb_url"];
                           
                           
                           
                          
                           [_peliculas addObject:nuevapeli];
                           
                           
                       }
                       
                       if(error) NSLog(@"error: %@", error);
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^{
                                         
                                          completion();
                                      }
                                      );
                   }
                   );
}


@end
