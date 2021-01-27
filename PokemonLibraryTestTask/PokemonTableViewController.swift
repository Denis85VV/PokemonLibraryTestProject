//
//  PokemonTableViewController.swift
//  PokemonLibraryTestTask
//
//  Created by Denis on 13.01.2021.
//

import UIKit
import SwiftGifOrigin

class PokemonTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  static let loadingGif = UIImage.gif(name: "loading")
  static let pokemonCell = "PokemonCell"
  static let defaultImageUrl = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")!
  
  public var url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=30&offset=0")!
  
  private var fetchingMore = false
  private var counter = 30
  private var pokemonList = [Pokemon]()
  private var pokemonArray = [Pokemon]()
  private var pokemonTableView: PokemonTableView? {
    view as? PokemonTableView
  }
  
  override func loadView() {
    view = PokemonTableView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Pokemons"
    
    pokemonTableView?.tableView.delegate = self
    pokemonTableView?.tableView.dataSource = self
    
    downloadPokemon()
    beginBatchFetch()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    var currentSelectedImage: URL
    var currentSelectedLabel: String
    
    currentSelectedImage = pokemonArray[indexPath.row].imageURL ?? PokemonTableViewController.defaultImageUrl
    currentSelectedLabel = pokemonArray[indexPath.row].name.capitalized
    
    let vc = PokemonViewController(pokemonImage: currentSelectedImage, pokemonLabel: currentSelectedLabel)
    vc.setImageName(image: currentSelectedImage)
    vc.setLabelName(name: currentSelectedLabel)
    
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return pokemonArray.count
    } else if section == 1 && fetchingMore {
      return 1
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewController.pokemonCell, for: indexPath)
      cell.accessoryType = .disclosureIndicator
      cell.textLabel?.text = pokemonArray[indexPath.row].name.capitalized
      cell.imageView?.kf.setImage(with: pokemonArray[indexPath.row].imageURL, placeholder: PokemonTableViewController.loadingGif)
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableLoadingCell.loadingCell, for: indexPath) as! PokemonTableLoadingCell
      cell.loadingIndicator.startAnimating()
      return cell
    }
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let offsetY = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height
    if offsetY > contentHeight - scrollView.frame.height {
      if !fetchingMore {
        beginBatchFetch()
      }
    }
  }
  
  func downloadPokemon() {
    URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, response, error in
      guard let data = data, response != nil, error == nil else {
        print("ooops")
        return
      }
      let decoder = JSONDecoder()
      let pokemonList = try? decoder.decode(PokemonList.self, from: data)
      guard let downloadedPokemonList = pokemonList else {
        return
      }
      self?.pokemonList = downloadedPokemonList.results
      DispatchQueue.main.async {
        self?.pokemonTableView?.tableView.reloadData()
      }
    }).resume()
  }
  
  func beginBatchFetch() {
    fetchingMore = true
    //self.pokemonTableView?.tableView.reloadSections(IndexSet(integer: 1), with: .none) // crush
    self.pokemonTableView?.tableView.reloadData()
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: { // not good
      let newPokemonsURL = "https://pokeapi.co/api/v2/pokemon?limit=30&offset=\(self.counter)"
      print(newPokemonsURL)
      self.url = URL(string: newPokemonsURL)!
      self.pokemonArray.append(contentsOf: self.pokemonList)
      self.pokemonCounter()
      self.downloadPokemon()
      self.fetchingMore = false
      self.pokemonTableView?.tableView.reloadData()
    })
  }
  
  func pokemonCounter() {
    if self.pokemonArray.count > 0 {
      self.counter += 30
      print(self.counter)
    }
  }
  
}
