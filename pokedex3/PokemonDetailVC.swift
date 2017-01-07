//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by YC on 1/5/17.
//  Copyright © 2017 Cakmak LLC. All rights reserved.
//

import UIKit
import Alamofire

class PokemonDetailVC: UIViewController {
    
    
    var pokemon: Pokemon!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedex: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized
        
        pokemon.downloadPokemonDetails {
            
            let img = UIImage(named: "\(self.pokemon.pokedexId)")
            self.nameImg.image = img
            self.currentEvoImg.image = img
            self.pokedex.text = "\(self.pokemon.pokedexId)"
            
            print("Did arrive here?")
            //Whatever we write will only be called after the network call is complete
            self.updateUI()
        }
        
    }
    func updateUI() {
        
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No evolutions"
            nextEvoImg.isHidden = true
            
        } else {
            
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution \(pokemon.nextEvolutionName ) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
            
        }
        
    }

    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
