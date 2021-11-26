//
//  StudentsViewController.swift
//  Student List, table view
//
//  Created by Михаил on 19.11.21.
//

import UIKit

class StudentsViewController: UIViewController {
 
    @IBAction func view(_ sender: UIButton) {
        performSegue(withIdentifier: "TappedOpen", sender: self)
    }
    @IBOutlet weak var tableView: UITableView!
    
    var male = ["Aртимович Игорь Владимирович",
                "Богданович Дмитрий Александрович",
                "Гришин Павел Андреевич",
                "Ефименко Анастасия Владимировна",
                "Куклицкий Максим Сергеевич",
                "Лапин Николай Владимирович",
                "Малишевский Никита Валерьевич",
                "Матвеенко Сергей Александрови",
                "Мостовой Алексей Алексеевич",
                "Пачковский Михаил Тадеушевич",
                "Савков Александр Геннадьевич",
                "Симонов Владислав Дмитриевич",
                "Сысов Валерий Александрович",
    ].sorted()
    
    var female = ["Букаренко Арина Олеговна",
                  "Пернацкая Алеся Юрьевна",
                  "Сандова Галина Александровна",
                  "Елисеева Марина Михайловна",
    ].sorted()
    
    var filteredMale: [String] = []
    var filteredFemale: [String] = []
    var dataSource: [[String]] {
        [filteredMale, filteredFemale]
    }
    
    var filterText: String? {
        didSet {
            if let filterText = filterText {
                filterDataSource(filterText)
            } else {
                resetDataSource()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.keyboardDismissMode = .onDrag
        filterText = nil
    }
    
    func resetDataSource () {
        filteredMale = male
        filteredFemale = female
        tableView.reloadData()
    }
    
    func filterDataSource(_ filterText: String) {
        if filterText.count > 0 {
            filteredMale = male.filter {
                $0.lowercased().contains(filterText.lowercased())
            }
            
            filteredFemale = female.filter {
                $0.lowercased().contains(filterText.lowercased())
            }
            
            tableView.reloadData()
        } else {
            resetDataSource()
        }
    }
}

extension StudentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionName: String = ""
        switch section {
        case 0: sectionName = "Male"
        case 1: sectionName = "Female"
        default: break
        }
        return "\(sectionName) \(dataSource[section].count) persons"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        cell.label.text = dataSource[indexPath.section][indexPath.row]
        
        return cell
    }
}

extension StudentsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterText = searchText
    }
}
