//
//  Request.swift
//  Networking
//
//  Created by 조윤영 on 21/12/2019.
//  Copyright © 2019 조윤영. All rights reserved.
//

import Foundation

let DidReceiveFriendsNotification: Notification.Name = Notification.Name("DidReceiveFriends")

func requestFriends() {
    
    //아래의 url에 요청을 할 것이다.
    guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else {
        return
    }
    
    let session: URLSession = URLSession(configuration: .default)
    let dataTask: URLSessionDataTask = session.dataTask(with: url) {
        (data: Data?, response: URLResponse?, error: Error?) in
        if let error = error {//서버에서 응답이 왔을 때 처리하는 클로저
            //당장 실행할 것이 아니라 요청에 대한 응답이 왔을 때만 실행시키는 아이
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else {return}
        
        //JSON decoder를 통해 APIResponse 형태로 가져온다.
        do {
            let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            
            NotificationCenter.default.post(name:DidReceiveFriendsNotification, object: nil, userInfo: ["friends":apiResponse.results])

        } catch(let err) {
            print(err.localizedDescription)
        }
    }
    
    //dataTask를 실행하고 서버에 요청을 하게 된다
    dataTask.resume()
    
}
