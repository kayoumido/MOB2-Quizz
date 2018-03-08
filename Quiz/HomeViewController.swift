//
//  HomeViewController.swift
//  Quiz
//
//  Created by Doran Kayoumi on 05.03.18.
//  Copyright © 2018 Pascal Hurni. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var startGameButton: UIButton!
    @IBOutlet var gameTypePicker: UIPickerView!
    
    private var pickerData: [String] = [String]()
    private var selectedGameMode: String? = nil
    
    public var isGameOver: Bool = false
    public var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Connect data:
        gameTypePicker?.delegate = self
        gameTypePicker?.dataSource = self
        
        // Input data into the Array:
        self.pickerData = ["Rookie", "Journeyman", "Warrior", "Ninja"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func StartGameClick(_ sender: Any) {
        let gameVC = storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        do {
            try gameVC.session = QuizSessionFactory.create(selectedGameMode!, RemoteQuestionRepository(remoteUrl: "http://localhost:4567"))
        }
        catch let error as QuizSessionFactory.QuizSessionFactoryError {
            print(error.rawValue)
        }
        catch {
            print("FATAL ERROR")
        }
        // startGameButton.setTitle(selectedGameMode!, for: UIControlState())
        
        present(gameVC, animated: true, completion: nil)
    }
    
    // The number of columns of data
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedGameMode = pickerData[row]
        
        return pickerData[row]
    }
}