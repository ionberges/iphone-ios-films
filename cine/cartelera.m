//
//  cartelera.m
//  cine
//
//  Created by iMac 6 on 20/02/13.
//  Copyright (c) 2013 iMac 6. All rights reserved.
//

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
                     
                       /*
                       NSString *url= [NSString stringWithFormat:@"https://api.500px.com/v1/photos?feature=%@&sort=created_at&image_size=3&include_store=store_download&include_states=voted&consumer_key=IeLCqqcX9NhYZBGZxw1rBb7KBjHjE93BPRHuaE5t",feature];*/
                    //   NSURL *nsurl=[NSURL URLWithString:@"http://pixybit.es/api/cartelera.json"];
                       NSURL *nsurl=[NSURL URLWithString:feature];
                       NSData *datos=[NSData dataWithContentsOfURL:nsurl];
                       
                       NSError *error=nil;
                       NSDictionary *resultado=[NSJSONSerialization JSONObjectWithData:datos options:NSJSONReadingMutableContainers error:&error];
                       
                       for (NSArray *c in [resultado valueForKey:@"peliculas"]) {
                         //  NSString *nuevo=[c valueForKey:@"image_url"];
                           pelicula *nuevapeli=[[pelicula alloc]init];
                           nuevapeli.titulo=[c valueForKey:@"titulo"];
                           nuevapeli.idpelicula=[c valueForKey:@"imdb_id"];
                           nuevapeli.urlportada=[c valueForKey:@"imdb_url"];
                           
                           
                       
                           // NSLog(@"ffffffff %@",nuevo);
                           [_peliculas addObject:nuevapeli];
                           
                           
                       }
                       
                       if(error) NSLog(@"error: %@", error);
                       //  NSLog(@"resultado: %@", resultado);
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^{
                                          //  self.fotos= [resultado valueForKey:@"photos"];
                                          //   NSLog(@"ddddddddd %@",self.fotos);
                                          completion();
                                      }
                                      );
                   }
                   );
}


@end
