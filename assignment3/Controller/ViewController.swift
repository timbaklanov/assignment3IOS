//
//  ViewController.swift
//  assignment3
//
//  Created by Тимур Бакланов on 14.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var manager: ImageManager = ImageManager()
    
    @IBOutlet weak var imagePicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var aVC = segue.destination as? AddPhotoViewController
        aVC?.delegate = self
    }
    
    

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource,
                          AddImageProtocol {
    func controllerDidFinishedWithNewImage(image: Image) {
        manager.addImage(image: image)
        imagePicker.reloadAllComponents()
    }
    
    func controllerDidCancled() {
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return manager.getAllStudents().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return manager.getAllStudents()[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let image = manager.getAllStudents()[row]
        let url = URL(string: image.url)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
        }
    }
}

