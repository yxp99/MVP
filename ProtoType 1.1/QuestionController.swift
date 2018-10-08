//  QuestionController.swift
//  ProtoType 1.1
//
//  Created by Yiming Pan on 10/7/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit

class QuestionController: UIViewController {

    var userOutput: String = "TimeStamp  Choice \n"
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
    
    
    struct Question: Codable{
        // A question struct for the questions.
        let questionName : String
        let questionID : Int
        let content: String
        enum CodingKeys: String, CodingKey {
            case questionName = "name"
            case questionID = "id"
            case content = "content"
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson()
        startTimeSession()
        // Do any additional setup after loading the view.
    }
    
    func getJson(){
        guard let url = URL(string: "http://cwrucourse.fun/3to1/searchTest2.php") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
                
            }
            }.resume()
    }
    
    //***********************Time Section*************************************
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
                userOutput = userOutput + "A\n"
            }
            else{
                userOutput = userOutput + "B\n"
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



    

//    override func prepare(segue: UIStoryboardSegue, sender: AnyObject?) {
//
//
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            if let destinationVC = segue.destination as? ResultController {
                //Send the content to resultController
                destinationVC.content = userOutput
            }
        }
    }

    //@IBOutlet weak var missButton: UIButton!
    //@IBOutlet weak var makeButton: UIButton!
    

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        missButton.isEnabled = false
//        makeButton.isEnabled = false

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "ShowC" {
//            if let destinationVC = segue.destinationViewController as? OtherViewController {
//                destinationVC.numberToDisplay = counter
//            }
//        }
//
//    }

    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var ALabel: UILabel!
    @IBOutlet weak var BLabel: UILabel!
    let Q1 = "Google or Microsoft?"
    let Q2 = "Superman or Batman?"
    let Q3 = "Pie or cake?"
    let Q4 = "Marval or DC?"
    let Q5 = "Tony Stark or Steve Rogers?"
    let A1 = "Google"
    let A2 = "Superman"
    let A3 = "Pie"
    let A4 = "Marval"
    let A5 = "Tony Stark"
    let B1 = "Microsoft"
    let B2 = "Batman"
    let B3 = "cake"
    let B4 = "DC"
    let B5 = "Steve Rogers"
    
    
    func changeQuesContent(){
        if(time == 9){
            QLabel.text = Q1
            ALabel.text = A1
            BLabel.text = B1
        }
        else if(time == 7){
            QLabel.text = Q2
            ALabel.text = A2
            BLabel.text = B2
        }
        else if(time == 5){
            QLabel.text = Q3
            ALabel.text = A3
            BLabel.text = B3
        }
        else if(time == 3){
            QLabel.text = Q4
            ALabel.text = A4
            BLabel.text = B4
        }
        else if(time == 1){
            QLabel.text = Q5
            ALabel.text = A5
            BLabel.text = B5
        }
    }
    

    
    //************************Database*****************************//


}
    
    

