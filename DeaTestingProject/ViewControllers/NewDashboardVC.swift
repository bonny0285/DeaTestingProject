//
//  DashboardViewController.swift
//  DeaTestingProject
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

class NewDashboardVC: UIViewController {

    //MARK: - Outlets

    @IBOutlet weak var verticalScrollViewContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var horizontalScrollViewContainer: UIView!
    
    //MARK: - Properties

    var viewContainer: [DashboardView] = []
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.subviews.forEach { $0.removeFromSuperview() }

        provaScroll()
    }

    //MARK: - Methods

    private func provaScroll() {
        scrollView.backgroundColor = .blue
        
        var views = [UIView]()
        
        for _ in 0 ... 5 {
            let view = DashboardView()
            view.delegate = self
            let newView = UIView()
            
            newView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            view.topAnchor.constraint(equalTo: newView.topAnchor, constant: 0).isActive = true
            view.bottomAnchor.constraint(equalTo: newView.bottomAnchor, constant: 0).isActive = true
            view.trailingAnchor.constraint(equalTo: newView.trailingAnchor, constant: 0).isActive = true
            view.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: 0).isActive = true
            
            views.append(newView)
        }
        
        scrollView.contentSize = CGSize(
            width: view.frame.width * CGFloat(viewContainer.count),
            height: 1
        )
        
        scrollView.isPagingEnabled = true

        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = .horizontal
        stack.backgroundColor = .red
    
        scrollView.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 0).isActive = true
        stack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
    }
    
    //MARK: - Actions

}

//MARK: - DashboardViewDelegate

extension NewDashboardVC: DashboardViewDelegate {
    func optionButtonPressed() {
        print("Button pressed")
    }
}
