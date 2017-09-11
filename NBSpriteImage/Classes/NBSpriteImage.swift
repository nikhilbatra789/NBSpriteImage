//
//  UIImageExtension.swift
//  Sprite Test
//
//  Created by Nikhil Batra on 11/09/17.
//  Copyright © 2017 Nikhil Batra. All rights reserved.
//

import UIKit

extension UIImage {
    
    public func sprites(spriteSize size:CGSize) -> [UIImage] {
        return sprites(spriteSize: size, inRange: 0 ... lroundf(MAXFLOAT))
    }
    
    public func sprites(spriteSize size:CGSize, inRange range:CountableClosedRange<Int>) -> [UIImage] {
        
        let rangeLength = range.lowerBound.distance(to: range.upperBound)
        if size.equalTo(CGSize.zero) || rangeLength == 0 {
            return [UIImage]()
        }
        
        guard let spriteSheet = self.cgImage else { return [UIImage]() }
        var spriteArray = [UIImage]()
        
        let width = CGFloat(spriteSheet.width)
        let height = CGFloat(spriteSheet.height)
        
        let maxI = Int(width / size.width)
        
        var startWidthIndex = 0
        var startHeightIndex = 0
        var length = 0
        
        let startPosition = range.lowerBound
        
        if (startPosition != 0) {
            for k in 1 ... maxI {
                let d = k * maxI;
                
                if d/startPosition == 1 {
                    startWidthIndex = maxI - (d % startPosition);
                    break;
                } else if d/startPosition > 1 {
                    startWidthIndex = startPosition;
                    break;
                }
                startHeightIndex += 1;
            }
        }
        
        var positionX = CGFloat(startWidthIndex) * size.width
        var positionY = CGFloat(startHeightIndex) * size.height
        var isReady = false
        
        while positionY < height {
            while positionX < width {
                if let sprite = spriteSheet.cropping(to: CGRect(x:positionX,
                                                                y:positionY,
                                                                width:size.width,
                                                                height:size.height)) {
                    
                    spriteArray.append(UIImage(cgImage: sprite))
                }
            
                length += 1;
                
                if length == rangeLength {
                    isReady = true;
                    break;
                }
                
                positionX += size.width;
            }
            
            if isReady { break }
            
            positionX = 0;
            positionY += size.height;
        }
        
        return spriteArray
    }
}

extension UIImageView {
    
    public func animateWithSpriteSheet(spriteSheet: UIImage, spriteSize size: CGSize, fps:Int = 15) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            let spriteImgArray = spriteSheet.sprites(spriteSize: size)
            DispatchQueue.main.async {
                self.animationImages = spriteImgArray
                self.animationDuration = TimeInterval(spriteImgArray.count/fps)
                self.startAnimating()
            }
        }
    }
    
    public func animateWithSpriteSheet(spriteSheet: UIImage, spriteSize size: CGSize, range: CountableClosedRange<Int>, fps:Int = 15) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            let spriteImgArray = spriteSheet.sprites(spriteSize: size, inRange: range)
            DispatchQueue.main.async {
                self.animationImages = spriteImgArray
                self.animationDuration = TimeInterval(spriteImgArray.count/fps)
                self.startAnimating()
            }
        }
    }
}
