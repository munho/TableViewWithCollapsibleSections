//
//  ViewController.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 4/25/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    
    fileprivate let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.reloadSections = { [weak self] (section: Int) in
            self?.tableView?.beginUpdates()
            self?.tableView?.reloadSections([section], with: .fade)
            self?.tableView?.endUpdates()
        }
                
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.sectionHeaderHeight = 70
        tableView?.separatorStyle = .none
        tableView?.dataSource = viewModel
        tableView?.delegate = viewModel
        tableView?.register(AboutCell.nib, forCellReuseIdentifier: AboutCell.identifier)
        tableView?.register(NamePictureCell.nib, forCellReuseIdentifier: NamePictureCell.identifier)
        tableView?.register(FriendCell.nib, forCellReuseIdentifier: FriendCell.identifier)
        tableView?.register(AttributeCell.nib, forCellReuseIdentifier: AttributeCell.identifier)
        tableView?.register(EmailCell.nib, forCellReuseIdentifier: EmailCell.identifier)
        tableView?.register(HeaderView.nib, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)

        tableView?.translatesAutoresizingMaskIntoConstraints = false

        // https://www.w3.org/TR/CSS2/box.html
        // The 'margin' property is a shorthand property for setting 'margin-top', 'margin-right', 'margin-bottom', and 'margin-left' at the same place in the style sheet.
        let guide = view.safeAreaLayoutGuide
        if let tableView = tableView {
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: guide.topAnchor),
                tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor)

            ])
        }
    }
}

