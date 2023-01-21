//
//  SettingTableViewCell.swift
//  TestWork5
//
//  Created by Ostap Artym on 18.01.2023.
//

import UIKit

public class SettingTableViewCell: UITableViewCell {
    static let identifier = "SettingTableViewCell"
    
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
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont(name: "Roboto Regular", size: 17)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.superview?.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.1098039216, blue: 0.1176470588, alpha: 1)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(IconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        let size = 32.0
        iconContainer.frame = CGRect(x: 16, y: 12, width: size, height: size)
        let imageSize = size/1.5
        IconImageView.frame = CGRect(x: (size - imageSize)/2, y: (size - imageSize)/2, width: imageSize, height: imageSize)
        label.frame = CGRect(x: 32 + iconContainer.frame.size.width,
                             y: 3,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        IconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
    }
    
    func configure(with model: SettingsOption) {
        label.text = model.title
        IconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
    
    
    
}
