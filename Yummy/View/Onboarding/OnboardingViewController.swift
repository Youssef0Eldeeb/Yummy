//
//  OnboardingViewController.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 30/08/2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    
    var slides: [OnboardingSlideStruct] = []
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
                nextBtn.setTitle("Get Started", for: .normal)
            }else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        slides = [
                    OnboardingSlideStruct(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
                    OnboardingSlideStruct(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
                    OnboardingSlideStruct(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
                ]
        
        pageControl.numberOfPages = slides.count
    }
    
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            if let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as? UINavigationController{
                controller.modalPresentationStyle = .fullScreen
                controller.modalTransitionStyle = .flipHorizontal
                present(controller, animated: true)
            }
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    
}

// MARK: - extention of OnboardingViewController

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        
        return cell
    }
    // when ending of scrolling of page
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = collectionView.frame.width
        // calculate the index of current page
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    // size of collection view (protocol: UICollectionViewDelegateFlowLayout)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}
