//
//  ViewController.swift
//  TableViewContacts
//
//  Created by Lucia Rigoni Freire on 03/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var field: UITextField!
    
    var names = ["Aaron Shust", "Abigail Breslin", "Adam Lambert", "Adam Hambrick", "Alban Berg", "Anderson East", "Andraé Crouch", "Aled Jones", "Andrew Stockdale", "Alessia Cara", "Alex Day", "Andy Grammer", "Angélique Kidjo", "Anise K", "Anita Harris", "August Rigo", "Avril Lavigne", "Aaron Shust", "Abigail Breslin", "Adam Lambert", "Adam Hambrick", "Alban Berg", "Anderson East", "Andraé Crouch", "Aled Jones", "Andrew Stockdale", "Alessia Cara", "Alex Day", "Andy Grammer", "Mary Green", "Bruno Mars", "Lana Del Rey", "Lorde", "B.B. King", "Bobby Bland", "Nina Simone", "Norah Jones", "José Carreras", "Christina Aguilera", "Jennifer Lopez", "Lady Gaga", "Miley Cyrus", "Madonna"]
    
    var filteredData = [String]()
    var filtered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        field.delegate = self
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if let text = textField.text {
            filterText(text)
        }
    }
    
    func filterText (_ query: String?) {
        guard let query = query else { return }
        filteredData.removeAll()
        for string in names {
            if string.lowercased().starts(with: query.lowercased()) {
                filteredData.append(string)
            }
        }
        tableView.reloadData()
        filtered = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hi")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty {
            return filteredData.count
        }
        return filtered ? 0 : names.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if !filteredData.isEmpty {
            cell.textLabel?.text = filteredData[indexPath.row]

        } else {
            cell.textLabel?.text = names[indexPath.row]
        }
        return cell
    }
}

extension ViewController: UITextFieldDelegate {
    
}

