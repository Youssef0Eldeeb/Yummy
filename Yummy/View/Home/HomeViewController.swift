//
//  HomeViewController.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 30/08/2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectioinView: UICollectionView!
    @IBOutlet weak var chefSpiecialCollectionView: UICollectionView!
    
    var categories: [DishCategoryStruct] = []
    var populars: [DishStruct] = []
    var specials: [DishStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        popularCollectioinView.delegate = self
        popularCollectioinView.dataSource = self
        
        chefSpiecialCollectionView.delegate = self
        chefSpiecialCollectionView.dataSource = self
        
        registerCell()
        fetchingDataFromAPI()
    }
    
    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: CatagoryCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: CatagoryCollectionViewCell.identifire)
        popularCollectioinView.register(UINib(nibName: PopularDishCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: PopularDishCollectionViewCell.identifire)
        chefSpiecialCollectionView.register(UINib(nibName: ChefSpecialsCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: ChefSpecialsCollectionViewCell.identifire)
    }
    
    private func fetchingDataFromAPI(){
        ProgressHUD.show()
        NetworkService().fetch(path: "dish-categories", responseClass: WelcomeHome.self) { response in
            switch response{
            case .success(let data):
                ProgressHUD.dismiss()
                guard let data = data else {return}
                self.categories = data.data?.categories ?? []
                self.populars = data.data?.populars ?? []
                self.specials = data.data?.specials ?? []
                self.categoryCollectionView.reloadData()
                self.popularCollectioinView.reloadData()
                self.chefSpiecialCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
            
        }
    }
}



// MARK: - Extention of Delegate and DataSource to CollectionView

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
//numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectioinView:
            return populars.count
        case chefSpiecialCollectionView:
            return specials.count
        default: return 0
        }
    }
    
//cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatagoryCollectionViewCell.identifire, for: indexPath) as! CatagoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
            
        case popularCollectioinView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDishCollectionViewCell.identifire, for: indexPath) as! PopularDishCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
            
        case chefSpiecialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialsCollectionViewCell.identifire, for: indexPath) as! ChefSpecialsCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
        }
    }
    
//didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else{
            let controller = DishDetailsViewController.instantiate()
            controller.dish = collectionView == popularCollectioinView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}
