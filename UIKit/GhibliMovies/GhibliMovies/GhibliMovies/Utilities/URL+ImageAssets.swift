//
//  URL+ImageAssets.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-12-01.
//

import UIKit

extension URL{
    /// Convierte una foto en una URL para poder usarla localmente, la guarda en la cache, se usa el + para indicar extensions
    static func convertAssetImage(forImageNamed name: String, imageExtension: String = "jpg") -> URL? {
        let fileManager = FileManager.default
        
        guard let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            print("Unable to access cache directory")
            return nil
        }
        
        let url = cacheDirectory.appendingPathComponent("\(name).\(imageExtension)")
        
        // If file doesn't exist, creates it
        guard !fileManager.fileExists(atPath: url.path) else {
            return url
        }
        guard let image = UIImage(named: name),
              let data = image.jpegData(compressionQuality: 1) else {
              print("Impossible to convert to jpg data")
              return nil
        }
            
            fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
            return url
        }
    }
