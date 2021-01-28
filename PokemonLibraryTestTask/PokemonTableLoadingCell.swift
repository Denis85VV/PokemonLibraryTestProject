//
//  LoadingCell.swift
//  PokemonLibraryTestTask
//
//  Created by Denis on 19.01.2021.
//

import UIKit

class PokemonTableLoadingCell: UITableViewCell {
  
  static let loadingCell = "LoadingCell"
  public let loadingIndicator = UIActivityIndicatorView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(loadingIndicator)
    loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
    loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    loadingIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
