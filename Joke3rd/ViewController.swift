//
//  ViewController.swift
//  Joke3rd
//
//  Created by zgaga on 02/05/2020.
//  Copyright © 2020 Hime Electronics Int. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var jokeQuestionLB: UILabel!
    
    
    @IBOutlet var jokeAnswerLB: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    

                let jsonUrlString = "https://official-joke-api.appspot.com/random_joke"
                
                guard let url = URL(string: jsonUrlString) else { return }
                
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    
                    
                    guard let data = data else { return }
       
                    
                    do {
                        // parsing json data to an object with the structure from the model in joke.swift
                        let joke =  try JSONDecoder().decode(Joke.self, from: data)
                        
                        print (joke.setup + "\n" + joke.punchline)
                        
                        self.jokeQuestionLB.text = joke.setup
                        self.jokeAnswerLB.text = joke.punchline
                       
                        
                    } catch let jsonErr {
                        print ("Error with json:", jsonErr)
                    }
                    
                // have to resume the session
                }.resume()
                
            }


    }
    
    




