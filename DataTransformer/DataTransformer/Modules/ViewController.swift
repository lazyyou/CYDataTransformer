//
//  ViewController.swift
//  DataTransformer
//
//  Created by  阿友哥 on 2018/3/22.
//  Copyright © 2018年  阿友哥. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var stringLabel: NSTextField!
    @IBOutlet weak var dataStringLabel: NSTextField!
    
    @IBOutlet weak var stringTextFeild: NSTextView!
    @IBOutlet weak var dataStringTextFeild: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func toStringBtnClick(_ sender: Any) {
        let dataString = dataStringTextFeild.string
        stringTextFeild.string = CYCharacterUtil.dataString(to: dataString)
    }
    
    @IBAction func toDataStringBtnClick(_ sender: Any) {
        let string = stringTextFeild.string
        dataStringTextFeild.string = CYCharacterUtil.string(toDataString: string)
    }
}

