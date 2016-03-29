//
//  UMListViewController.m
//  MojoTest
//
//  Created by Андрей on 09.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UMListViewController.h"
#import "UMAnimal.h"
#import "UMAnimalCell.h"
#import "UMDetailAnimalViewController.h"

static NSString* const UMAnimalCellIdentifier = @"UMAnimalCell";

@interface UMListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *arrayAnimals;
@property (nonatomic, strong) UIRefreshControl* refreshControl;

@end

@implementation UMListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];
    [self setupPullToRefresh];
    
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.navigationItem.title = @"Animals";
    
}

- (void)configureView
{
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 70.f;
    
}

- (void)setupPullToRefresh
{
    self.refreshControl = [UIRefreshControl new];
    [self.refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    [self.tableView setTableFooterView:self.refreshControl];
    self.tableView.alwaysBounceVertical = YES;
}

- (void)loadData
{
    [self.eventHandler updateAnimals];
}


- (void)showNoContentMessage:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
    
    
    [self.refreshControl endRefreshing];
}

- (void)reloadEntries:(NSArray*)entries
{
    [self.refreshControl endRefreshing];
    self.arrayAnimals = entries;
    [self.tableView reloadData];
}


#pragma mark - UITableViewDelegate and DataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayAnimals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UMAnimal *animal = [self.arrayAnimals objectAtIndex:indexPath.row];
    UMAnimalCell *cell = [tableView dequeueReusableCellWithIdentifier:UMAnimalCellIdentifier forIndexPath:indexPath];
    cell.lblHeader.text = animal.title;
    cell.lblDescription.text = animal.desc;
    
    cell.imgView.image = nil;
    [cell.imgView setBackgroundColor:[UIColor grayColor]];
    
    
    NSURL *url = [NSURL URLWithString:[animal.imageURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    if (!url){
        return cell;
    }
    
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *images = [UIImage imageWithData:data];
            if (images) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UMAnimalCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                    if (updateCell){
                        [updateCell.imgView setBackgroundColor:[UIColor clearColor]];
                        updateCell.imgView.image = images;
                    }
                    
                });
            }
        }
    }];
    [task resume];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UMAnimal *animal = [self.arrayAnimals objectAtIndex:indexPath.row];
    
    if (animal.url){
        NSString *string = [animal.url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:string];
        [self.eventHandler openAnimalURL:url];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
