//
//  AddPhotoViewController.swift
//  assignment3
//
//  Created by Тимур Бакланов on 14.11.2021.
//

import UIKit

protocol AddImageProtocol {
    
    func controllerDidFinishedWithNewImage(image: Image)
    func controllerDidCancled()
    
}

class AddPhotoViewController: UIViewController {

    @IBOutlet weak var imageTitleField: UITextField!
    @IBOutlet weak var urlField: UITextField!
    
    var delegate: AddImageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancledClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addClicked(_ sender: Any) {
        if let title = imageTitleField.text {
            if let url = urlField.text {
                if !title.isEmpty && !url.isEmpty {
                    let newImage = Image(name: title, url: url)
                    delegate?.controllerDidFinishedWithNewImage(image: newImage)
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
}
