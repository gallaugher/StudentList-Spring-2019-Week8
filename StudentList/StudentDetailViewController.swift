//
//  StudentDetailViewController.swift
//  StudentList
//
//  Created by John Gallaugher on 2/25/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {
    @IBOutlet weak var studentNameTextField: UITextField!
    
    var student: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if student == nil {
            student = ""
        }
        studentNameTextField.text = student
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            student = studentNameTextField.text
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
    }
}
