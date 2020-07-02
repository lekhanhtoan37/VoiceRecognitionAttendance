//
//  Extension+Int.swift
//  TikFollower
//
//  Created by Le Toan on 6/23/20.
//  Copyright © 2020 Solarjsc. All rights reserved.
//

import Foundation
import Photos
extension Int {
    func timeString() -> String {
        
        let minute = self / 60 % 60
        let second = self % 60

        // return formated string
        return String(format: "%02d:%02d", minute, second)
    }

}

extension TimeInterval {
    func timeString() -> String {
        if (Int(self) / 3600) > 0 {
            return "\(Int(self) / 3600):\((Int(self) % 3600) / 60):\((Int(self) % 3600) % 60)"
        } else {
            return String(format: "%02d:%02d", Int(self / 60), Int(Int(self) % 60))
        }
    }
}

extension CMTime {
    func toDouble() -> Float64 {
        return CMTimeGetSeconds(self)
    }
}

extension Int {
    var degreesToRadians: CGFloat {
        return CGFloat(self) * .pi / 180.0
    }
}

extension Double {
    var toTimeString: String {
        let seconds: Int = Int(self.truncatingRemainder(dividingBy: 60.0))
        let minutes: Int = Int(self / 60.0)
        return String(format: "%d:%02d", minutes, seconds)
    }
}
