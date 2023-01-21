//
//  SettingTableViewCell.swift
//  TestWork5
//
//  Created by Ostap Artym on 18.01.2023.
//

import UIKit
import Foundation

public class SettingButtonTableViewCell: UITableViewCell {
    static let identifier = "SettingButtonTableViewCell"
    
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
        label.font = UIFont.init(name: "SF Pro Display Bold", size: 22)
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        contentView.superview?.backgroundColor = #colorLiteral(red: 0.8509803922, green: 0.2392156863, blue: 0.2392156863, alpha: 1)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(IconImageView)
        contentView.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        iconContainer.frame = CGRect(x: 87.5,
                                     y: 12,
                                     width: 32,
                                     height: 32)
        IconImageView.frame = CGRect(x: 8,
                                     y: 8,
                                     width: 16,
                                     height: 14.4)
        label.frame = CGRect(x: 129.5,
                             y: 15.5,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: 25)
//        label.font = UIFont(name: "SF Pro Display Bold", size: 22)
 //       label.font = label.font.withSize(22)
 //       label.font.fo = "SF-Pro-Display-Regular.otf"

    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        IconImageView.image = nil
        iconContainer.backgroundColor = nil
        label.text = nil
    }
    
    func configure(with model: SettingsButtonOption) {
        label.text = model.title
        label.font = UIFont(name: "SF Pro Display Bold", size: 23)
        IconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
    
}
