//
//  ImageManager.swift
//  assignment3
//
//  Created by Тимур Бакланов on 14.11.2021.
//

import Foundation

class ImageManager {
    private var listOfImages = [Image]()
    
    func addImage(image: Image) {
        listOfImages.append(image)
    }
    
    func getAllStudents() -> [Image] {
        return listOfImages
    }
}
