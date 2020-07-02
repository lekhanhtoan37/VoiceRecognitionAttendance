//
//  Extension+PHFetchResult.swift
//  TikFollower
//
//  Created by Le Toan on 6/22/20.
//  Copyright © 2020 Solarjsc. All rights reserved.
//

import Photos

extension PHFetchResult where ObjectType == PHAssetCollection {
    
    func objects() -> [PHAssetCollection] {
        var results = [PHAssetCollection]()
        self.enumerateObjects { (object, index, isAtEnd) in
            results.append(object)
        }
        return results
    }
}

extension PHFetchResult where ObjectType == PHCollection {
    
    func objects() -> [PHCollection] {
        var results = [PHCollection]()
        self.enumerateObjects { (object, index, isAtEnd) in
            results.append(object)
        }
        return results
    }
}

extension PHFetchResult where ObjectType == PHAsset {
    
    func objects() -> [PHAsset] {
        var results = [PHAsset]()
        self.enumerateObjects { (object, index, isAtEnd) in
            results.append(object)
        }
        return results
    }
}
