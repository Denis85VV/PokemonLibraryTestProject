//
//  PokemonView.swift
//  PokemonLibraryTestTask
//
//  Created by Denis on 27.01.2021.
//

import UIKit

class PokemonView: UIView {
  
  public let label: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 30)
    label.textAlignment = .center
    return label
  }()
  
  public let imageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  private let view: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupInitialLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupInitialLayout() {
    addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
    view.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
    view.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    view.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
    
    view.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    
    view.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
    label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
  }
  
}
