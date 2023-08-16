//
//  ViewController.swift
//  petOne
//
//  Created by Владимир on 15.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -Outlet
    let identifire = "myCell"
    @IBOutlet weak var mainTableView: UITableView!
   

    //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView(mainTableView)
        delNilforArray()
        print(mainArray)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainTableView.reloadData()
    }
    
    
    //MARK: -Metods
    
    func settingsTableView(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func editViewTable(_ sender: UIBarButtonItem) {
        mainTableView.isEditing = !mainTableView.isEditing
    }
    
    
    func delNilforArray() {
        if mainArray[0] == [nil, nil] {
            mainArray.remove(at: 0)
        }
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mainArray.remove(at: indexPath.row)
            mainTableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    //move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = mainArray[sourceIndexPath.row]
        mainArray.remove(at: sourceIndexPath.row)
        mainArray.insert(item, at: destinationIndexPath.row)
    }
}


//MARK: -Extension

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifire)
        
        if mainArray[indexPath.row] == [nil, nil]{
            mainArray.remove(at: indexPath.row)
            print(mainArray)
        }
        if mainArray.count > 0 {
            cell.detailTextLabel?.numberOfLines = 3
            cell.detailTextLabel?.lineBreakMode = .byWordWrapping
            cell.textLabel?.text = mainArray[indexPath.row][0]
            cell.detailTextLabel?.text = mainArray[indexPath.row][1]
        }
        return cell
    }
   
}

