//
//  CoreDataManager.swift
//  testingCoreData
//
//  Created by adria on 26/02/2019.
//  Copyright © 2019 adria. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager() // will live forever as long as your application is still alive, it's properties will too.
    let persistentContainer: NSPersistentContainer = {
        let regularContainer = NSPersistentContainer(name: "testingCoreData")
        regularContainer.loadPersistentStores(completionHandler: { (persistentStoreDescription, error) in
            if let error = error {
                fatalError("Loading of store failed: \(error)")
            }
        })
        return regularContainer
    }()
    
    func setCurrentRoom(person: Person) -> (CurrentRoom?, Error?) {
        let managedObjectContext = persistentContainer.viewContext
        let currentRoom = NSEntityDescription.insertNewObject(forEntityName: "CurrentRoom", into: managedObjectContext) as! CurrentRoom
        
        if currentRoom.roomID == nil {
            let room = createRoom(person: person)
            print(room)
        } else {
            // add to already created Room.
        }
        
        do {
            try managedObjectContext.save()
            return (currentRoom, nil)
        } catch let saveError {
            print("Failed to create currentRoom:", saveError)
            return (nil, saveError)
        }
    }
    func createRoom(person: Person) -> (Room?, Error?) {
        let managedObjectContext = persistentContainer.viewContext
        let roomEntity = NSEntityDescription.entity(forEntityName: "Room", in: managedObjectContext)
        let room = Room(entity: roomEntity!, insertInto: managedObjectContext)
        
        var persons = [Person]()
        persons.append(person)
        
        room.number = "Number 101"
        room.persons = persons
        
        do {
            try managedObjectContext.save()
            return (room, nil)
        } catch let saveError {
            print("Failed to create room:", saveError)
            return (nil, saveError)
        }
    }
    func createPerson(name: String, age: String) -> (Person?, Error?) {
        let managedObjectContext = persistentContainer.viewContext
        let person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: managedObjectContext) as! Person
        
        // person.setValue(name, forKey: "name")
        person.name = name
        person.age = age
        
        do {
            try managedObjectContext.save()
            return (person, nil)
        } catch let saveError {
            print("Failed to create person:", saveError)
            return (nil, saveError)
        }
    }
}
