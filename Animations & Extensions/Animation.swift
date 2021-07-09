import Foundation
import UIKit

class Animation {
    
    
    func firstCell(cell: UICollectionViewCell) -> () {
        cell.layer.cornerRadius = 5
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.borderWidth = 0.3
        
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.layer.masksToBounds = true

        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)//CGSizeMake(0, 2.0);
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    }
    
    func secondCell(cell: UICollectionViewCell) -> () {
        
        cell.layer.cornerRadius = 5
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.borderWidth = 0.3
        
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.layer.masksToBounds = true

        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)//CGSizeMake(0, 2.0);
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
    }
    
    func thirdCell(cell: UICollectionViewCell) -> () {
        
        cell.layer.cornerRadius = 5
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.borderWidth = 0.3
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)//CGSizeMake(0, 2.0);
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
    }
    
    func kitchenCell(cell: UICollectionViewCell) -> () {

        cell.layer.cornerRadius = 5
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.borderWidth = 0.3
        
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.layer.masksToBounds = true

        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)//CGSizeMake(0, 2.0);
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    }
    
    func blurImage(image:UIImage) -> UIImage? {
            let context = CIContext(options: nil)
            let inputImage = CIImage(image: image)
            let originalOrientation = image.imageOrientation
            let originalScale = image.scale

            let filter = CIFilter(name: "CIGaussianBlur")
            filter?.setValue(inputImage, forKey: kCIInputImageKey)
            filter?.setValue(5.0, forKey: kCIInputRadiusKey)
            let outputImage = filter?.outputImage

            var cgImage:CGImage?

            if let asd = outputImage
            {
                cgImage = context.createCGImage(asd, from: (inputImage?.extent)!)
            }

            if let cgImageA = cgImage
            {
                return UIImage(cgImage: cgImageA, scale: originalScale, orientation: originalOrientation)
            }

            return nil
        }
    
    
    func animateAll(view: [UIView]){
     
        for i in view {
            let animateView = i
     
        animateView.transform = CGAffineTransform(translationX: 500, y: 0)
     
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
     
                animateView.transform = CGAffineTransform(translationX: 0, y: 0);
     
            }, completion: nil)
        }
    }
  
    
}

extension ViewController {
    
    @objc func imageTapped2(_ sender: UITapGestureRecognizer)
        {
               let imageView = sender.view as! UIImageView
               let newImageView = UIImageView(image: imageView.image)
               newImageView.frame = UIScreen.main.bounds
               newImageView.backgroundColor = .black
               newImageView.contentMode = .scaleAspectFit
               newImageView.isUserInteractionEnabled = true
               let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
               newImageView.addGestureRecognizer(tap)
               self.view.addSubview(newImageView)
               self.navigationController?.isNavigationBarHidden = true
               self.tabBarController?.tabBar.isHidden = true
        }
    
        @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
            self.navigationController?.isNavigationBarHidden = false
            self.tabBarController?.tabBar.isHidden = false
            sender.view?.removeFromSuperview()
        }
    
        
    
}
