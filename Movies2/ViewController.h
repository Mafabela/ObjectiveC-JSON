//
//  ViewController.h
//  Movies2
//
//  Created by Consultant on 1/11/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView * myTableView;


@end

