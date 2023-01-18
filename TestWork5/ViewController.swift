//
//  ViewController.swift
//  TestWork5
//
//  Created by Ostap Artym on 18.01.2023.
//

import UIKit

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        return table
    }()

    var models = [SettingsOption]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        
        
        tableView.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.1882352941, blue: 0.1921568627, alpha: 1)
        
    }
    
    func configure() {
        self.models = Array(0...100).compactMap({
            SettingsOption(title: "Рядок налаштування \($0)", icon: UIImage(systemName: "bolt"), iconBackgroundColor: .systemGreen){
                
            }
        })
    }
        
                                                
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
      guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingTableViewCell.identifier,
            for: indexPath
        ) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }


}

