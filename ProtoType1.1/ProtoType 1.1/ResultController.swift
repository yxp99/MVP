//
//  ResultController.swift
//  ProtoType 1.1
//
//  Created by cj on 10/7/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit

class ResultController: UIViewController {

    @IBOutlet weak var resultTextField: UITextView!
    var content: String?
    
    override func viewDidLoad() {
        resultTextField.text = content;
        super.viewDidLoad()
        //setText(_content:
        // Do any additional setup after loading the view.
        
    }
    
    



}
