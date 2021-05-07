//
//  InitialViewController.swift
//  Quicklook-Demo
//
//  Created by Ameer Hamza on 07/05/2021.
//

import UIKit

class InitialViewController: UIViewController {

    let imagesName = ["Wheel Barrow", "Chair"]
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Quicklook Demo"

    }
}

//MARK: - Table View
extension InitialViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesName.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? InitialTableViewCell else {
            return UITableViewCell()
        }
        
        cell.lblTitle.text = imagesName[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController{
            vc.modelName = ReturnModelName(name: imagesName[indexPath.row])
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func ReturnModelName(name: String) -> String{
        var modelName = String()
        switch name {
        case "Wheel Barrow":
            modelName = "wheelbarrow"
            break
        case "Chair":
            modelName = "redchair"
            break
        default:
            break
        }
        return modelName
    }
}

