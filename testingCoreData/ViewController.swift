//
//  ViewController.swift
//  testingCoreData
//
//  Created by adria on 26/02/2019.
//  Copyright © 2019 adria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tomPerson = CoreDataManager.shared.createPerson(name: "Tom", age: "30")
        CoreDataManager.shared.createRoom(person: tomPerson.0!)
        
        // let bradPerson = CoreDataManager.shared.createPerson(name: "Brad", age: "27")
        // CoreDataManager.shared.createRoom(person: bradPerson)
    }


}

