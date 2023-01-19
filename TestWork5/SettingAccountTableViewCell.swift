//
//  SettingTableViewCell.swift
//  TestWork5
//
//  Created by Ostap Artym on 18.01.2023.
//

import UIKit

public class SettingAccountTableViewCell: UITableViewCell {
    
    
    static let identifier = "SettingAccountTableViewCell"
    
    private let iconContainer: UIView = {
       let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let IconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let labelFullname: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    private let labelEmail: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.superview?.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.1098039216, blue: 0.1176470588, alpha: 1)
        //contentView.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.1098039216, blue: 0.1176470588, alpha: 1)
        
        contentView.addSubview(labelFullname)
        contentView.addSubview(labelEmail)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(IconImageView)
   //     contentView.frame.size.width = 77
        
        
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame.size.height = 77
        let size = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 16, y: 6, width: size, height: size)
        
        let imageSize = size/1.5
        IconImageView.frame = CGRect(x: 6, y: 8, width: imageSize, height: imageSize)
        
        
        labelFullname.frame = CGRect(x: 52 + iconContainer.frame.size.width,
                             y: -3,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
        
        labelEmail.frame = CGRect(x: 32 + iconContainer.frame.size.width,
                             y: 3,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        IconImageView.image = nil
        labelFullname.text = nil
        labelEmail.text = nil
        iconContainer.backgroundColor = nil
    }
    
    func configure(with model: SettingsAccountOption) {
        labelFullname.text = model.fullName
        labelEmail.text = model.emailAddress
        IconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
    
    
    
}
