//
//  Created by Mehmet Salih ÇELİK on 6.06.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var listViewModel: ListViewModel!

    @IBOutlet weak var leftSideBar: UIView!
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    var menuOut = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var myPage: UIPageControl!
    @IBOutlet weak var firstRoomCollectionView: UICollectionView!
    @IBOutlet weak var secondRoomCollectionView: UICollectionView!
    @IBOutlet weak var thirdRoomCollectionView: UICollectionView!
    @IBOutlet weak var image_5: UIImageView!
    @IBOutlet weak var fourthRoomCollectionView: UICollectionView!
    @IBOutlet weak var kitchenCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.searchBar.setImage(UIImage(), for: .search, state: .normal)
        self.searchBar.searchBarStyle = .minimal

        Dategate(liste: [self.homeCollectionView, self.firstRoomCollectionView, self.secondRoomCollectionView, self.thirdRoomCollectionView, self.fourthRoomCollectionView, self.kitchenCollectionView])
        fourthRoomCollectionView.decelerationRate = .fast
        
        getData()
        
        self.leading.constant = -211
        self.trailing.constant = 422
        
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        if menuOut == false {
            self.leading.constant = 0
            self.trailing.constant = 211
            self.menuOut = true
        } else {
            self.leading.constant = -211
            self.trailing.constant = 422
            self.menuOut = false
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn) {
            self.view.layoutIfNeeded()
        } completion: { Bool in
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.homeCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
            
            cell.imageView.downloaded(from: (self.listViewModel.HomeVM().getImageUrl(indexPath.row)), contentMode: .scaleAspectFill)
            cell.titleLabel.text = listViewModel.HomeVM().getTitle(indexPath.row).uppercased(with: Locale(identifier: "tr"))
            
            cell.subtitleLabel.text = listViewModel.HomeVM().getSubTitle(indexPath.row).uppercased(with: Locale(identifier: "tr"))
//            let ff = HomeViewModel(home: modelListViewModel[0])
            return cell
        } else if collectionView == self.firstRoomCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstRoomCell", for: indexPath) as! FirstRoomCollectionViewCell
            
            cell.imageView.downloaded(from: (self.listViewModel.FirstVM().getImageUrl(indexPath.row)), contentMode: .scaleAspectFill)
            cell.titleLabel.text = self.listViewModel.FirstVM().getTitle(indexPath.row)
            cell.subtitleLabel.text = self.listViewModel.FirstVM().getSubTitle(indexPath.row)
            cell.priceLabel.text = self.listViewModel.FirstVM().getPrice(indexPath.row)
            cell.oldPriceLabel.text = self.listViewModel.FirstVM().getOldPrice(indexPath.row)
            Animation().firstCell(cell: cell)
            return cell
            
        } else if collectionView == self.secondRoomCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondRoomCell", for: indexPath) as! SecondRoomCollectionViewCell
            
            cell.imageView.downloaded(from: (self.listViewModel.SecondVM().getImageUrl(indexPath.row)), contentMode: .scaleAspectFill)
            cell.titleLabel.text = self.listViewModel.SecondVM().getTitle(indexPath.row).uppercased(with: Locale(identifier: "tr"))
            Animation().secondCell(cell: cell)
            return cell
        } else if collectionView == self.thirdRoomCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thirdRoomCell", for: indexPath) as! ThirdRoomCollectionViewCell
            
            cell.imageView.downloaded(from: (self.listViewModel.ThirdVM().getImageUrl(indexPath.row)), contentMode: .scaleAspectFill)
            cell.titleLabel.text = self.listViewModel.ThirdVM().getTitle(indexPath.row).uppercased(with: Locale(identifier: "tr"))
            cell.subtitleLabel.text = self.listViewModel.ThirdVM().getSubTitle(indexPath.row).uppercased(with: Locale(identifier: "tr"))
            Animation().thirdCell(cell: cell)
            return cell
        } else if collectionView == self.fourthRoomCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fourthRoomCell", for: indexPath) as! FourthCollectionViewCell

            cell.layer.cornerRadius = 5.0
            cell.contentView.layer.cornerRadius = 5.0
            cell.empty_view.layer.cornerRadius = 5.0
            cell.imageView.downloaded(from: (self.listViewModel.FourthVM().getImageUrl1(indexPath.row)), contentMode: .scaleAspectFill)
            cell.imageView3.downloaded(from: (self.listViewModel.FourthVM().getImageUrl2(indexPath.row)), contentMode: .scaleAspectFill)
            cell.imageView2.downloaded(from: (self.listViewModel.FourthVM().getImageUrl3(indexPath.row)), contentMode: .scaleAspectFill)
            cell.imageView4.downloaded(from: (self.listViewModel.FourthVM().getImageUrl4(indexPath.row)), contentMode: .scaleAspectFill)
            cell.titleLabel.text = self.listViewModel.FourthVM().getTitle(indexPath.row)
            cell.subtitleLabel.text = self.listViewModel.FourthVM().getSubTitle(indexPath.row)
            cell.imageView.layer.borderWidth = 0.1
            cell.imageView.layer.masksToBounds = false
            cell.imageView.layer.borderColor = UIColor.lightGray.cgColor
            cell.imageView.layer.cornerRadius = cell.imageView.frame.height / 2
            cell.imageView.clipsToBounds = true
            cell.imageView.isUserInteractionEnabled = true
            cell.imageView2.layer.cornerRadius = 5.0
            cell.imageView3.layer.cornerRadius = 5.0
            cell.imageView4.layer.cornerRadius = 5.0
            cell.gitButton.layer.borderWidth = 1
            cell.gitButton.layer.borderColor = UIColor.darkGray.cgColor
            cell.gitButton.layer.cornerRadius = 5.0
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped2))
            cell.imageView.addGestureRecognizer(tapGestureRecognizer)

            return cell
        } else if collectionView == self.kitchenCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kitchenCell", for: indexPath) as! kitchenCollectionViewCell
            
            if (self.listViewModel.KitchenVM().getImageUrl(indexPath.row)) != nil {
                cell.image1.downloaded(from: (self.listViewModel.KitchenVM().getImageUrl(indexPath.row)!), contentMode: .scaleAspectFill)
            } else {
                cell.image1.image = UIImage(named: "N_big")
            }
            if (self.listViewModel.KitchenVM().getLogoImageUrl(indexPath.row)) != nil {
                cell.image2.downloaded(from: self.listViewModel.KitchenVM().getLogoImageUrl(indexPath.row)!, contentMode: .scaleAspectFill, blur: false)
            } else {
                cell.image2.image = UIImage(named: "N_logo")
            }
            cell.label1.text = self.listViewModel.KitchenVM().getTitle(indexPath.row)
            cell.label2.text = self.listViewModel.KitchenVM().getSubTitle(indexPath.row)
            cell.label3.text = self.listViewModel.KitchenVM().getProductCount(indexPath.row)
            
            cell.layer.cornerRadius = 5.0
            cell.contentView.layer.cornerRadius = 5.0
            cell.image2.layer.cornerRadius = 5.0
            cell.image2.layer.borderWidth = 0.1
            cell.image2.layer.masksToBounds = false
            cell.image2.layer.borderColor = UIColor.lightGray.cgColor
            cell.image2.layer.cornerRadius = cell.image2.frame.height / 2
            cell.image2.clipsToBounds = true
            cell.image2.isUserInteractionEnabled = true
            
            
            Animation().kitchenCell(cell: cell)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func getData() {
        let url = URL(string: "https://www.vitrinova.com/api/v2/discover")!
       Webservice().downloadModel(url: url) { (data) in
           if let data = data {
            self.listViewModel = ListViewModel(homeList: data)
            DispatchQueue.main.async {
                self.DataReload(cell: [self.homeCollectionView, self.firstRoomCollectionView, self.secondRoomCollectionView, self.thirdRoomCollectionView, self.fourthRoomCollectionView, self.kitchenCollectionView])
                Animation().animateAll(view: [self.firstRoomCollectionView, self.secondRoomCollectionView, self.thirdRoomCollectionView])
                self.image_5.downloaded(from: (self.listViewModel.FourthVM().getImageUrlBg(0)), contentMode: .scaleAspectFill, blur: true)
                self.myPage.currentPage = 0
                self.myPage.numberOfPages = self.listViewModel.HomeVM().featuredCount
            }
           }
       }
    }
    
    
    
}
