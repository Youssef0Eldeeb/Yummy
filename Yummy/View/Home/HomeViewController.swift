//
//  HomeViewController.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 30/08/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectioinView: UICollectionView!
    
    @IBOutlet weak var chefSpiecialCollectionView: UICollectionView!
    
    var categories: [DishCategoryStruct] = [.init(id: "1", name: "Chicken", image: "https://picsum.photos/536/354"),.init(id: "1", name: "Chicken", image: "https://picsum.photos/536/354"),.init(id: "1", name: "Chicken", image: "https://picsum.photos/536/354"),.init(id: "1", name: "Chicken", image: "https://picsum.photos/536/354"),.init(id: "1", name: "Chicken", image: "https://picsum.photos/536/354"),.init(id: "1", name: "Chicken", image: "https://picsum.photos/536/354"),.init(id: "1", name: "Chicken", image: "https://picsum.photos/536/354"),.init(id: "1", name: "Chicken", image: "https://picsum.photos/536/354"),.init(id: "1", name: "Chicken", image: "https://picsum.photos/536/354"),.init(id: "1", name: "Chicken", image: "https://picsum.photos/536/354")]
    
    var populars: [DishStruct] = [
        .init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of caloriesthis foood is very very yummy but contains on alots of caloriesthis foood is very very yummy but contains on alots of caloriesthis foood is very very yummy but contains on alots of caloriesthis foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 200),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 20),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 332),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323)
    ]
    
    var specials: [DishStruct] = [
        .init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 200),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 20),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 332),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        popularCollectioinView.delegate = self
        popularCollectioinView.dataSource = self
        
        chefSpiecialCollectionView.delegate = self
        chefSpiecialCollectionView.dataSource = self
        
        registerCell()
    }
    
    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: CatagoryCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: CatagoryCollectionViewCell.identifire)
        popularCollectioinView.register(UINib(nibName: PopularDishCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: PopularDishCollectionViewCell.identifire)
        chefSpiecialCollectionView.register(UINib(nibName: ChefSpecialsCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: ChefSpecialsCollectionViewCell.identifire)
    }
}




extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
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
