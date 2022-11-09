//
//  CoreDataManager.swift
//  DictionaryWithTolga
//
//  Created by Talip on 2.11.2022.
//

import CoreData

final class CoreDataManager {
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    func insert(name: String, meaning: String) -> Word {
        let word = Word(context: container.viewContext)
        word.name = name
        word.meaning = meaning
        
        do {
            try container.viewContext.save()
        } catch {
            print(error)
        }
        
        return word
    }
    
    func fetch() -> [Word] {
        let request = NSFetchRequest<Word>(entityName: "Word")
        
        var result: [Word] = []
        
        do {
            result = try container.viewContext.fetch(request)
        } catch {
            print(error)
        }
        return result
    }
}

