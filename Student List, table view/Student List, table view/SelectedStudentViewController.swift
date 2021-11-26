//
//  SelectedStudentViewController.swift
//  Student List, table view
//
//  Created by Михаил on 26.11.21.
//

import UIKit

class SelectedStudentViewController: UIViewController {
    @IBOutlet weak var selectButton: UIButton!
    
    @IBAction func selectButtonTapped (_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StudentsViewController") as! StudentsViewController vc.delegate = self
        
        present(vc, animated: true, completion: nil)
    }
    }
    
extension SelectedStudentViewController: StudentRenameButton {
    
    func didSelectStudent(_ student: String) {
        selectButton.setTitle(student, for: .normal)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
