
#import "cartelera.h"

@implementation cartelera

+ (cartelera *)sharedInstance
{
    static cartelera *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[cartelera alloc] init];
    });
    return sharedInstance;
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
