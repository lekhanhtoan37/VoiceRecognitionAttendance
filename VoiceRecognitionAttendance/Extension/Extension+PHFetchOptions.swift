//
//  Extension+PHFetchOptions.swift
//  TikFollower
//
//  Created by Le Toan on 6/23/20.
//  Copyright © 2020 Solarjsc. All rights reserved.
//

import Photos

extension PHFetchOptions {
    static var ascendingOption: PHFetchOptions = {
        let option = PHFetchOptions()
        option.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        return option
    }()
    
    static var onlyVideoOption: PHFetchOptions = {
        let option = PHFetchOptions()
        option.predicate = NSPredicate(format: "mediaType == %d && !((mediaSubtype & %d) == %d)", PHAssetMediaType.video.rawValue)
        return option
    }()
}

