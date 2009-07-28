//
//  RootViewController.m
//  TableViewCellInfo
//
//  Created by Katsuyoshi Ito on 09/07/28.
//  Copyright ITO SOFT DESIGN Inc 2009. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

@synthesize cellInformation, theCell, descriptionCell;


/*
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (self.theCell) {
            CGSize size = [[self.theCell description] sizeWithFont:self.descriptionCell.textLabel.font constrainedToSize:CGSizeMake(self.descriptionCell.bounds.size.width, 1000)];
            return size.height + 44.0;
        }
    }
    return 44.0;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell;
    switch (indexPath.section) {
    case 0:
        {
            NSString *identifier = [NSString stringWithFormat:@"Cell:style=%d", style];
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[[UITableViewCell alloc] initWithStyle:style reuseIdentifier:identifier] autorelease];
                cell.textLabel.text = @"Text Label";
                cell.detailTextLabel.text = @"Detail Text";
            }
            self.theCell = cell;
            [self performSelector:@selector(reloadDescriptionCell) withObject:nil afterDelay:0.1];
        }
        break;
    case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
            if (cell == nil) {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell2"] autorelease];
                cell.textLabel.numberOfLines = 300;
                cell.textLabel.font = [UIFont fontWithName:cell.textLabel.font.fontName size:12.0f];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                self.descriptionCell = cell;
            }
            cell.textLabel.text = [self.theCell description];
        }
        break;
    }
    
	// Configure the cell.

    return cell;
}



// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (++style >= 4) {
            style = 0;
        }
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)reloadDescriptionCell
{
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationLeft];
}

- (void)dealloc {
    [descriptionCell release];
    [theCell release];
    [cellInformation release];
    [super dealloc];
}


@end

@implementation UITableViewCell(Description)

- (NSString *)description
{
    NSArray *array = [NSArray arrayWithObjects:
              [NSString stringWithFormat:@"Cell = %@", [super description]]
            , [NSString stringWithFormat:@"Cell.textLabel = %@", self.textLabel]
            , [NSString stringWithFormat:@"Cell.textLabel.font = %@", self.textLabel.font]
            , [NSString stringWithFormat:@"Cell.detailTextLabel = %@", self.detailTextLabel]
            , [NSString stringWithFormat:@"Cell.detailTextLabel.font = %@", self.detailTextLabel.font]
            , nil];
    return [array componentsJoinedByString:@"\n\n"];
}

@end

@implementation UIFont(Description)

- (NSString *)description
{
    NSArray *array = [NSArray arrayWithObjects:
              @"<"
            , [NSString stringWithFormat:@"fontName = %@;", self.fontName]
            , [NSString stringWithFormat:@"pointSize = %.2f;", self.pointSize]
            , @">"
            , nil];
    return [array componentsJoinedByString:@" "];
}

@end
