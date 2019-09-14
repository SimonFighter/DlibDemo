//
//  VideoScanViewController.swift
//  DlibDemo
//
//  Created by simon on 2019/9/9.
//  Copyright © 2019 simon. All rights reserved.
//

import UIKit

class VideoScanViewController: UIViewController {
    let sessionHandler = SessionHandler()
    
    lazy var preview: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "视频流检测人脸特征点"
        self.view.backgroundColor = .white
        self.view.addSubview(preview)
        preview.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sessionHandler.openSession()
        let layer = sessionHandler.layer
        layer.frame = preview.bounds
        preview.layer.addSublayer(layer)
        view.layoutIfNeeded()
    }
}
