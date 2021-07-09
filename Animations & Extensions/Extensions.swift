import Foundation
import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit, blur: Bool) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                if blur == true {
                    self?.image = Animation().blurImage(image: image)
                } else {
                    self?.image = image
                }
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit, blur: Bool = false) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode, blur: blur)
    }
}

extension ViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

            if collectionView == self.firstRoomCollectionView {
                return 10
            } else if collectionView == self.secondRoomCollectionView {
                return 5
            } else if collectionView == self.thirdRoomCollectionView {
                return 10
            }
            else if collectionView == self.fourthRoomCollectionView {
                return 15
            } else if collectionView == self.kitchenCollectionView {
                return 15
            }
            return 0
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.homeCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        } else if collectionView == self.firstRoomCollectionView {
//            return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height/1.1)
            return CGSize(width: 160, height: collectionView.frame.height/1.1)
        } else if collectionView == self.secondRoomCollectionView {
            return CGSize(width: 114, height: collectionView.frame.height / 1.05)

        } else if collectionView == self.thirdRoomCollectionView {
            return CGSize(width: 332, height: collectionView.frame.height / 1.05)
        }
        else if collectionView == self.fourthRoomCollectionView {
            return CGSize(width: 316, height: collectionView.frame.height / 1)
        } else if collectionView == self.kitchenCollectionView {
            return CGSize(width: 325, height: collectionView.frame.height / 1.05)
        }
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        if collectionView == self.fourthRoomCollectionView {
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        } else if collectionView == self.kitchenCollectionView {
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.listViewModel == nil {
            return 0
        }
        if collectionView == self.homeCollectionView {
            return self.listViewModel.HomeVM().featuredCount
        }
        if collectionView == self.firstRoomCollectionView {
            return self.listViewModel.FirstVM().productsCount
        }
        if collectionView == self.secondRoomCollectionView {
            return self.listViewModel.SecondVM().categoriesCount
        }
        if collectionView == self.thirdRoomCollectionView {
            return self.listViewModel.ThirdVM().collectionsCount
        }
        if collectionView == self.fourthRoomCollectionView {
            return self.listViewModel.FourthVM().shopsCount
        }
        if collectionView == self.kitchenCollectionView {
            return self.listViewModel.KitchenVM().shopsCount
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == self.homeCollectionView {
            self.myPage.currentPage = indexPath.row
        }
            }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            if scrollView == self.fourthRoomCollectionView {
                var currentCellOffset = self.fourthRoomCollectionView.contentOffset
                currentCellOffset.x += self.fourthRoomCollectionView.frame.width / 2
                if let indexPath = self.fourthRoomCollectionView.indexPathForItem(at: currentCellOffset) {
                        self.fourthRoomCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                    image_5.downloaded(from: (self.listViewModel.FourthVM().getImageUrlBg(indexPath.row)), contentMode: .scaleAspectFill, blur: true)
                }
            }
        }
    
    func Dategate(liste: [UICollectionView]) {
        for i in liste {
            i.dataSource = self
            i.delegate = self
        }
    }
    
    func DataReload(cell: [UICollectionView]) -> () {
        for i in cell {
            i.reloadData()
        }
    }
     
}

