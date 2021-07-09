
import Foundation

class Webservice {
    
    func downloadModel(url: URL, completion: @escaping ([Home]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let yep = try? JSONDecoder().decode( [Home].self, from: data)
                 
                if let yep = yep {
                    completion(yep)
                }
            }
            
            
        }.resume() 
        
    }
    
}


