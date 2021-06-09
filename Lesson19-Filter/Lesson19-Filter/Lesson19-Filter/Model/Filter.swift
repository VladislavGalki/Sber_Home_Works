//
//  Filter.swift
//  Lesson19-Filter
//
//  Created by Владислав Галкин on 09.06.2021.

import UIKit

final class Filter {
    
    var outputFilteredImage = [UIImage]()
    
    let filters = CIFilter.filterNames(inCategories: nil).filter {
        CIFilter(name: $0)?.inputKeys.contains("inputImage") ?? false &&
            (CIFilter(name: $0)?.inputKeys.contains("inputIntensity") ?? false ||
                CIFilter(name: $0)?.inputKeys.contains("inputRadius") ?? false)
    }
    
    public func createPhotoFIlter(image: UIImage, filterName: String, intensity: CGFloat) -> UIImage {
        DispatchQueue.global().sync {
            let context = CIContext()
            
            if let filter = CIFilter(name: filterName) {
                let ciImage = CIImage(image: image)
                filter.setValue(ciImage, forKey: kCIInputImageKey)
                
                if filter.inputKeys.contains("inputIntensity") {
                    filter.setValue(intensity, forKey: kCIInputIntensityKey)
                }
                
                if filter.inputKeys.contains("inputRadius") {
                    filter.setValue(intensity * 100, forKey: kCIInputRadiusKey)
                }
                
                if let filteredImage = filter.outputImage {
                    if let cgImage = context.createCGImage(filteredImage, from: filteredImage.extent) {
                        let outputImage = UIImage(cgImage: cgImage)
                        return outputImage
                    }
                }
            }
            return image
        }
    }
}
