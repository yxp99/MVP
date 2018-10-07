//  QuestionController.swift
//  ProtoType 1.1
//
//  Created by Yiming Pan on 10/7/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit

class QuestionController: UIViewController {

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
    
    @IBOutlet weak var countText: UITextField!
    @IBOutlet weak var lbl: UILabel!
    var time = 0
    var timer = Timer()
    
    
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuestionController.action), userInfo: nil, repeats: true)
    }
    
    @IBAction func countDown(_ sender: Any) {
        time = Int(countText.text!)!
        //missButton.isEnabled = true
        //makeButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuestionController.countdonwAction), userInfo: nil, repeats: true)
    }
    
    
    @objc func countdonwAction(){
        if(time == 0){
            timer.invalidate()
            sessionOver()
        }
        else{
            time -= 1
            lbl.text = String (time)
        }
    }
    
    @objc func action (){
        time += 1
        lbl.text = String(time)
    }
    
    func sessionOver(){
        for item in choiceList {
            print("here")
            print(item.stamp!, terminator:"")
            
            if(item.make == true){
                print("  make")
            }
            else{
                print("  miss")
            }
        }
        print("felse*******************")
        choiceList.removeAll()
        //missButton.isEnabled = false
        //makeButton.isEnabled = false
    }

}
//************************Timer Section Over*****************************//

//@IBAction func clickMake(_ sender: Any) {
//    //intList.append(1)
//    choiceList.append(Choice(stamp: time, make: true))
//    //Choices.stamp.append(time)
//
//    //print(time)
//}
//
//@IBAction func clickMiss(_ sender: Any) {
//    //intList.append(0)
//}



    




    //@IBOutlet weak var missButton: UIButton!
    //@IBOutlet weak var makeButton: UIButton!
    

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        missButton.isEnabled = false
//        makeButton.isEnabled = false




    

    

    
    //************************Database*****************************//
    
    
    
    
    

