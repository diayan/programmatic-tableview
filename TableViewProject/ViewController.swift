//
//  ViewController.swift
//  TableViewProject
//
//  Created by diayan siat on 09/10/2020.
//  Copyright © 2020 Diayan Siat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    
    var countries = [String]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Countries"
        
        tableView.dataSource = self
        
        safeArea = view.layoutMarginsGuide
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "countryname")
        
        loadFlags()
        
    }
    
    func loadFlags() {
        
        let fm = FileManager.default
        
        let path = Bundle.main.resourcePath!
        let flags = try! fm.contentsOfDirectory(atPath: path)
        
        for flag in flags {
            if flag.hasSuffix("png") {
                countries.append(flag)
            }
        }
        
        countries.sort()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryname", for: indexPath)
        let countryName = (countries[indexPath.row] as NSString).deletingPathExtension
        cell.textLabel?.text = countryName
        cell.imageView?.image = UIImage(imageLiteralResourceName: countries[indexPath.row])
        return cell
        
        
    }
}


