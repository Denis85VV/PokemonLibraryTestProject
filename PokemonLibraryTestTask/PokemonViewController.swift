//
//  PokemonViewController.swift
//  PokemonLibraryTestTask
//
//  Created by Denis on 13.01.2021.
//
import UIKit
import Kingfisher

class PokemonViewController: UIViewController {
  
  private let pokemonImageView = UIImageView()
  private let pokemonLabelView = UILabel()
  
  private var pokemonImage: URL
  private var pokemonLabel: String
  
  init(pokemonImage: URL, pokemonLabel: String) {
    self.pokemonImage = pokemonImage
    self.pokemonLabel = pokemonLabel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(pokemonImageView)
    view.addSubview(pokemonLabelView)
    
    self.navigationItem.title = pokemonLabel;
    
    pokemonImageView.translatesAutoresizingMaskIntoConstraints = false
    pokemonImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    pokemonImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    pokemonImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    pokemonImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    pokemonImageView.kf.setImage(with: pokemonImage)
    
    pokemonLabelView.translatesAutoresizingMaskIntoConstraints = false
    pokemonLabelView.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: 4).isActive = true
    pokemonLabelView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    pokemonLabelView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    pokemonLabelView.font = UIFont.boldSystemFont(ofSize: 30)
    pokemonLabelView.textAlignment = .center
    pokemonLabelView.text = pokemonLabel
  }
  
  func setImageName(image: URL){
    pokemonImage = image
  }
  
  func setLabelName(name: String){
    pokemonLabel = name
  }
  
}

