//
//  TextViewController.h
//  TinNhanYeuThuong
//
//  Created by Kien Nguyen on 1/29/14.
//  Copyright (c) 2014 kakaolabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewController : UIViewController {
    NSString *text;
    IBOutlet UITextView *textView;
}

- (id) initWIthText:(NSString *) _text;
@end