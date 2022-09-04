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
    
    var dishes: [DishStruct] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        dishesTableView.delegate = self
        dishesTableView.dataSource = self
        
        title = category.name
        registerCell()
        fetchingDataFromAPI()
    }
    
    private func registerCell(){
        dishesTableView.register(UINib(nibName: DishListTableViewCell.identifire, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifire)
    }
    
    private func fetchingDataFromAPI(){
        let id = category.id ?? ""
        NetworkService().fetch(path: "dishes/\(id)", responseClass: WelcomeDishes.self) { response in
            switch response{
            case .success(let data):
                guard let data = data else {return}
                self.dishes = data.data ?? []
                self.dishesTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

}



// MARK: - Extention of Delegate and DataSource to TableView
extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource{
    
//numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
//cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifire, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
//didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
