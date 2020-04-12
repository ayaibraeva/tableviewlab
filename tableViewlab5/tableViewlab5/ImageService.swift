//
//  ImageService.swift
//  tableViewlab5
//
//  Created by Ayaulym Ibrayeva on 4/12/20.
//  Copyright © 2020 Ayaulym Ibrayeva. All rights reserved.
//

import Foundation
import UIKit

class ImageService {
    // MARK: - Variables
    static let shared = ImageService()
    
    // MARK: - Methods
    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                let image = UIImage(data: data)
            else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
}
