//
//  StudentsViewController.swift
//  Student List, table view
//
//  Created by Михаил on 19.11.21.
//

import UIKit

class StudentsViewController: UITableViewController {

    let data = [["Aртимович Игорь Владимирович",
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
                ],
   ["Букаренко Арина Олеговна",
                            "Пернацкая Алеся Юрьевна",
                            "Сандова Галина Александровна",
                            "Елисеева Марина Михайловна",
   ]]
    let sex: Array<String> = ["Male", "Female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sex.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data [section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sex[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt section: Int) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: data[[String?]])
        cell.textLabel?.text = data
        return cell
    }


}


