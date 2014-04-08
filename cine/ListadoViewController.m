#import "ListadoViewController.h"

@interface ListadoViewController ()

@property (nonatomic) NSInteger contador;


@end

@implementation ListadoViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    self.carteleraCine= [Carte sharedInstance];
    
    
    NSString *tipo=@"http://pixybit.es/api/cartelera.json";
    
    [self.carteleraCine consulta500px:tipo completion:^{
       
        [self.tableView reloadData];
       
    }];


   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.carteleraCine.peliculas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Celda";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {

    }
   while(cell.tag!=0) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    }
    _peliculaCine=[[pelicula alloc]init];
    
    _peliculaCine=[self.carteleraCine.peliculas objectAtIndex:indexPath.row];
    cell.tag=indexPath.row;
    cell.textLabel.text=_peliculaCine.titulo;
    cell.detailTextLabel.text=_peliculaCine.idpelicula;
       cell.imageView.image=[UIImage imageNamed:@"blanco.jpg"];
    NSString *idfoto=_peliculaCine.idpelicula;
      _contador++;
    if(idfoto !=nil){
    [self.peliculaCine cargarFoto:idfoto completion:^(UIImage *image){
    
    	cell.imageView.image=image;
       
              
    }];
    }
    
    
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	
    if([segue.identifier isEqualToString:@"detalle"]) {
		UITableViewCell *celda = sender;
		
           NSIndexPath *indexPath = [self.tableView indexPathForCell:celda];
		DetalleViewController *detalle = segue.destinationViewController;
		detalle.pelicula=[self.carteleraCine.peliculas objectAtIndex:indexPath.row];

        
	}
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
