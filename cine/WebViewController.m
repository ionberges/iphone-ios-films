
#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.web.scalesPageToFit = YES;
    [self cargarURL];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)cargarURL {
    [self.web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlpagina ]]];
}

@end
