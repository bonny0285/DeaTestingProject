//
//  ViewController.swift
//  DeaTestingProject
//
//  Created by Bonafede Massimiliano on 28/04/21.
//

import UIKit

class AddOnViewController: UIViewController {

    //MARK: - Outlets

    @IBOutlet weak var addOnCardView: AddOnCardView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties

    var cellsContainer: [AddOnCardView.ViewModel] = []
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "AddOnCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "AddOnCell")
        tableView.estimatedRowHeight = 264
//        tableView.estimatedSectionHeaderHeight = 0
//        tableView.estimatedSectionFooterHeight = 0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let card1 = AddOnCardView.ViewModel(
            title: "Giga Travel Weekly",
            subTitle: "Valido per alcuni paesi extra EU",
            bottomTitle: "Attiva per 7 giorni dal primo utilizzo",
            withPromo: false,
            topCardView: AddOnTopCardView.ViewModel(style: .singleInformation(giga: 100)),
            middleCardView: AddOnMiddleCardView.ViewModel(style: .oneShotTravel(renewalPrice: 15.00, activationPrice: 5.00)))
        
        cellsContainer.append(card1)
        
        let card2 = AddOnCardView.ViewModel(
            title: "Travel Weekly",
            subTitle: "Valido per alcuni paesi extra EU",
            bottomTitle: "Attiva per 7 giorni dal primo utilizzo",
            withPromo: false,
            topCardView: AddOnTopCardView.ViewModel(style: .multiInformation(giga: 100, minutes: 100, sms: 500)),
            middleCardView: AddOnMiddleCardView.ViewModel(style: .oneShotTravel(renewalPrice: 15.00, activationPrice: 5.00)))
        
        cellsContainer.append(card2)
        
        let card3 = AddOnCardView.ViewModel(
            title: "Travel Daily",
            subTitle: "Valido per alcuni paesi extra EU",
            bottomTitle: "Attiva per 24h dal primo utilizzo",
            withPromo: false,
            topCardView: AddOnTopCardView.ViewModel(style: .multiInformation(giga: 100, minutes: 100, sms: 500)),
            middleCardView: AddOnMiddleCardView.ViewModel(style: .oneShotTravel(renewalPrice: 7.00, activationPrice: 5.00)))
        
        cellsContainer.append(card3)
        
        let card4 = AddOnCardView.ViewModel(
            title: "Extra Giga",
            subTitle: "Da utilizzare in 2 mesi",
            bottomTitle: nil,
            withPromo: false,
            topCardView: AddOnTopCardView.ViewModel(style: .none),
            middleCardView: AddOnMiddleCardView.ViewModel(style: .oneShotStandard(freeActivation: false, giga: 100, activationPrice: 5.00)))
        
        cellsContainer.append(card4)
        
        let card5 = AddOnCardView.ViewModel(
            title: "Extra Giga",
            subTitle: "Tanti giga in più ogni mese",
            bottomTitle: nil,
            withPromo: false,
            topCardView: AddOnTopCardView.ViewModel(style: .singleInformation(giga: 100)),
            middleCardView: AddOnMiddleCardView.ViewModel(style: .recurrent(freeActivation: true, renewalOldPrice: nil, renewalPrice: 15.00, activationOldPrice: nil, activationPrice: 0)))

        cellsContainer.append(card5)
        
        let card6 = AddOnCardView.ViewModel(
            title: "Extra Giga",
            subTitle: "Tanti giga in più ogni mese",
            bottomTitle: nil,
            withPromo: false,
            topCardView: AddOnTopCardView.ViewModel(style: .singleInformation(giga: 100)),
            middleCardView: AddOnMiddleCardView.ViewModel(style: .recurrent(freeActivation: false, renewalOldPrice: nil, renewalPrice: 15.00, activationOldPrice: nil, activationPrice: 5.00)))
        
        cellsContainer.append(card6)
        
        let card7 = AddOnCardView.ViewModel(
            title: "Extra Giga",
            subTitle: "Da utilizzare in 2 mesi",
            bottomTitle: nil,
            withPromo: false,
            topCardView: AddOnTopCardView.ViewModel(style: .none),
            middleCardView: AddOnMiddleCardView.ViewModel(style: .oneShotStandard(freeActivation: true, giga: 100, activationPrice: 5.00)))
        
        cellsContainer.append(card7)
        
        let card8 = AddOnCardView.ViewModel(
            title: "Extra Giga",
            subTitle: "Continua a navigare senza sosta",
            bottomTitle: "Sconto valido per i primi 3 rinnovi",
            withPromo: true,
            topCardView: AddOnTopCardView.ViewModel(style: .singleInformation(giga: 100)),
            middleCardView: AddOnMiddleCardView.ViewModel(style: .recurrent(freeActivation: true, renewalOldPrice: 20.99, renewalPrice: 15.00, activationOldPrice: nil, activationPrice: 5.00)))
        
        cellsContainer.append(card8)
        
        let card9 = AddOnCardView.ViewModel(
            title: "Extra Giga",
            subTitle: "Continua a navigare senza sosta",
            bottomTitle: "Sconto valido per i primi 3 rinnovi",
            withPromo: true,
            topCardView: AddOnTopCardView.ViewModel(style: .singleInformation(giga: 100)),
            middleCardView: AddOnMiddleCardView.ViewModel(style: .recurrent(freeActivation: false, renewalOldPrice: 20.99, renewalPrice: 15.00, activationOldPrice: 11.99, activationPrice: 5.00)))
        
        cellsContainer.append(card9)
        
        let card10 = AddOnCardView.ViewModel(
            title: "Extra Giga",
            subTitle: "Continua a navigare senza sosta",
            bottomTitle: "Sconto valido per i primi 3 rinnovi",
            withPromo: true,
            topCardView: AddOnTopCardView.ViewModel(style: .singleInformation(giga: 100)),
            middleCardView: AddOnMiddleCardView.ViewModel(style: .recurrent(freeActivation: false, renewalOldPrice: 20.99, renewalPrice: 15.00, activationOldPrice: nil, activationPrice: 5.00)))
        
        cellsContainer.append(card10)
        
        let card11 = AddOnCardView.ViewModel(
            title: "Extra Giga",
            subTitle: "Continua a navigare senza sosta",
            bottomTitle: "Offerta per te",
            withPromo: true,
            topCardView: AddOnTopCardView.ViewModel(style: .singleInformation(giga: 100)),
            middleCardView: AddOnMiddleCardView.ViewModel(style: .recurrent(freeActivation: false, renewalOldPrice: nil, renewalPrice: 15.00, activationOldPrice: 11.99, activationPrice: 5.00)))
        
        cellsContainer.append(card11)
        
        tableView.reloadData()
    }

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
////        let topViewModel = AddOnTopCardView.ViewModel(style: .withPromo(giga: 100))
////        //let topViewModel = AddOnTopCardView.ViewModel(style: .multiInformation(giga: 100, minutes: 100, sms: 100))
////        let middleViewModel = AddOnMiddleCardView.ViewModel(style: .oneShotTravel(renewalPrice: 20.00, activationPrice: 17.00))
////        
////        addOnCardView.viewModel = AddOnCardView.ViewModel(
////            title: "Travel Weekly",
////            subTitle: "Valido per alcuni paesi extra EU",
////            bottomTitle: "Sconto valido per i primi 3 mesi",
////            topCardView: topViewModel,
////            middleCardView: middleViewModel
////        )
//    }

}

extension AddOnViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsContainer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddOnCell", for: indexPath) as? AddOnCell else { return UITableViewCell()}
        
        cell.configureWith(addOnViewModel: self.cellsContainer[indexPath.row])
        cell.cardView.delegate = self
        cell.updateConstraints()
        return cell
    }
}


extension AddOnViewController: AddOnCardViewDelegate {
    func discoverButtonWasPressed() {
        print("Button pressed")
    }
}
