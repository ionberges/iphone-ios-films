#import "pelicula.h"

@implementation pelicula



-(void)cargarFoto:(NSString *)fotourl completion:(cargarFotoCompletion)completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^{
                    UIImage *image;
                      _carteleraCine=[Carte sharedInstance];
                       
                       
                       
                       NSFileManager *fileManager = [NSFileManager defaultManager];
                       
                       NSString *cacheMiniPath = [self.carteleraCine.cacheMini path];
                       
                         NSString *fotoPathComponent = [NSString stringWithFormat:@"%@.jpg", fotourl];
                       
                       NSString *fot = [cacheMiniPath stringByAppendingPathComponent:fotoPathComponent];
                       
                       
                       if ([fileManager fileExistsAtPath:fot]){
                      
                           image = [UIImage imageWithContentsOfFile:fot];
                       }
                       
                       else{
                        
                           NSString *url= [NSString stringWithFormat:@"http://www.omdbapi.com/?i=%@",fotourl];
                           NSURL *nsurl=[NSURL URLWithString:url];
                           
                           
                           NSData *datos=[NSData dataWithContentsOfURL:nsurl];
                           
                           NSError *error=nil;
                           NSDictionary *resultado=[NSJSONSerialization JSONObjectWithData:datos options:NSJSONReadingMutableContainers error:&error];
                           
                           NSString *urlfoto=[resultado valueForKey:@"Poster"];
                          
                           NSData *fotodata = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlfoto]];
                           
                           
                           image = [UIImage imageWithData:fotodata];
                           
                           NSString *cacheMiniPath = [self.carteleraCine.cacheMini path];
                           
                           NSString *fotoPath = [cacheMiniPath stringByAppendingPathComponent:fotoPathComponent];
                           
                                                    
                         
                           
                           [fotodata writeToURL:[NSURL fileURLWithPath:fotoPath] atomically:YES];

                           
                           
                       }

                    
                     
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^{
                                          
                                          completion(image);
                                      }
                                      );
                   }
                   );
    
    
}

-(void)cargarInfo:(NSString *)fotourl completion:(cargarInfoCompletion)completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^{
                                                                                      
                       NSDictionary *dic=[[NSDictionary alloc]init];
                       
                       NSString *url= [NSString stringWithFormat:@"http://www.omdbapi.com/?i=%@",fotourl];
                       NSURL *nsurl=[NSURL URLWithString:url];
                       
                       
                       NSData *datos=[NSData dataWithContentsOfURL:nsurl];
                       
                       NSError *error=nil;
                       NSDictionary *resultado=[NSJSONSerialization JSONObjectWithData:datos options:NSJSONReadingMutableContainers error:&error];
                   
                       
                       NSString * genero = [resultado valueForKey:@"Genre"];
                       NSString *argumento=[resultado valueForKey:@"Plot"];
                      
                       NSString *actores=[resultado valueForKey:@"Actors"];
                       NSString *directores=[resultado valueForKey:@"Director"];
                         
                  
                       if(genero ==nil){
                           genero=@"";
                       }
                       if(argumento ==nil){
                           argumento=@"";
                       }
                       if(actores ==nil){
                           actores=@"";
                       }
                       if(directores ==nil){
                           directores=@"";
                       }
                       dic = @{
                       @"genero" : genero,
                       @"argumento" : argumento,
                       @"actores" :actores,
                       @"directores" : directores
                       };
                      
                       dispatch_async(dispatch_get_main_queue(),
                                      ^{
                                        
                                          completion(dic);
                                      }
                                      );
                   }
                   );
    
}

@end
