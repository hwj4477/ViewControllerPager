//
//  ViewController.swift
//  ViewControllerPager
//
//  Created by wjhong on 2017. 5. 8..
//  Copyright © 2017년 wjhong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewControllerPagerDelegate, ViewControllerPagerDataSource {
    
    @IBOutlet weak var viewControllerPager: ViewControllerPager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllerPager.dataSource = self
        viewControllerPager.delegate = self
        
        viewControllerPager.reloadPages()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: ViewControllerPager Delegate
    func didAppearPage(_ viewControllerPager: ViewControllerPager, index: Int) {
        
        debugPrint("didAppear : \(index)")
    }
    
    func didDisAppearPage(_ viewControllerPager: ViewControllerPager, index: Int) {
        
        debugPrint("didDisAppear : \(index)")
    }
    
    func pageViewController(_ viewControllerPager: ViewControllerPager, index: Int) -> PageViewController? {
     
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc: PageViewController?
        
        if index == 0 {
            
            vc = viewControllerPager.dequeueReuseablePageWithIdentifier("ChildViewController1")
            
            if vc == nil {
             
                vc = storyboard.instantiateViewController(withIdentifier: "ChildViewController1") as? PageViewController
            }
            
        } else if index == 1 {
            
            vc = viewControllerPager.dequeueReuseablePageWithIdentifier("ChildViewController2")
            
            if vc == nil {
                
                vc = storyboard.instantiateViewController(withIdentifier: "ChildViewController2") as? PageViewController
            }
            
        } else {
            
            vc = viewControllerPager.dequeueReuseablePageWithIdentifier("ChildViewController3")
            
            if vc == nil {
                
                vc = storyboard.instantiateViewController(withIdentifier: "ChildViewController3") as? PageViewController
            }
            
        }
        
        return vc
    }
    
    func pageCount(_ viewControllerPager: ViewControllerPager) -> Int {
        
        return 3
    }
}

