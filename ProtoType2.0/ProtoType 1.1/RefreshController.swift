//
//  RefreshController.swift
//  ProtoType 1.1
//
//  Created by cj on 11/25/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit

class RefreshController: UIViewController {

    var sessionOver = false
    var questionString = "Waiting for server to push questiones"
    
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    struct Question: Decodable {
        let QID: Int?
        let Question: String?
        let Answer: Int?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //while(true){
            startTimeSession()
        //}
        // Do any additional setup after loading the view.
    }
    
    //***********************Time Section*************************************//
    func startTimeSession(){
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuestionController.action), userInfo: nil, repeats: true)
        time = 200
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuestionController.countdonwAction), userInfo: nil, repeats: true)
    }
    
    var time = 0
    var timer = Timer()
    
    
    @objc func countdonwAction(){
        if(time == 0){
            //countDownLabel.text = "0"
            timer.invalidate()
        }
        else{
            time -= 1
            //countDownLabel.text = String (time)
            getJson()
            if (sessionOver == true){
                timer.invalidate()
                countDownLabel.text = "Question is here!"
                self.questionLabel.text = questionString
            }
            
        }
    }
    

    func getJson(){

        let jsonUrlString = "http://cwrucourse.fun/3to1/searchQuestion.php"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                let questions = try JSONDecoder().decode([Question].self, from: data)

                    for item in questions {
                        //print(item.Question!)
                        if(item.QID!==100){
                            self.sessionOver = true
                            self.questionString = item.Question!
                        }
                        

                    }

            }
            catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            }.resume()
    }



}
    


    

