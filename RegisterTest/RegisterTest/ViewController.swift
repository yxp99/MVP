import Alamofire
import UIKit

class ViewController: UIViewController {
    
    //Defined a constant that holds the URL for our web service
    let URL_USER_REGISTER = "http://cwrucourse.fun/3to1/Connection/register.php"
    
    //View variables

    
    @IBOutlet weak var textFieldID: UITextField!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    @IBAction func buttonRegister(_ sender: UIButton) {
        
        //creating parameters for the post request
        let param: Parameters=[
            "username":textFieldUsername.text!,
            "password":textFieldPassword.text!,
            "email":textFieldEmail.text!,
            "id":textFieldID.text!
        ]
        
        //Sending http post request
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: param).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
