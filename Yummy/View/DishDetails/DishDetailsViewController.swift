//
//  DishDetailsViewController.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 31/08/2022.
//

import UIKit
import ProgressHUD

class DishDetailsViewController: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dishTextField: UITextField!
    
    var dish: DishStruct!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView (){
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }

    @IBAction func palceOrderBtn(_ sender: Any) {
        guard let name = dishTextField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else{
            ProgressHUD.showError("Please enter your name")
            return
        }
        ProgressHUD.show("Placing Order...")
        NetworkService().send(name: name, dishId: dish.id ?? "", responseClass: OrderStruct.self) { response in
            switch response{
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received. 👨🏼‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
        
    }
    
}
