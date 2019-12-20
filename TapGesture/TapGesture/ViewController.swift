//
//  ViewController.swift
//  TapGesture
//
//  Created by 조윤영 on 20/12/2019.
//  Copyright © 2019 조윤영. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIGestureRecognizerDelegate{
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
        
        //2
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_ :)))
//        self.view.addGestureRecognizer(tapGesture)
    }

    //1
    @IBAction func tapView(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    //3:delegate
    //delegate의 장점: 더 다양한 활용을 할 수 있다.
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}

