//
//  StatusView.swift
//  hubtel-coding-challenge-repo
//
//  Created by Kwame Agyenim Boateng on 7/13/23.
//

import UIKit


class StatusView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        spacing = 10
//        axis = .horizontal
//        alignment = .center
//        distribution = .
        translatesAutoresizingMaskIntoConstraints = false
        
        setupViews()
        setupContraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var icon : UIImageView = {
        var iv = UIImageView()
        iv.tintColor = .systemGray3
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var label: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.font = UIFont(name: "Avenir-Medium", size: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()


    func setupViews(){
        addSubview(icon)
        addSubview(label)
    }
    
    func setupContraints(){
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: 16),
            icon.widthAnchor.constraint(equalToConstant: 16),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }
}
