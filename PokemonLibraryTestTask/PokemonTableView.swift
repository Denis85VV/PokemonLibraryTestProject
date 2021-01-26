//
//  PokemonTableView.swift
//  PokemonLibraryTestTask
//
//  Created by Denis on 26.01.2021.
//

import UIKit

class PokemonTableView: UIView {
  
  public let tableView: UITableView = {
    let table = UITableView()
    table.register(UITableViewCell.self, forCellReuseIdentifier: PokemonTableViewController.pokemonCell)
    table.register(PokemonTableLoadingCell.self, forCellReuseIdentifier: PokemonTableLoadingCell.loadingCell)
    table.tableFooterView = UIView() // hide empty cells
    return table
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupInitialLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupInitialLayout() {
    addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
    tableView.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
    tableView.backgroundColor = .white
  }
}
