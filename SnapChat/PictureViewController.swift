//
//  PictureViewController.swift
//  SnapChat
//
//  Created by Ryan Phillips on 5/3/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit
import Firebase

class PictureViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var NextButtonTapped: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var TextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        
        imageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil )
    }
    
    @IBAction func pictureTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func NextTapped(_ sender: Any) {
        
        NextButtonTapped.isEnabled = false
        
        let imagesFolder = FIRStorage.storage().reference().child("images")
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        
        imagesFolder.child("\(NSUUID().uuidString).jpg" ).put(imageData, metadata: nil, completion: {(metadata, error) in
            print("We tried to upload")
            if error != nil {
                print("We had an error: \(error)")
            }else{
            self.performSegue(withIdentifier: "selectUserSegue", sender: nil)
            }
        })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}
