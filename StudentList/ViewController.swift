//
//  ViewController.swift
//  StudentList
//
//  Created by John Gallaugher on 2/25/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var students = ["Cameron Arrigo",
                    "Brandon Bisbano",
                    "Lindsay Braun",
                    "Timothy Burns",
                    "Andrew Cappel",
                    "James Cassidy",
                    "Henry Chen",
                    "Daniel Cizmarik",
                    "John Connolly",
                    "Michael Cornet",
                    "Christopher Donnelly",
                    "Alessandra Escalante",
                    "Andrew Evangelista",
                    "Sanwood Gim",
                    "Xinran Gu",
                    "Anna Guo",
                    "Annika Hall",
                    "Hongyi He",
                    "Kenyan Houck",
                    "Xiaoyu Hu",
                    "Alex Karacaoglu",
                    "Michael Kelley",
                    "Donghyuk Kim",
                    "Sarah Kim",
                    "Christopher Knapp",
                    "Thomas Kotopoulos",
                    "Mark Lee",
                    "Jack Leetch",
                    "Richard Li",
                    "Jiaxin Liang",
                    "Kejun Liu",
                    "Blake Mazzaferro",
                    "Alberto Medina",
                    "Joseph Parks",
                    "Kelly Pickreign",
                    "Thomas Ronan",
                    "Jun Shan",
                    "James Steele",
                    "Jason Tee",
                    "Jianxin Wang",
                    "Tion Wong",
                    "Victoria Wong",
                    "Timothy Yang",
                    "David Yepez",
                    "Eric Zhou"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStudentDetail" {
            let destination = segue.destination as! StudentDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.student = students[selectedIndexPath.row]
        } else {
            if let selectedPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedPath, animated: true)
            }
        }
    }
    
    @IBAction func unwindFromStudentDetailViewController(segue: UIStoryboardSegue) {
        let source = segue.source as! StudentDetailViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            students[selectedIndexPath.row] = source.student
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: students.count, section: 0)
            students.append(source.student)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
            tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("👊👊 numbertOfRowsInSecgtion was just called and ther are \(students.count) rows in the tableView")
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row]
        print("👍 Dequeing the table view cell for indexPath.row = \(indexPath.row) where the cell contains item \(students[indexPath.row])")
        return cell
    }
    
    
}

