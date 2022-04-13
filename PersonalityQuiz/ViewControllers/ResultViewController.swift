//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answersChosen = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        let animal = determineAnimal()
        
        resultLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
}

extension ResultViewController {
    
    private func determineAnimal() -> Animal {
        
        var coincidences = [Animal: Int]()
        
        for answer in answersChosen {
            coincidences[answer.animal] = (coincidences[answer.animal] ?? 0) + 1
        }
        
        guard let animal = coincidences.sorted(by: {$0.value > $1.value}).first else { return .none }
        
        return animal.key
        
    }

}
