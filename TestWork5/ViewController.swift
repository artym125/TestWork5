//
//  ViewController.swift
//  TestWork5
//
//  Created by Ostap Artym on 18.01.2023.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionMain]
}

enum SettingsOptionMain {
    case accountCell(model: SettingsAccountOption)
    case generalCell(model: SettingsOption)
    case buttonCell(model: SettingsButtonOption)
}

struct SettingsAccountOption {
    let icon: UIImage?
    let fullName: String
    let emailAddress: String
    let iconBackgroundColor: UIColor?
    
}

struct SettingsButtonOption {
    let icon: UIImage?
    let title: String
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor?
//    let handler: (() -> Void)
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SettingAccountTableViewCell.self,
                       forCellReuseIdentifier: SettingAccountTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()
    
    
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
        models.append(Section(title: "UserAccount", options: [
            .accountCell(model: SettingsAccountOption(icon: #imageLiteral(resourceName: "Account Photo"), fullName: "Ostap Artym", emailAddress: "otapik@icloud.com", iconBackgroundColor: nil))  ]))
        
        models.append(Section(title: "General", options: [
            .generalCell(model: SettingsOption(title: "Recommendations", icon: UIImage(systemName: "bolt"), iconBackgroundColor: .systemBlue)),
            
                .generalCell(model: SettingsOption(title: "Achievements", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link)),
            
                .generalCell(model: SettingsOption(title: "Sleep timer", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen)),
            
                .generalCell(model: SettingsOption(title: "Appearance", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemRed))
        ]))
        
        //        models.append(Section(title: "Aditional", options: [
        //            SettingsOption(title: "Share", icon: UIImage(systemName: "bolt"), iconBackgroundColor: .systemBlue){
        //
        //            },
        //            SettingsOption(title: "Rate us", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link){
        //
        //            },
        //            SettingsOption(title: "Privacy Policy", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen){
        //
        //            }
        //        ]))
        //
        //        models.append(Section(title: "BugSetting", options: [
        //            SettingsOption(title: "Report a bug", icon: UIImage(systemName: "bolt"), iconBackgroundColor: .systemBlue){
        //
        //            }
        //        ]))
        //
        //        models.append(Section(title: "Button", options: [
        //            SettingsOption(title: "Music Premium", icon: UIImage(systemName: "bolt"), iconBackgroundColor: .systemBlue){
        //
        //            }
        //        ]))
        //
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .accountCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingAccountTableViewCell.identifier,
                for: indexPath
            ) as? SettingAccountTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .generalCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .buttonCell(let model):
            return UITableViewCell()
        }
//        return UITableViewCell()
        
        //      guard let cell = tableView.dequeueReusableCell(
        //            withIdentifier: SettingTableViewCell.identifier,
        //            for: indexPath
        //        ) as? SettingTableViewCell else {
        //            return UITableViewCell()
        //        }
        //        cell.configure(with: model)
        //        return cell
        //    }
        
        
    }
    
}
