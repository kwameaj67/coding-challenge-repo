//
//  StatusView.swift
//  hubtel-coding-challenge-repo
//
//  Created by Kwame Agyenim Boateng on 7/13/23.
//

import UIKit


class StatusView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .horizontal
        alignment = .center
        distribution = .fill
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
    
    lazy var statusLbl: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.font = UIFont(name: "Avenir-Medium", size: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()


    func setupViews(){
        addArrangedSubview(icon)
        addArrangedSubview(statusLbl)
    }
    
    func setupContraints(){
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: 16),
            icon.widthAnchor.constraint(equalToConstant: 16),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            statusLbl.centerYAnchor.constraint(equalTo: centerYAnchor),
            statusLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }
}
