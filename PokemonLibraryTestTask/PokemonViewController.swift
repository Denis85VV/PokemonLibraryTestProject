//
//  PokemonViewController.swift
//  PokemonLibraryTestTask
//
//  Created by Denis on 13.01.2021.
//
import UIKit
import Kingfisher

class PokemonViewController: UIViewController {
  
  private var pokemonImage: URL
  private var pokemonLabel: String
  
  var pokemonImageView: PokemonView? {
    view as? PokemonView
  }
  
  var pokemonLabelView: PokemonView? {
    view as? PokemonView
  }
  
  init(pokemonImage: URL, pokemonLabel: String) {
    self.pokemonImage = pokemonImage
    self.pokemonLabel = pokemonLabel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    view = PokemonView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = pokemonLabel;
    pokemonImageView?.imageView.kf.setImage(with: pokemonImage)
    pokemonLabelView?.label.text = pokemonLabel
  }
  
  func setImageName(image: URL){
    pokemonImage = image
  }
  
  func setLabelName(name: String){
    pokemonLabel = name
  }
  
}

