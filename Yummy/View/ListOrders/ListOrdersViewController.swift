//
//  ListOrdersViewController.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 01/09/2022.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var listOrderTableView: UITableView!

    var orders: [OrderStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOrderTableView.delegate = self
        listOrderTableView.dataSource = self
        
        registerCell()
        fetchingDataFromAPI()
    }
    
    private func registerCell(){
        listOrderTableView.register(UINib(nibName: DishListTableViewCell.identifire, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifire)
    }
    private func fetchingDataFromAPI(){
        ProgressHUD.show()
        NetworkService().fetch(path: "orders", responseClass: WelcomeOrders.self) { response in
            switch response{
            case .success(let data):
                ProgressHUD.dismiss()
                guard let data = data else {return}
                self.orders = data.data ?? []
                self.listOrderTableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}


// MARK: - Extention of Delegate and DataSource to Tabelview
extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource{
    
//numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }

//cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifire, for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }

//didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
