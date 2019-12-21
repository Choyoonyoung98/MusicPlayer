//
//  ViewController.swift
//  AsyncExample
//
//  Created by 조윤영 on 21/12/2019.
//  Copyright © 2019 조윤영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpDownloadButton(_ sender: Any) {
        //이미지 다운로드 -> 이미지 뷰에 셋팅
        //http://eskipaper.com/images/large-2.jpg
        let imageURL: URL = URL(string: "http://eskipaper.com/images/large-2.jpg")!

        //백그라운드와 메인스레드 왔다갔다
        OperationQueue().addOperation {
            let imageData: Data = try! Data.init(contentsOf: imageURL) //동기 메서드 - 이 메서드 동작이 끝날 때까지 아무것도 못함
            let image: UIImage = UIImage(data: imageData)!
            
            OperationQueue.main.addOperation {
                self.imageView.image = image//UI에 미치는 코드는 메인 스레드에서 동작해야한다.
            }
            
        }
    }
}

