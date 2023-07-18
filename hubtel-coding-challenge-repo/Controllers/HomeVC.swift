//
//  ViewController.swift
//  hubtel-coding-challenge-repo
//
//  Created by Kwame Agyenim Boateng on 7/13/23.
//

import UIKit

class HomeVC: UIViewController {

    let data = Transaction.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        setupViews()
        setupContraints()

    }
    // MARK: Properties -
    lazy var tableview: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.register(TransactionCell.self, forCellReuseIdentifier: TransactionCell.REUSE_IDENTIFIER)
        tv.delegate = self
        tv.dataSource = self
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .clear
        tv.separatorColor = .clear
        tv.tableHeaderView = UIView()
        tv.tableFooterView = UIView()
        tv.allowsMultipleSelection = false
        tv.allowsSelection = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var sendBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Send New", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 14)
        btn.setImage(UIImage(systemName: "plus.circle")?.withRenderingMode(.alwaysTemplate), for: .normal)
        //btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        btn.tintColor = .white
        btn.semanticContentAttribute = .forceLeftToRight
        btn.backgroundColor = UIColor(hex: "#01C7B1")
       //btn.adjustsImageWhenHighlighted = true
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var segmentedContol: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["History","Transaction Summary"])
        sc.isSelected = true
        sc.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.5)
        sc.selectedSegmentIndex = 0
        sc.selectedSegmentTintColor = .white
        sc.setTitleTextAttributes([.font: UIFont(name: "Avenir Medium", size: 15)!], for: .normal)
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    func setupViews(){
        view.addSubview(tableview)
        view.addSubview(sendBtn)
        view.addSubview(segmentedContol)
    }
    
    func setupContraints(){
        NSLayoutConstraint.activate([
            segmentedContol.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentedContol.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            segmentedContol.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            segmentedContol.heightAnchor.constraint(equalToConstant: 35),
            
            tableview.topAnchor.constraint(equalTo: segmentedContol.bottomAnchor, constant: 15),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            sendBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            sendBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendBtn.widthAnchor.constraint(equalToConstant: 150),
            sendBtn.heightAnchor.constraint(equalToConstant: 60),
        ])
    }

}



extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionCell.REUSE_IDENTIFIER, for: indexPath) as? TransactionCell else {
            fatalError("Cannot dequeue cell")
        }
        cell.data = data[indexPath.row]
        cell.selectionStyle = .none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(235)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = data[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TransactionCell
        cell.backgroundColor = .none
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TransactionCell
        cell.backgroundColor = .none
    }
    
}
