//
//  CameraViewController.swift
//  Parstagram
//
//  Created by Stephen Tan on 11/12/20.
//  Copyright © 2020 Stephen Tan. All rights reserved.
//

import UIKit
import AlamofireImage

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // allows the image to be interacted with, default setting is false
        imageView.isUserInteractionEnabled = true
    }
    

    @IBAction func onSubmitButton(_ sender: Any) {
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        
        // allows users to edit the photo
        picker.allowsEditing = true
        
        // determining if camera is available
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        // show the photo album
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        //setting the size of image
        let size = CGSize(width: 300, height: 300)
        
        //using Alamofire Image to scale down the image to the size
        let scaledImage = image.af.imageScaled(to: size)
        
        //setting the imageView to the image capture/selected
        imageView.image = scaledImage
        
        //going back to the previous scene
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
