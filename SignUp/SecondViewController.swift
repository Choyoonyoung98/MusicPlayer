//
//  SecondViewController.swift
//  SignUp
//
//  Created by 조윤영 on 20/12/2019.
//  Copyright © 2019 조윤영. All rights reserved.
//

/*
 func viewDidLoad()
 뷰 계층이 메모리에 로드된 직후 호출되는 메서드
 뷰의 추가적인 초기화 작업을 하기 좋은 시점
 메모리에 처음 로딩 될때 1회 호출되는 메서드로, 메모리 경고로 뷰가 사라지지 않는 이상 다시 호출되지 않음
 
 func viewWillAppear(_ animated: Bool)
 뷰가 뷰 계층에 추가되고 화면이 표시되기 직전에 호출되는 메서드
 뷰의 추가적인 초기화 작업을 하기 좋은 시점
 다른 뷰로 이동했다가 되돌아오면 재호출되는 메서드로, 화면이 나타날때마다 수행해야하는 작업을 하기 좋은 시점
 
 func viewDidAppear(_ animated: Bool)
 뷰가 뷰 계층에 추가되어 화면이 표시되면 호출되는 메서드
 뷰를 나타내는 것과 관련된 추가적인 작업을 하기 좋은 시점
 
 func viewWillDisappear(_ animated: Bool)
 뷰가 뷰 계층에서 사라지기 직전에 호출되는 메서드
 뷰가 생성된 뒤 발생한 변화를 이전상태로 되돌리기 좋은 시점
 
 func viewDidDisappear(_ animated: Bool)
 뷰가 뷰 계층에서 사라진 후 호출되는 메서드
 뷰를 숨기는 것과 관련된 추가적인 작업을 하기 좋은 시점
 시간이 오래 걸리는 작업은 하지 않는 것이 좋음
 */

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondviewController의 view가 메모리에 로드 됨")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondviewController의 view가 화면에 보여질 예정")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondviewController의 view가 화면에 보여짐")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondviewController의 view가 화면에서 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondviewController의 view가 화면에서 사라짐")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("SecondviewController의 view가 subview를 레이아웃 하려함")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("SecondviewController의 view가 subview를 에이아웃 함")
    }
    

    @IBAction func popToPrev(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissModal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
