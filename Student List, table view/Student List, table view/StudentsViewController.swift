//
//  StudentsViewController.swift
//  Student List, table view
//
//  Created by Михаил on 19.11.21.
//

import UIKit

protocol StudentsViewControllerDelegate: AnyObject{
    func didSelectStudent(_ student: String)
}

class StudentsViewController: UIViewController {
    
    private lazy var tableView = UITableView()
    private lazy var selectButton = UIButton(type: .custom)
    private lazy var searchBar = UISearchBar()
    
    var shouldAddSelectButton = false
    var shouldAddSearchBar = false
    
    weak var delegate: StudentsViewControllerDelegate?
    
    var male: [String] = []
    var female: [String] = []
    
    private var filteredMale: [String] = []
    private var filteredFemale: [String] = []
    
    private var dataSource: [[String]] {
        [filteredMale, filteredFemale]
    }
    
    private var filteredText: String? {
        didSet {
            reloadFilterData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        reloadFilterData()
    }
    
    private func setup() {
        if shouldAddSearchBar {
            setupSearchBar()
        }
        
        if shouldAddSelectButton {
            setupSelectButton()
        }
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.keyboardDismissMode = .onDrag
        tableView.register(StudentCell.self, forCellReuseIdentifier: "StudentCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: shouldAddSearchBar ? searchBar.bottomAnchor : view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: shouldAddSelectButton ? selectButton.topAnchor : view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupSelectButton() {
        selectButton.setTitle("Select a student", for: .normal)
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectButton)
        
        NSLayoutConstraint.activate([
            selectButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            selectButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        selectButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func reloadFilterData(shouldReloadTableView: Bool = true) {
        if let filterText = filterText {
            filterDataSource(filterText)
        } else {
            resetDataSource()
        }
        
        if shouldReloadTableView {
            tableView.reloadData()
        }
    }
    
    private func resetDataSource() {
        filteredMale = male
        filteredFemale = female
    }
    
    private func filterDataSource(_ filterText: String) {
        if filterText.count > 0 {
            filteredMale = male.filter {
                $0.lowercased().contains(filterText.lowercased())
            }
            
            filteredFemale = female.filter {
                $0.lowercased().contains(filterText.lowercased())
            }
        } else {
            resetDataSource()
        }
    }
    
    private func presentAlertForStudent(_ student: String, in viewController: UIViewController) {
        let alertVC = UIAlertController(title: "Error", message: "Student \(student) already exists", preferredStyle: .alert)
        
        alertVC.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        viewController.present(alertVC, animated: true, completion: nil)
    }
    
    //MARK: - IBActions
    
    @objc private func selectButtonTapped() {
        let viewController = StudentsViewController()
        viewController.shouldAddSelectButton = false
        viewController.shouldAddSearchBar = true
        viewController.male = DataSource.menArray
        viewController.female = DataSource.womenArray
        
        viewController.delegate = self
        
        present(viewController, animated: true)
    }
}

extension StudentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if dataSource[section].count == 0 {
            return nil
        }
        
        var sectionName: String = ""
        switch section {
        case 0: sectionName = "Мужчины"
        case 1: sectionName = "Женщины"
        default: break
        }
        return "\(sectionName) \(dataSource[section].count) человек"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        cell.nameLabel.text = dataSource[indexPath.section][indexPath.row]
        
        return cell
    }
}

extension StudentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectStudent(dataSource[indexPath.section][indexPath.row], gender: indexPath.section, sender: self)
        }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return shouldAddSelectButton
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let nameToDelete = dataSource[indexPath.section][indexPath.row]
        if editingStyle == .delete {
            if indexPath.section == 0 {
                if let index = male.firstIndex(of: nameToDelete) {
                    male.remove(at: index)
                }
            } else {
                if let index = female.firstIndex(of: nameToDelete) {
                    female.remove(at: index)
                }
            }
            
            reloadFilterData(shouldReloadTableView: false)
            
            tableView.performBatchUpdates({
                tableView.deleteRows(at: [indexPath], with: .fade)
            }, completion: { finished in
                tableView.reloadData()
            })
        }
    }
}

extension StudentsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterText = searchText
    }
}

extension StudentsViewController: StudentViewControllerDelegate {
    func didSelectStudent(_ student: String, gender: Int, sender: UIViewController) {
        
        var alreadyExist = false
        
        if gender == 0 {
            if male.contains(student) {
                alreadyExist = true
            }
        } else {
            if female.contains(student) {
                alreadyExist = true
            }
        }
        
        if alreadyExist {
            presentAlertForStudent(student, in: sender)
            return
        }
        
        sender.dismiss(animated: true, completion: nil)
        
        if gender == 0 {
            male.append(student)
        } else {
            female.append(student)
        }
        
        reloadFilterData()
    }
}
