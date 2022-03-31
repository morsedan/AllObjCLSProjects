//
//  PokemonController.swift
//  ConcurrencyPractice
//
//  Created by morse on 1/28/20.
//  Copyright © 2020 morse. All rights reserved.
//

import Foundation
import UIKit

class PokemonController: NSObject {
    
    @objc(sharedController) static let shared = PokemonController()
    
    private let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon")!
    
    @objc dynamic var pokemon: DMOPokemon? {
        didSet {
            guard let spriteURL = pokemon?.sprite else { return }
            PokemonController.shared.fetchPhoto(from: spriteURL) { (sprite, error) in
                if let error = error {
                    print("Error fetching sprite: \(error)")
                }
                if let sprite = sprite {
                    self.pokemonImage = sprite
                }
            }
        }
    }
    @objc dynamic var pokemonImage: UIImage?
    
    @objc func fetchAllPokemon(completion: @escaping ([DMOPokemon]?, Error?) -> Void) {

        let url = urlForFetch(searchTerm: "")
        
        fetch(from: url) { (dictionary, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let dictionary = dictionary else {
                completion(nil, NSError())
                return
            }
            guard let pokemonDictionaries = dictionary["results"] as? [[String: String]] else {
                print("Conversion to [[String: String]] failed.", dictionary["results"] ?? "no results")
                return
            }
            var pokemen: [DMOPokemon] = []
            for dictionary in pokemonDictionaries {
                if let pokemon = DMOPokemon(dictionary: dictionary) {
                    pokemen.append(pokemon)
                }
            }
            print(pokemen.count)
            completion(pokemen, nil)
        }
    }
    
    @objc func fillInDetails(for pokemon: DMOPokemon) {
        self.pokemon = nil
        guard let url = pokemon.infoURL else { return }
        
        fetch(from: url) { (dictionary, error) in
            if let error = error {
                print(error)
            }
            
            guard let dictionary = dictionary else {
                print("No dictionary.")
                return
            }
            
            let possibleFullPokemon = DMOPokemon(dictionary: dictionary)
            guard let fullPokemon = possibleFullPokemon else { return }

            self.pokemon = fullPokemon
        }
    }
    
    private func fetchPhoto(from url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
        let session = URLSession.shared
        session.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
            }
            
            guard let data = data else {
                print("No image data")
                return
            }
            
            guard let image = UIImage(data: data) else {
                print("Bad image data")
                return
            }
            
            self.pokemonImage = image
        }.resume()
    }
    
    private func fetch(from url: URL, using session: URLSession = URLSession.shared, completion: @escaping ([String: Any]?, Error?) -> Void) {
        session.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print("error")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError())
                return
            }
            
            do {
                let possibleDictionary = try JSONSerialization.jsonObject(with: data, options: [])
                
                guard let dictionary = possibleDictionary as? [String: Any] else {
                    print("JSON was not a dictionary")
                    completion(nil, NSError())
                    return
                }
                
                completion(dictionary, nil)
                return
                
            } catch {
                
                print(error)
                completion(nil, error)
                return
                
            }
        }.resume()
    }
    
    private func urlForFetch(searchTerm: String) -> URL {
        var url = baseURL
        if !searchTerm.isEmpty {
            url.appendPathComponent(searchTerm)
        } else {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
            let limitItem = URLQueryItem(name: "limit", value: "1000")
            components.queryItems = [limitItem]
            url = components.url!
        }
        return url
    }
}
