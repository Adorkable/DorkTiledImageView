//
//  DorkTiledImageView.swift
//  DorkTiledImageView
//
//  Created by Ian on 5/19/15.
//  Copyright (c) 2015 Adorkable. All rights reserved.
//

import UIKit

@IBDesignable
public class DorkTiledImageView : UIImageView {
    public override var image : UIImage? {
        set {
            super.image = self.generateTiledImage(newValue)
        }
        get {
            return super.image
        }
    }
    
    internal func generateTiledImage(image : UIImage?) -> UIImage? {
        var result : UIImage?
        if image != nil
        {
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)
            
            var horizontalCount = self.bounds.size.width / image!.size.width
            var verticalCount = self.bounds.size.height / image!.size.height
            
            for var x = CGFloat(0); x < horizontalCount; x = x + 1
            {
                for var y = CGFloat(0); y < verticalCount; y = y + 1
                {
                    var drawRect = CGRect(
                        x: CGFloat(x) * image!.size.width,
                        y: CGFloat(y) * image!.size.height,
                        width: image!.size.width,
                        height: image!.size.height)
                    
                    image!.drawInRect(drawRect)
                }
            }
            
            result = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
        }
        
        return result
    }
}
