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
    var categories: [DishCategoryStruct] = [.init(id: "1", name: "Chicken", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/6/3/1/FNM_070111-Fried-Chicken-026_s4x3.jpg.rend.hgtvcom.616.462.suffix/1382539796174.jpeg"),.init(id: "1", name: "Chicken", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/6/3/1/FNM_070111-Fried-Chicken-026_s4x3.jpg.rend.hgtvcom.616.462.suffix/1382539796174.jpeg"),.init(id: "1", name: "Chicken", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/6/3/1/FNM_070111-Fried-Chicken-026_s4x3.jpg.rend.hgtvcom.616.462.suffix/1382539796174.jpeg"),.init(id: "1", name: "Chicken", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/6/3/1/FNM_070111-Fried-Chicken-026_s4x3.jpg.rend.hgtvcom.616.462.suffix/1382539796174.jpeg"),.init(id: "1", name: "Chicken", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/6/3/1/FNM_070111-Fried-Chicken-026_s4x3.jpg.rend.hgtvcom.616.462.suffix/1382539796174.jpeg"),.init(id: "1", name: "Chicken", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/6/3/1/FNM_070111-Fried-Chicken-026_s4x3.jpg.rend.hgtvcom.616.462.suffix/1382539796174.jpeg"),.init(id: "1", name: "Chicken", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/6/3/1/FNM_070111-Fried-Chicken-026_s4x3.jpg.rend.hgtvcom.616.462.suffix/1382539796174.jpeg"),.init(id: "1", name: "Chicken", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/6/3/1/FNM_070111-Fried-Chicken-026_s4x3.jpg.rend.hgtvcom.616.462.suffix/1382539796174.jpeg"),.init(id: "1", name: "Chicken", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/6/3/1/FNM_070111-Fried-Chicken-026_s4x3.jpg.rend.hgtvcom.616.462.suffix/1382539796174.jpeg"),.init(id: "1", name: "Chicken", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/6/3/1/FNM_070111-Fried-Chicken-026_s4x3.jpg.rend.hgtvcom.616.462.suffix/1382539796174.jpeg")]
    
    var populars: [PopularDishStruct] = [
        .init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 200),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 20),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 332),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 233),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323),.init(id: "1", name: "Green", description: "this foood is very very yummy but contains on alots of calories ", image: "https://picsum.photos/536/354", calories: 323)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        popularCollectioinView.delegate = self
        popularCollectioinView.dataSource = self
        
        registerCell()
    }
    
    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: CatagoryCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: CatagoryCollectionViewCell.identifire)
        popularCollectioinView.register(UINib(nibName: PopularDishCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: PopularDishCollectionViewCell.identifire)
        
    }
}




extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectioinView:
            return populars.count
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
        default: return UICollectionViewCell()
        }
        
        
    }
    
    
}
