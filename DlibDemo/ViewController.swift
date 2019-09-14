//
//  ViewController.swift
//  DlibDemo
//
//  Created by simon on 2019/9/9.
//  Copyright © 2019 simon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var videoButton: UIButton = {
        let button = UIButton()
        button.setTitle("视频流检测人脸特征点", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    lazy var albumButton: UIButton = {
        let button = UIButton()
        button.setTitle("相片检测人脸特征点", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Dlib Demo"
        self.view.addSubview(videoButton)
        self.view.addSubview(albumButton)
        videoButton.frame = CGRect(x: (self.view.frame.width - 260) / 2, y: 150, width: 260, height: 30)
        albumButton.frame = CGRect(x: (self.view.frame.width - 260) / 2, y: 150 + 60, width: 260, height: 30)
        
        videoButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        albumButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)

    }
    
    @objc func buttonClick(_ button: UIButton) {
        if button == videoButton {
            self.navigationController?.pushViewController(VideoScanViewController(), animated: true)
        } else {
            self.navigationController?.pushViewController(AlbumViewController(), animated: true)
        }
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
