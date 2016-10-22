//
//  Service.swift
//  VolunteerWebsites
//
//  Created by Zoe on 10/5/16.
//  Copyright © 2016 Zoe. All rights reserved.
//

import UIKit

class Service {
    let name: String
    let url: NSURL
    let email: String
    let phone: String
    let address: String
    let tag: String
    
    init(name: String, urlString: String, email: String, phone: String, address: String, tag: String) {
        self.name = name
        
        let url = NSURL(string: urlString)
        if url != nil {
            self.url = url!
        } else {
            self.url = NSURL(string: "http://desc.org/")!
        }
        
        self.email = email
        self.phone = phone
        self.address = address
        self.tag = tag
    }
    
    
    
    
}
