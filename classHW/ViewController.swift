//
//  ViewController.swift
//  classHW
//
//  Created by Steven Wang on 2016/5/2.
//  Copyright © 2016年 ka666wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var myLabel: UILabel!
    
    func sayGoodBye(noti:NSNotification) {
        
        print ("say GoodBye from /(noti)")
        
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        print("old text:\(textView.text)")
        print("range location:\(range.location)")
        print("range length:\(range.length)")
        print("new text:\(text)")
        
        //print("\(textView.text.characters.count + 1)")
        
        
        let finalString = (textView.text as NSString).stringByReplacingCharactersInRange(range, withString: text)
        let count = finalString.characters.count
        if count > 10 {
            return false
        }
        else {
            self.myLabel.text = "\(count)"
            return true
            
        }
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.sayGoodBye(_:)), name: UIApplicationWillResignActiveNotification, object: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

