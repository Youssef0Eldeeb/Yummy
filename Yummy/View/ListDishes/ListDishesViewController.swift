//
//  ListDishesViewController.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 01/09/2022.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var dishesTableView: UITableView!
    
    var category: DishCategoryStruct!
    
    var dishes: [DishStruct] = [
        .init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories this foood is very very yummy but contains on alots of calories this foood is very very yummy but contains on alots of calories this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 200),.init(id: "1", name: "fosfjsdf", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 20),.init(id: "1", name: "afsadfaf", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 332),.init(id: "1", name: "eojfkejlkjk", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        dishesTableView.delegate = self
        dishesTableView.dataSource = self
        
        title = category.name
        registerCell()
    }
    private func registerCell(){
        dishesTableView.register(UINib(nibName: DishListTableViewCell.identifire, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifire)
    }
    

}


extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifire, for: indexPath) as! DishListTableViewCell
        
        cell.setup(dish: dishes[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
