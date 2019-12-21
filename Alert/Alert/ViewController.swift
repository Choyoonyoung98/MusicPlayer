//
//  ViewController.swift
//  Alert
//
//  Created by 조윤영 on 21/12/2019.
//  Copyright © 2019 조윤영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpShowAlertButton(_ sender: Any) {
        self.showAlertControllrt(style: UIAlertController.Style.alert)

    }
    
    @IBAction func touchUpShowActionSheetButton(_ sender: Any) {
        self.showAlertControllrt(style: UIAlertController.Style.actionSheet)
    }
    
    func showAlertControllrt(style: UIAlertController.Style) {
        let alertController: UIAlertController
        alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        
        let okAction: UIAlertAction
        okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
            "OK pressed"
            })
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let handler: (UIAlertAction) -> Void
        handler = {(action: UIAlertAction) in print("action pressed \(action.title ?? "")")
        }
        
        //destructive: 삭제를 한다거나 되돌릴 수 없는 동작을 할 때
        let someAction: UIAlertAction
        someAction = UIAlertAction(title: "Some", style: UIAlertAction.Style.destructive, handler: handler)
        
        let anotherAction: UIAlertAction
        anotherAction = UIAlertAction(title: "Another", style: UIAlertAction.Style.default, handler: handler)
        
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        //텍스트필드 추가
        alertController.addTextField { (field: UITextField) in
            field.placeholder = "입력해주세요"
            field.textColor = UIColor.red
        }
        
        
        //모달이 올라오는 애니메이션이 끝나고 바로 직후에 나올 녀석
        self.present(alertController, animated: true, completion:  {
            print("Alert controller shown")
        })
    }
}

