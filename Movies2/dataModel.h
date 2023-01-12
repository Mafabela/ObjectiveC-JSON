//
//  dataModel.h
//  Second_Objective-C
//
//  Created by Consultant on 1/10/23.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//@interface dataModel : UIViewController

//@end

@interface DataModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
//Movies
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *overview;

@end

NS_ASSUME_NONNULL_END
