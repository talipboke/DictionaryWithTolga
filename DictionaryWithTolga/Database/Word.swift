//
//  Word.swift
//  DictionaryWithTolga
//
//  Created by Talip on 2.11.2022.
//

import Foundation
import CoreData

@objc(Word)
class Word: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var meaning: String
}
