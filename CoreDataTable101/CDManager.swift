//
//  CDManager.swift
//  CoreDataTable101
//
//  Created by Muhammad Tafani Rabbani on 11/08/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit
import CoreData

struct DataModel{
    var name : String
    var id : NSManagedObjectID
}

class CDManager:NSObject{
    
    var appDel = UIApplication.shared.delegate as! AppDelegate
    var listData : [DataModel] = []
    
    override init() {
        super.init()
        readData()
    }
    
    
    func saveData(name:String){
        let context = appDel.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "DataTable", into: context)
        entity.setValue(name, forKey: "name")
        do{
            try context.save()
        }catch{
            print(error)
        }
        readData()
    }
    
    func readData(){
        let context = appDel.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DataTable")
        
        do{
            let result = try context.fetch(request)
            if result.count < 0{
                listData = []
            }else{
                for item in result as! [NSManagedObject]{
                    if let itemName = item.value(forKey: "name"){
                        listData.append(DataModel(name: itemName as! String, id: item.objectID))
                    }
                    
                }
            }
        }
        catch{
            print(error)
        }
        
    }
    
    func updateData(id:NSManagedObjectID,newName:String){
        let context = appDel.persistentContainer.viewContext
        let entity = context.registeredObject(for: id)
        entity?.setValue(newName, forKey: "name")
        do{
            try context.save()
        }catch{
            print(error)
        }
    }
    
    func deleteData(id:NSManagedObjectID){
        let context = appDel.persistentContainer.viewContext
        if let entity = context.registeredObject(for: id){
            context.delete(entity)
            do{
                try context.save()
            }catch{
                print(error)
            }
        }
    }
}
