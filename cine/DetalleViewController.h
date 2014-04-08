#import "ViewController.h"
#import "pelicula.h"

@interface DetalleViewController : ViewController


@property (strong,nonatomic) pelicula *pelicula;
@property (weak, nonatomic) IBOutlet UILabel *argumento;
@property (weak, nonatomic) IBOutlet UILabel *genero;
@property (weak, nonatomic) IBOutlet UILabel *directores;
@property (weak, nonatomic) IBOutlet UILabel *actores;
@property (weak, nonatomic) IBOutlet UIImageView *foto;


@end
