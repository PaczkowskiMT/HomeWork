//
//  StudentsViewController.swift
//  Student List, table view
//
//  Created by Михаил on 19.11.21.
//

import UIKit

class StudentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellID = "cellID"
    var dataSource = [["Aртимович Игорь Владимирович",
                          "Богданович Дмитрий Александрович",
                          "Гришин Павел Андреевич",
                          "Куклицкий Максим Сергеевич",
                          "Лапин Николай Владимирович",
                          "Малишевский Никита Валерьевич",
                          "Матвеенко Сергей Александрови",
                          "Мостовой Алексей Алексеевич",
                          "Пачковский Михаил Тадеушевич",
                          "Савков Александр Геннадьевич",
                          "Симонов Владислав Дмитриевич",
                         "Сысов Валерий Александрович"],
                          ["Елисеева Марина Михайловна",
                         "Букаренко Арина Олеговна",
                         "Ефименко Анастасия Владимировна",
                         "Пернацкая Алеся Юрьевна",
                         "Сандова Галина Александровна"
        ]]
    var maleOrFemale = ["MALE",
                        "FEMALE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
extension StudentsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return dataSource.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.maleOrFemale
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.textLabel!.text = dataSource[indexPath.row]
        return cell!
    }
        
    }
