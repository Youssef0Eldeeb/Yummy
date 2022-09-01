//
//  ListOrdersViewController.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 01/09/2022.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var listOrderTableView: UITableView!

    var orders: [OrderStruct] = [
        .init(id: "1", name: "Seafood", dish: .init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233)),.init(id: "1", name: "Seafood", dish: .init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233)),.init(id: "1", name: "Seafood", dish: .init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233)),.init(id: "1", name: "Seafood", dish: .init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233)),.init(id: "1", name: "Seafood", dish: .init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233)),.init(id: "1", name: "Seafood", dish: .init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233)),.init(id: "1", name: "Seafood", dish: .init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOrderTableView.delegate = self
        listOrderTableView.dataSource = self
        
        registerCell()
    }
    
    private func registerCell(){
        listOrderTableView.register(UINib(nibName: DishListTableViewCell.identifire, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifire)
    }
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifire, for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
