//  QuestionController.swift
//  ProtoType 1.1
//
//  Created by Yiming Pan on 10/7/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit

class QuestionController: UIViewController {

    var userOutput: String = "TimeStamp  Choice  Correctness\n"
    struct Choice {
        //A choice struct for users' choices.
        var stamp: Int?
        var make: Bool?
        
        init(stamp: Int? = nil, make: Bool? = nil) {
            self.stamp = stamp
            self.make = make
        }
    }
    // A choice list recording all the choices users make.
    var choiceList = [Choice]()
    
    
//    struct Question: Codable{
//        // A question struct for the questions.
//        let questionName : String
//        let questionID : Int
//        let content: String
//        enum CodingKeys: String, CodingKey {
//            case questionName = "name"
//            case questionID = "id"
//            case content = "content"
//        }
//
//    }
    
    struct Question: Decodable {
        let QID: Int?
        let Question: String?
        let Answer: Int?
    }
    
    var questionList = [String]()
    var answerList = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This method is used to get and parse the Json file from the server.
        getJson()

        //Start a time session for the user to answer questions
        startTimeSession()
        
    }
    
    
    //***********************Get an Parse Json*************************************//
    func getJson(){
//        guard let url = URL(string: "http://cwrucourse.fun/3to1/searchQuestion.php") else { return }
//
//        let session = URLSession.shared
//        session.dataTask(with: url) { (data, response, error) in
//
//            if let data = data {
//                print(data)
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print(json)
//                } catch {
//                    print(error)
//                }
//
//            }
//            }.resume()
        let jsonUrlString = "http://cwrucourse.fun/3to1/searchQuestion.php"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                let questions = try JSONDecoder().decode([Question].self, from: data)
                for item in questions {
                    print(item.Question!)
                    self.questionList.append(item.Question!)
                    if(item.Answer! == 0){
                        self.answerList.append(true)
                    }
                    else{
                        self.answerList.append(false)
                    }
                }
            }
            catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
    //***********************Get an Parse Json End*************************************//
    
    
    
    //***********************Time Section*************************************//
    func startTimeSession(){
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuestionController.action), userInfo: nil, repeats: true)
        time = 10
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuestionController.countdonwAction), userInfo: nil, repeats: true)
    }
    
    var time = 0
    var timer = Timer()
    @IBOutlet weak var lbl: UILabel!
    
    
    @objc func countdonwAction(){
        if(time == 0){
            lbl.text = "0"
            timer.invalidate()
            sessionOver()
        }
        else{
            time -= 1
            lbl.text = String (time)
            changeQuesContent()
        }
    }
    
    
    func sessionOver(){
        for item in choiceList {
            userOutput = userOutput + String(item.stamp!) + "                   "
            if(item.make == true){
                userOutput = userOutput + "YES" + "        "
            }
            else{
                userOutput = userOutput + "NO" + "         "
            }
            
            
            if(item.make == self.answerList.removeFirst()){
                userOutput = userOutput + "corret\n"
            }
            else{
                userOutput = userOutput + "Wrong\n"
            }
        }
        choiceList.removeAll()
        
        
        //Segue to the next screen.
        self.performSegue(withIdentifier: "resultSegue", sender: self)
    }


//************************Timer Section Over*****************************//

    @IBAction func clickA(_ sender: Any) {
        choiceList.append(Choice(stamp: time, make: true))
    }

    @IBAction func clickB(_ sender: Any) {
        choiceList.append(Choice(stamp: time, make: false))
    }




//************************Segue function to the result page*****************************//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            if let destinationVC = segue.destination as? ResultController {
                //Send the content to resultController
                destinationVC.content = userOutput
            }
        }
    }


    @IBOutlet weak var QLabel: UILabel!
//    let Q1 = "Google or Microsoft?"
//    let Q2 = "Superman or Batman?"
//    let Q3 = "Pie or cake?"
//    let Q4 = "Marval or DC?"
//    let Q5 = "Tony Stark or Steve Rogers?"
//    let A1 = "Google"
//    let A2 = "Superman"
//    let A3 = "Pie"
//    let A4 = "Marval"
//    let A5 = "Tony Stark"
//    let B1 = "Microsoft"
//    let B2 = "Batman"
//    let B3 = "cake"
//    let B4 = "DC"
//    let B5 = "Steve Rogers"
    
    
    func changeQuesContent(){
        if(time == 8){
            QLabel.text = questionList.removeFirst()
        }
//        else if(time == 7){
//            QLabel.text = Q2
//
//        }
        else if(time == 5){
            QLabel.text = questionList.removeFirst()
        }
        else if(time == 3){
            QLabel.text = questionList.removeFirst()
        }
//        else if(time == 1){
//            QLabel.text = Q5
//        }
    }
    

    
    //************************Database*****************************//


}
    
    

