//
//  StudentsViewController.swift
//  Student List, table view
//
//  Created by Михаил on 19.11.21.
//

import UIKit

class StudentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellIDMale = "cellID"
    let cellIDFemale = "cellIDFemale"
    var dataSource = ["Aртимович Игорь Владимирович",
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
        ]
    var femaleDataSource = ["Букаренко Арина Олеговна",
                            "Пернацкая Алеся Юрьевна",
                            "Сандова Галина Александровна",
                            "Елисеева Марина Михайловна",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
extension StudentsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return dataSource.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return "Male"
    }
    private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIDMale)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIDMale)
        }
        cell?.textLabel!.text = dataSource[indexPath.row]
        return cell!
    }
    }
extension StudentsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return femaleDataSource.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return "Female"
    }
    private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIDFemale)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIDFemale)
        }
        cell?.textLabel!.text = dataSource[indexPath.row]
        return cell!
    }
    }
