#import "DetalleViewController.h"
#import "WebViewController.h"
#import <Social/Social.h>

@interface DetalleViewController ()

@end

@implementation DetalleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self cargarDatos];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
    // Dispose of any resources that can be recreated.
}

- (void)cargarDatos
{
    NSString *id=_pelicula.idpelicula;
    [self.pelicula cargarInfo:id completion:^(NSDictionary *dic){
    
      
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
       
        
        NSString *fotoPathComponent = [NSString stringWithFormat:@"/Users/macbook/Library/Application Support/iPhone Simulator/7.0.3/Applications/B545D4B9-D758-4920-80F8-7B7D7E2D961F/Library/Caches/mini/%@.jpg", _pelicula.idpelicula];
        
        
        
        if ([fileManager fileExistsAtPath:fotoPathComponent]){
         
            self.foto.image = [UIImage imageWithContentsOfFile:fotoPathComponent];
        }
        _argumento.text= [dic valueForKey:@"argumento"];
        _genero.text= [dic valueForKey:@"genero"];
        _directores.text= [dic valueForKey:@"directores"];
        _actores.text= [dic valueForKey:@"actores"];
   
        
        
    }];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	
    if([segue.identifier isEqualToString:@"web"]) {
		WebViewController *web = segue.destinationViewController;
		web.urlpagina=_pelicula.urlportada;
        
        
	}
}
- (IBAction)compartirTwitter:(UIBarButtonItem *)sender {
    SLComposeViewController *twitterPostVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitterPostVC setInitialText:_pelicula.titulo];
     NSString *fotoPathComponent = [NSString stringWithFormat:@"/Users/macbook/Library/Application Support/iPhone Simulator/7.0.3/Applications/B545D4B9-D758-4920-80F8-7B7D7E2D961F/Library/Caches/mini/%@.jpg", _pelicula.idpelicula];
    [twitterPostVC addImage:[UIImage imageWithContentsOfFile:fotoPathComponent]];
    [self presentViewController:twitterPostVC animated:YES completion:^{}];
}

@end
