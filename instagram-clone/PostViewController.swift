//
//  PostViewController.swift
//  instagram-clone
//
//  Created by Rodrigo Bell on 3/6/17.
//  Copyright © 2017 Rodrigo Bell. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    
    let vc = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vc.delegate = self
        vc.allowsEditing = true
        
        captionTextView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        captionTextView.becomeFirstResponder()
    }
    
    @IBAction func onTakePhoto(_ sender: Any) {
        vc.sourceType = UIImagePickerControllerSourceType.camera
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onSelectFromCameraRoll(_ sender: Any) {
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(vc, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Do something with the images (based on your use case)
        self.photoImageView.image = image
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
    }

    @IBAction func onExit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
