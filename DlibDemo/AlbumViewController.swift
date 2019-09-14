//
//  AlbumViewController.swift
//  DlibDemo
//
//  Created by simon on 2019/9/9.
//  Copyright © 2019 simon. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {

    lazy var picker = UIImagePickerController()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    lazy var wrapper = DlibWrapper()

    var filePath = ""
    var filePathWrite = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "相册", style: .plain, target: self, action: #selector(albumClick(_:)))
        self.view.addSubview(imageView)
        imageView.frame = self.view.bounds
        
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        filePath = (cachePath as NSString).appendingPathComponent("DlibCacheFileRead.jpg")
        filePathWrite = (cachePath as NSString).appendingPathComponent("DlibCacheFileWrite.jpg")
        wrapper?.prepare()
    }
    
    @objc func albumClick(_ button: UIButton) {
        let sourceType = UIImagePickerController.SourceType.photoLibrary
        picker.delegate = self
        picker.sourceType = sourceType
        self.present(picker, animated: true, completion: nil)
    }
}

extension AlbumViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage]
        picker.dismiss(animated: true, completion: nil)
        DispatchQueue.main.async { [weak self] in
            if let image = image as? UIImage, let filePath = self?.filePath, let filePathWrite = self?.filePathWrite  {
                let imageData = image.jpegData(compressionQuality: 1.0)
                try? imageData?.write(to: URL(fileURLWithPath: filePath))
                self?.wrapper?.doWork(onImagePath: filePath, savePath: filePathWrite)
                let detectImage = UIImage.init(contentsOfFile: filePathWrite)
                self?.imageView.image = detectImage
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }
}
