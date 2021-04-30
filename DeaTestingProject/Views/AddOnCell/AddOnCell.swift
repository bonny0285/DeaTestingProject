//
//  AddOnCell.swift
//  DeaTestingProject
//
//  Created by Bonafede Massimiliano on 29/04/21.
//

import UIKit

class AddOnCell: UITableViewCell {

    @IBOutlet weak var cardView: AddOnCardView!
    
    func configureWith(addOnViewModel: AddOnCardView.ViewModel) {
        
        //DispatchQueue.main.async {
        self.cardView.viewModel = addOnViewModel
        //self.cardView.configureWithViewModel(addOnViewModel)
        //}
    }
    
}
