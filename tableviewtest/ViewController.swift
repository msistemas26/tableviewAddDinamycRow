//
//  ViewController.swift
//  tableviewtest
//
//  Created by Raul Humberto Mantilla Assia on 10/30/18.
//  Copyright © 2018 rmantilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.addNewRow), userInfo: nil, repeats: true)
    }
    
    @objc func addNewRow() {
        generateMessages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    var tableObjects: [String] = []
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    private func generateMessages() {
        let message = "Hola"
        self.tableObjects.append(message)
        self.tableView.beginUpdates()
        let indexPath = IndexPath(row: self.tableObjects.count - 1, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .top)
        self.tableView.endUpdates()
        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.objectAtIndexPath(indexPath)
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        }
        
        cell?.textLabel?.text = row
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableObjects.count
    }
    
    func objectAtIndexPath(_ indexPath: IndexPath) -> String {
        return self.tableObjects[indexPath.row]
    }

}

