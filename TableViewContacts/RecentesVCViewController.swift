//
//  RecentesVCViewController.swift
//  TableViewContacts
//
//  Created by Lucia Rigoni Freire on 03/02/23.
//

import UIKit

class RecentesVCViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var calls = ["0303 000 0002", "0800 775-1212", "0800 000 9090", "0303 000 0002", "0800 775-1212", "0800 000 9090", "0303 000 0002", "0800 775-1212", "0800 000 9090", "0303 000 0002", "0800 775-1212", "0800 000 9090","0303 000 0002", "0800 775-1212", "0800 000 9090", "0303 000 0002", "0800 775-1212", "0800 000 9090", "0303 000 0002", "0800 775-1212", "0800 000 9090", "0303 000 0002", "0800 775-1212", "0800 000 9090", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension RecentesVCViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = calls[indexPath.row]
        return cell
    }
    
    
}
