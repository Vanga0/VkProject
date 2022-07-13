//
//  MyTableViewController.swift
//  VkBootcampAlbertyan
//
//  Created by Vagan Albertyan on 12.07.2022.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    var serviceList:[ResultItem] = [ResultItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJsonData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return serviceList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell?.textLabel?.text = serviceList[indexPath.row].name
//        cell?.imageView?.image = UIImage(named:serviceList[indexPath.row].icon_url)
        cell?.detailTextLabel?.text = serviceList[indexPath.row].description
//        cell?.url?.link = serviceList[<#Int#>]
        return cell!
    }
    func fetchJsonData()
    {
        guard let fileLocation = Bundle.main.url(forResource: "JsonVK", withExtension: "json")
        else{
            return
        }
        do{
            let data = try Data(contentsOf: fileLocation)
            let recievedData = try JSONDecoder().decode([ResultItem].self, from: data)

            self.serviceList = recievedData

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            print("Error")
        }

    }
//    func fetchJson(){
//
//    let JSON = """
//
//    """
//
//    let jsonData = JSON.data(using: .utf8)!
//        let blogPost: Jsoner = try! JSONDecoder().decode(Jsoner.self, from: jsonData)
//
//        print(blogPost.body.services) // Prints: "Optionals in Swift explained: 5 things you should know"
//
//
//    }
//
}


