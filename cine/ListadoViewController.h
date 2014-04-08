#import <UIKit/UIKit.h>
#import "Carte.h"
#import "pelicula.h"
#import "DetalleViewController.h"



@interface ListadoViewController : UITableViewController


@property (strong,nonatomic) Carte *carteleraCine;
@property (strong,nonatomic) pelicula *peliculaCine;

@end
