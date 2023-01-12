//
//  ViewController.m
//  Movies2
//
//  Created by Consultant on 1/11/23.
//

#import "ViewController.h"
#import "dataModel.h"
@interface ViewController ()
@property (strong, nonatomic) NSMutableArray<DataModel *> *users;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
   
    [self fetchCoursesUsingJSON];
    [self setupCourses];
    //[self.myTableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    
    
}
//Json
-(void)fetchCoursesUsingJSON {
    NSLog(@"Fetching Data");
   // NSString *urlString = @"https://api.themoviedb.org/3/movie/popular?api_key=cca028e85441fc7558f8ad340b62f44a&language=en-US&page=1";
    NSString *urlString = @"https://jsonplaceholder.typicode.com/users";
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Finish fetching courses...");
        
        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Data JSON: %@", json);
        
        NSError *err;
        NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if (err){
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }
        
        NSMutableArray<DataModel *> *users = NSMutableArray.new;
        
        for (NSDictionary *jsonData in dataArray){
            NSString *name = jsonData[@"name"];
            NSString *email = jsonData[@"email"];
            //NSString *title = jsonData[@"title"];
            //NSString *overview = jsonData[@"overview"];
            DataModel *user = DataModel.new;
            user.name = name;
            user.email = email;
            //user.title = title;
            //user.overview = overview;
            
           // NSLog(title);
           // NSLog(overview);
            
            NSLog(name);
            NSLog(email);
            [users addObject:user];
        }
        
        NSLog(@"%@", users);
        self.users = users;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myTableView reloadData];
        });
        
    }] resume];
}


-(void)setupCourses{
    self.users = NSMutableArray.new;
    DataModel *user = DataModel.new;
    user.name = @"Name of users";
    user.email = @"@example.com";
    [self.users addObject:user];
}

//TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    DataModel *user = self.users[indexPath.row];
    
    cell.textLabel.text = user.name;
    //cell.textLabel.font =
    cell.detailTextLabel.text = user.email;
    if (cell == nil) {
       cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
       cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end

