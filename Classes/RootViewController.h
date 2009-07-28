//
//  RootViewController.h
//  TableViewCellInfo
//
//  Created by Katsuyoshi Ito on 09/07/28.
//  Copyright ITO SOFT DESIGN Inc 2009. All rights reserved.
//

@interface RootViewController : UITableViewController {
    UITableViewCellStyle style;
    NSString *cellInformation;
    
    UITableViewCell *theCell;
    UITableViewCell *descriptionCell;
}

@property (retain) NSString *cellInformation;
@property (retain) UITableViewCell *theCell;
@property (retain) UITableViewCell *descriptionCell;

- (void)reloadDescriptionCell;


@end

