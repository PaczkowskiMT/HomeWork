//
//  StudentManager.swift
//  StudentList
//
//  Created by Михаил on 7.12.21.
//

import Foundation

class StudentManager {
    let userDefaults = UserDefaults.standard
    
    func saveData(menList: [String]?, womenList: [String]? ) {
        saveMenList(menList)
        saveWomenList(womenList)
    }
    
    private func saveMenList(_ menList: [String]?) {
        userDefaults.set(menList, forKey: "MenList")
    }
    
    private func saveWomenList(_ womenList: [String]?) {
        userDefaults.set(womenList, forKey: "WomenList")
    }
    
    func readMenList() -> [String] {
        if let menList = userDefaults.object(forKey: "MenList") as? [String] {
            return menList
        }
        
        return []
    }
    
    func readWomenList() -> [String] {
        if let womenList = userDefaults.object(forKey: "WomenList") as? [String] {
            return womenList
        }
        
        return []
    }
    
}
