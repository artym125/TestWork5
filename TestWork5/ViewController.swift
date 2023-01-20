//
//  ViewController.swift
//  TestWork5
//
//  Created by Ostap Artym on 18.01.2023.
//

import UIKit


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
            .accountCell(model: SettingsAccountOption(icon: #imageLiteral(resourceName: "Account Photo"), fullName: "Lin See", emailAddress: "Lin.See@gmail.com", iconBackgroundColor: nil))  ]))
        
        models.append(Section(title: "General", options: [
            .generalCell(model: SettingsOption(title: "Recommendations", icon: #imageLiteral(resourceName: "Vector"), iconBackgroundColor: #colorLiteral(red: 0.7860522866, green: 0.2779248953, blue: 0.6714504361, alpha: 1))),
            
                .generalCell(model: SettingsOption(title: "Achievements", icon: #imageLiteral(resourceName: "Achievements"), iconBackgroundColor: #colorLiteral(red: 0.8509803922, green: 0.2392156863, blue: 0.2392156863, alpha: 1))),
            
                .generalCell(model: SettingsOption(title: "Sleep timer", icon: #imageLiteral(resourceName: "Sleep timer"), iconBackgroundColor: #colorLiteral(red: 0.368627451, green: 0.3764705882, blue: 0.8549019608, alpha: 1))),
            
                .generalCell(model: SettingsOption(title: "Appearance", icon: #imageLiteral(resourceName: "Appearance"), iconBackgroundColor: #colorLiteral(red: 0.862745098, green: 0.4705882353, blue: 0.3058823529, alpha: 1)))
        ]))
        models.append(Section(title: "General", options: [
            .generalCell(model: SettingsOption(title: "Share", icon: #imageLiteral(resourceName: "Share"), iconBackgroundColor: #colorLiteral(red: 0.7607843137, green: 0.4666666667, blue: 0.8745098039, alpha: 1))),
            
                .generalCell(model: SettingsOption(title: "Rate us", icon: #imageLiteral(resourceName: "Rate us"), iconBackgroundColor: #colorLiteral(red: 0.9568627451, green: 0.6274509804, blue: 0.3137254902, alpha: 1))),
            
                .generalCell(model: SettingsOption(title: "Privacy Policy", icon: #imageLiteral(resourceName: "Subtract"), iconBackgroundColor: #colorLiteral(red: 0.2784313725, green: 0.4549019608, blue: 0.8862745098, alpha: 1)))
        ]))

        models.append(Section(title: "BugSetting", options: [
            .generalCell(model: SettingsOption(title: "Report a bug", icon: #imageLiteral(resourceName: "Report a bug"), iconBackgroundColor: #colorLiteral(red: 0.8549019608, green: 0.3803921569, blue: 0.3607843137, alpha: 1)))
        ]))

        //
        //        models.append(Section(title: "Button", options: [
        //            SettingsOption(title: "Music Premium", icon: UIImage(systemName: "bolt"), iconBackgroundColor: .systemBlue){
        //
        //            }
        //        ]))
        //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 77;
        }
        return 56
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
