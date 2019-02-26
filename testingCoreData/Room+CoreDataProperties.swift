//
//  Room+CoreDataProperties.swift
//  testingCoreData
//
//  Created by adria on 26/02/2019.
//  Copyright © 2019 adria. All rights reserved.
//
//

import Foundation
import CoreData


extension Room {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Room> {
        return NSFetchRequest<Room>(entityName: "Room")
    }

    @NSManaged public var persons: [Person]? // Array of entity "Person" in the room.

}
