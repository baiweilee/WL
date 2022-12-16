//
//  KLSwiftViewController.swift
//  WL
//
//  Created by 李开强 on 2022/11/30.
//  Copyright © 2022 李开强. All rights reserved.
//

import UIKit

@objc(KLEditTextFieldDelegate)
protocol KLEditTextFieldDelegate:NSObjectProtocol {
    func editTextField(_ str: String) -> Void
}
@objc(KLSwiftViewController)


class KLSwiftViewController: UIViewController {

    @objc var editorDelegate:KLEditTextFieldDelegate?
    var textField:UITextField?
    @objc var defaultText:NSString?
    var addButton:UIButton?
    var pushButton:UIButton?
    
    typealias editorBlock = (_ t:String) -> Void
    @objc var myEidtorBlock:editorBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        textField = UITextField.init(frame: CGRect.init(x: 50,
                                                        y: 160,
                                                        width: 200,
                                                        height: 50))
        textField?.placeholder = "输入返回首页的内容"
        textField?.text = defaultText as String?
        self.view.addSubview(textField!)
        
        
        addButton = UIButton.init(type: .custom)
        addButton?.setTitleColor(UIColor.black, for: .normal)
        addButton?.setTitle("pop", for: .normal)
        addButton?.frame = CGRect.init(x: 50, y: 250,  width: 200, height: 50)
        addButton?.layer.borderColor = UIColor.black.cgColor
        addButton?.layer.borderWidth = 1.0
        addButton?.addTarget(self, action: #selector(popAction), for: .touchUpInside)
        self.view.addSubview(addButton!)
          
          
          
        pushButton = UIButton.init(type: .custom)
        pushButton?.setTitleColor(UIColor.black, for: .normal)
        pushButton?.setTitle("push", for: .normal)
        pushButton?.frame = CGRect.init(x: 50, y: 350,  width: 200, height: 50)
        pushButton?.layer.borderColor = UIColor.black.cgColor
        pushButton?.layer.borderWidth = 1.0
        pushButton?.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        self.view.addSubview(pushButton!)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func popAction() -> Void {
          
        if editorDelegate != nil {
            editorDelegate?.editTextField((textField?.text)!)
        }
          
        if ((self.myEidtorBlock) != nil){
            self.myEidtorBlock!((textField?.text!)!)
        }
          
        self.navigationController?.popViewController(animated: true)
    }
      
      
    @objc func pushAction() -> Void {
        let ocVc = KLOCViewController.init()
        ocVc.navTitle = textField!.text!
        self.navigationController?.pushViewController(ocVc, animated: true)

    }
    
}
