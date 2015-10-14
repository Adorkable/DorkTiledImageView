//
//  DorkTiledImageView.swift
//  DorkTiledImageView
//
//  Created by Ian on 5/19/15.
//  Copyright (c) 2015 Adorkable. All rights reserved.
//

import UIKit

//@IBDesignable
public class DorkTiledImageView : UIImageView {
    internal var originalImage : UIImage?
    
    public override var image : UIImage? {
        set {
            self.originalImage = newValue
            self.updateFromOriginalImage()
        }
        get {
            return super.image
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Funky swapping, init with decoder doesn't call the overridden setter
        if super.image != nil
        {
            self.image = super.image
        }
    }

    internal func updateFromOriginalImage() {
        super.image = self.generateTiledImage(self.originalImage)
    }
    
    internal func generateTiledImage(image : UIImage?) -> UIImage? {
        var result : UIImage?
        if image != nil
        {
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)
            
            let horizontalCount = self.bounds.size.width / image!.size.width
            let verticalCount = self.bounds.size.height / image!.size.height
            
            for var x = CGFloat(0); x < horizontalCount; x = x + 1
            {
                for var y = CGFloat(0); y < verticalCount; y = y + 1
                {
                    let drawRect = CGRect(
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.updateFromOriginalImage()
    }
}
