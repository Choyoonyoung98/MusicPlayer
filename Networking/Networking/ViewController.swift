//
//  ViewController.swift
//  Networking
//
//  Created by 조윤영 on 21/12/2019.
//  Copyright © 2019 조윤영. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var friends: [Friend] = []
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier:String = "friendCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRecieveFriendsNotification(_:)
            ), name: DidReceiveFriendsNotification, object: nil)
    }
    
    @objc func didRecieveFriendsNotification(_ noti: Notification ) {

        
        guard let friends: [Friend] = noti.userInfo?["friends"] as? [Friend] else {return}
        
        self.friends = friends
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requestFriends()
//        //아래의 url에 요청을 할 것이다.
//        guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else {
//            return
//        }
//
//        let session: URLSession = URLSession(configuration: .default)
//        let dataTask: URLSessionDataTask = session.dataTask(with: url) {
//            (data: Data?, response: URLResponse?, error: Error?) in
//            if let error = error {//서버에서 응답이 왔을 때 처리하는 클로저
//                //당장 실행할 것이 아니라 요청에 대한 응답이 왔을 때만 실행시키는 아이
//                print(error.localizedDescription)
//                return
//            }
//
//            guard let data = data else {return}
//
//            //JSON decoder를 통해 APIResponse 형태로 가져온다.
//            do {
//                let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
//                //데이터 넣어주고
//                self.friends = apiResponse.results
//                //리로드 해준다.-> 근데 이거 메인 스레드에서 처리해야하잖아?
//                //하지만 네트워킹 이후 많은 양의 데이터를 처리해야할 수도 있기 때문에 백그라운드에서 처리하는 것
//
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            } catch(let err) {
//                print(err.localizedDescription)
//            }
//        }
//
//        //dataTask를 실행하고 서버에 요청을 하게 된다
//        dataTask.resume()
//
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name.full
        cell.detailTextLabel?.text = friend.email
        cell.imageView?.image = nil

        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: friend.picture.thumbnail) else {
                return
            }
            guard let imageData: Data = try? Data(contentsOf: imageURL) else {
                return
            }
            //이미지 셋팅만큼은 메인에서 실행하자!
            DispatchQueue.main.async {
                if let index: IndexPath = tableView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.imageView?.image = UIImage(data: imageData)
                    }
                }
            }
        }
        return cell
    }
    //동기 비동기 문제 처리


}

