//
//  ViewControllerPager.swift
//  ViewControllerPager
//
//  Created by wjhong on 2017. 5. 8..
//

import UIKit

protocol ViewControllerPagerDataSource: class {
    
    // pages data
    func pageViewController(_ viewControllerPager: ViewControllerPager, index: Int) -> PageViewController?
    func pageCount(_ viewControllerPager: ViewControllerPager) -> Int
}

@objc protocol ViewControllerPagerDelegate: class {
    
    // page change event
    @objc optional func didAppearPage(_ viewControllerPager: ViewControllerPager, index: Int)
    @objc optional func didDisAppearPage(_ viewControllerPager: ViewControllerPager, index: Int)
}

class ViewControllerPager: UIView, UIScrollViewDelegate {

    weak var dataSource: ViewControllerPagerDataSource?
    weak var delegate: ViewControllerPagerDelegate?
    
    let scrollView: UIScrollView = UIScrollView()
    
    var pages: [PageViewController] = [PageViewController]()
    var index: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initView()
    }
    
    private func initView() {
        scrollView.delegate = self
        scrollView.frame = self.frame
        self.addSubview(scrollView)
        
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    func reloadPages() {
        setPages()
    }
    
    func dequeueReuseablePageWithIdentifier(_ identifier: String) -> PageViewController? {
        
        var vc: PageViewController?
        
        for viewController in pages {
            
            if let vcId = viewController.identifier, vcId == identifier {
                vc = viewController
                break
            }
        }
        
        return vc
    }
    
    private func setPages() {
        
        for subView in scrollView.subviews {
            subView.removeFromSuperview()
        }
        
        guard let pageCount = dataSource?.pageCount(self) else {
            return
        }
        
        for i in 0..<pageCount {
         
            if let page = dataSource?.pageViewController(self, index: i) {
                
                let pageSize = scrollView.frame.size.width
                
                page.view.frame = scrollView.frame
                page.view.frame.origin = CGPoint(x: pageSize * CGFloat(i), y: 0)
                
                scrollView.addSubview(page.view)
                
                pages.insert(page, at: i)
            }
        }
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(pageCount), height: scrollView.frame.size.height)
    }
    
    // MARK: UIScrollView Delegate
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        guard let delegate = delegate else {
            return
        }
        
        let offset = scrollView.contentOffset.x
        let value = scrollView.frame.width
        
        let newIndex = Int(offset / value)
        
        if index != newIndex {
        
            delegate.didDisAppearPage!(self, index: index)
            
            index = newIndex
            
            delegate.didAppearPage!(self, index: index)
        }
    }
}
