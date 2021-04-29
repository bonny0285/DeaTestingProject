//
//  AddOnCell.swift
//  DeaTestingProject
//
//  Created by Bonafede Massimiliano on 29/04/21.
//

import UIKit

class AddOnCell: UITableViewCell {

    @IBOutlet weak var cardView: AddOnCardView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(addOnViewModel: AddOnCardView.ViewModel) {
        cardView.viewModel = addOnViewModel
    }
    
}
