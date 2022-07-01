//
//  URLExtension.swift
//  NewsApp
//
//  Created by Angshuman Das on 07/04/1401 AP.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL, placeHolder: String) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }else {
                DispatchQueue.main.async {
                    self?.image = UIImage(named: placeHolder)
                }
            }
        }
    }
}
