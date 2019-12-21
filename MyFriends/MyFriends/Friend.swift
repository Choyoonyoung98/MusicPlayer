//
//  Friend.swift
//  MyFriends
//
//  Created by 조윤영 on 21/12/2019.
//  Copyright © 2019 조윤영. All rights reserved.
//

import Foundation
/*
 
 */
struct Friend: Codable{
    
    struct Address: Codable {
        let country: String
        let city: String
    }
    
    let name: String
    let age: Int
    let addressInfo: Address
    
    var nameAndAge: String {
        return self.name  + "(\(self.age))"
    }
    
    var fullAddress: String {
        return self.addressInfo.city + "," + self.addressInfo.country
    }
    
    //json에서 받은 데이터 이름 바꿀 수 있다 이렇게
    enum CodingKeys: String, CodingKey {
        case name, age
        case addressInfo = "address_info"
    }
}
