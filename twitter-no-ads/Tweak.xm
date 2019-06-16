//#import <objc/runtime.h>

@interface TFNTwitterStatus : NSObject
@property (readonly,nonatomic) bool isPromoted;
@end

@interface TFNDataViewItem : NSObject 
@property (retain,nonatomic) id item;
@end

@interface TFNDataViewController

- (TFNDataViewItem*)itemsInternalDataViewItemAtValidIndexPath:(id)v1;

@end

@interface TFNItemsDataViewController : TFNDataViewController
@end

@interface TFNItemsDataViewSectionController : NSObject

@property (readonly,nonatomic) TFNItemsDataViewController * dataViewController;

@end


%hook TFNItemsDataViewController

- (id)tableViewCellForItem:(id)v1 atIndexPath:(id)v2 {
	UITableViewCell* tvCell = %orig;
	id item = [[self itemsInternalDataViewItemAtValidIndexPath: v2] item];
	if([item respondsToSelector: @selector(isPromoted)] && [item performSelector:@selector(isPromoted)]){
		//%log;
		//NSLog(@"tableViewCellForItem: %@", item);
		[tvCell setHidden: YES];
	}
	return tvCell;	
}
%end


%hook TFNItemsDataViewSectionController
- (double)tableViewHeightForItem:(id)v1 atIndexPath:(id)v2 { 
	id item = [[[self dataViewController] itemsInternalDataViewItemAtValidIndexPath: v2] item];
	if([item respondsToSelector: @selector(isPromoted)] && [item performSelector:@selector(isPromoted)]){
		//%log;
		//NSLog(@"tableViewHeightForItem: %@", item);
		return 0;
	}
	return %orig;
}
%end