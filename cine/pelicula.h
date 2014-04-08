#import <Foundation/Foundation.h>
#import "Carte.h"

@interface pelicula : NSObject

@property (strong,nonatomic) Carte *carteleraCine;

@property (strong,nonatomic) NSString *titulo;
@property (strong,nonatomic) NSString *idpelicula;
@property (strong,nonatomic) NSString *urlportada;

typedef void(^cargarFotoCompletion)(UIImage *);

-(void)cargarFoto:(NSString *)fotourl completion:(cargarFotoCompletion)completion;


typedef void(^cargarInfoCompletion)(NSDictionary *);

-(void)cargarInfo:(NSString *)fotourl completion:(cargarInfoCompletion)completion;

@end
