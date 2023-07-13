//
//  TransactionCell.swift
//  hubtel-coding-challenge-repo
//
//  Created by Kwame Agyenim Boateng on 7/13/23.
//

import UIKit

class TransactionCell: UITableViewCell {

    static var REUSE_IDENTIFIER = "TransactionCell"
    
    var data: Transaction? {
        didSet{
            manageData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: TransactionCell.REUSE_IDENTIFIER)
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties -
    lazy var container: UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .none
        v.layer.cornerRadius = 14
        v.layer.borderWidth = 0.7
        v.layer.borderColor = UIColor.systemGray5.cgColor
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var dateLbl: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textColor = .systemGray3
        lbl.font = UIFont(name: "Avenir-Light", size: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var logoImage : UIImageView = {
        var iv = UIImageView()
        iv.image = nil //UIImage(named: "")?.withRenderingMode(.alwaysTemplate)
        iv.backgroundColor = .systemGray3
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 50/2
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var nameLbl: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.numberOfLines = 4
        lbl.font = UIFont(name: "Avenir-Medium", size: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var mobileLbl: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.numberOfLines = 1
        lbl.textColor = .systemGray3
        lbl.font = UIFont(name: "Avenir-Book", size: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var statusLbl: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.font = UIFont(name: "Avenir-Medium", size: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var priceLbl: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.font = UIFont(name: "Avenir-Heavy", size: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var border: UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .systemGray6
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    lazy var stackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.spacing = 10
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .equalCentering
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    lazy var userImage : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(systemName: "person.circle.fill")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.purple
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var starImage : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.yellow
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var typeLbl: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.font = UIFont(name: "Avenir-Medium", size: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var commentLbl: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.font = UIFont(name: "Avenir-Medium", size: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    func setupViews(){
        contentView.addSubview(container)
        container.addSubview(dateLbl)
        container.addSubview(logoImage)
        container.addSubview(statusLbl)
        container.addSubview(priceLbl)
        container.addSubview(nameLbl)
        container.addSubview(mobileLbl)
        container.addSubview(border)
        container.addSubview(stackView)
        stackView.addArrangedSubview(userImage)
        stackView.addArrangedSubview(typeLbl)
        stackView.addArrangedSubview(commentLbl)
        stackView.addArrangedSubview(starImage)
    }
    
    
    func setupContraints(){
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -20),
          
            dateLbl.topAnchor.constraint(equalTo: container.topAnchor, constant: 15),
            dateLbl.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            
            logoImage.topAnchor.constraint(equalTo: dateLbl.bottomAnchor, constant: 20),
            logoImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            logoImage.widthAnchor.constraint(equalToConstant: 50),
            logoImage.heightAnchor.constraint(equalToConstant: 50),

            nameLbl.topAnchor.constraint(equalTo: dateLbl.bottomAnchor, constant: 20),
            nameLbl.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 10),
            
            
            mobileLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 10),
            mobileLbl.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 10),
            mobileLbl.centerYAnchor.constraint(equalTo: priceLbl.centerYAnchor),
            
            statusLbl.topAnchor.constraint(equalTo: dateLbl.bottomAnchor,constant: 20),
            statusLbl.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            statusLbl.leadingAnchor.constraint(equalTo: nameLbl.trailingAnchor, constant: 30),
            
            priceLbl.topAnchor.constraint(equalTo: statusLbl.bottomAnchor,constant: 20),
            priceLbl.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),

            border.topAnchor.constraint(equalTo: priceLbl.bottomAnchor, constant: 20),
            border.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            border.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            border.heightAnchor.constraint(equalToConstant: 1),
            
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -15),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            
            typeLbl.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 10),
            
            userImage.heightAnchor.constraint(equalToConstant: 30),
            userImage.widthAnchor.constraint(equalToConstant: 30),
            
            starImage.heightAnchor.constraint(equalToConstant: 30),
            starImage.widthAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    func manageData(){
        guard let item = data else { return }
        dateLbl.text = item.date
        nameLbl.text = "\(item.receipient)"
        mobileLbl.text = "0\(item.mobile)"
        priceLbl.text = "GH₵ \(item.price)"
        commentLbl.text = item.comments
        
        switch item.transaction_type {
        case .personal:
            typeLbl.text = "Personal"
        case .other:
            typeLbl.text = "Other"
        }
        
        
        switch item.transaction_status {
            case .failed:
                statusLbl.text = "Failed"
            case .sucesss:
                statusLbl.text = "Sucesss"
            case .pending:
                statusLbl.text = "Pending"
        }
        
    }
    
    func setupAttributedText (_ receipient: String, _ mobile: String) -> NSAttributedString {
        let text = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(receipient)\n", attributes: [.foregroundColor: UIColor.gray, .font: UIFont(name: "Avenir", size: 15)!]))
        text.append(NSAttributedString(string: mobile, attributes: [.foregroundColor: UIColor.gray, .font: UIFont(name: "Avenir", size: 15)!]))
        return text
    }
}
