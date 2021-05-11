//
//  DashboardViewController.swift
//  DeaTestingProject
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var verticalScrollViewContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var horizontalScrollViewContainer: UIView!
    
    
    var viewContainer: [Dashboard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        
        viewContainer = createSubviews()
        setupScrollViewWith(views: viewContainer)
    }
    
    private func createSubviews() -> [Dashboard] {
        var views: [Dashboard] = []
        
        for i in 0 ... 5 {
            let view = Dashboard(
                frame: CGRect(
                    x: 0 + (view.frame.width * CGFloat(i)),
                    y: 0,
                    width: view.frame.width,
                    height: 308//scrollView.frame.height
                )
            )

        

            views.append(view)
        }
        return views
    }

    private func setupScrollViewWith(views: [Dashboard]) {
//        scrollView.frame = CGRect(
//            x: 0,
//            y: 0,
//            width: view.frame.width,
//            height: 300//view.frame.height
//        )
        
        scrollView.contentSize = CGSize(
            width: view.frame.width * CGFloat(viewContainer.count),
            height: 1
            
        )
        
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< viewContainer.count {
            //horizontalScrollViewContainer.addSubview(viewContainer[i])
            scrollView.addSubview(viewContainer[i])
        }
    }

}
