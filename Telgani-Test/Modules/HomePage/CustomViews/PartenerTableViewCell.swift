//
//  PartenerTableViewCell.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 14/02/1444 AH.
//

import UIKit

class PartenerTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    
    
    lazy var viewModel = PartenerCellViewModel()
    var navigatetoBookingDetails: (() -> ())?
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.isPagingEnabled = true
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!  {
        didSet {
            pageControl.numberOfPages = 19 /// will be Number Of Cars inside Every Branch  (19 ) Because First One is already Selected
           
            
        }
    }
    
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var previousBtn: UIButton!
    
    
    //MARK: - View Life Cycle
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        setupViewModel()
        
    }
    
    
    
    func setupViewModel() {
        
        /// TO Setup View model Closures Here
    }
   
    
    //MARK: - Actions
    
    @IBAction func previousButtonAction(_ sender: Any) {
      
     
      
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        
       

    }
    
}


//MARK: - UICollection View Delegate

extension PartenerTableViewCell : UICollectionViewDelegate {
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberofCars ?? 0  /// will be Number Of Cars inside Every Branch
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x / scrollView.frame.size.width
        
        self.pageControl.currentPage = Int(currentPage) ///  to Handle Current Pages For Pager

    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        navigatetoBookingDetails?()
        
    }
    
}


//MARK: - UICollection View DataSource


extension PartenerTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: VechileCollectionViewCell.self), for: indexPath) as! VechileCollectionViewCell
        
        // Here We Can inject Data Coming From WebService
        
        return cell
        
    }
    
    
    
}


//MARK: - UICollectionViewDelegateFlowLayout

extension PartenerTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

            return 8
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let frameSize = collectionView.frame.size
            return CGSize(width: frameSize.width - 10, height: frameSize.height)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)
        }
    
    
}

