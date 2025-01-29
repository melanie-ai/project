//
//  ViewController.swift
//  Login page
//
//  Created by Melanie Laveriano on 12/5/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forgotPasswordB: UIButton!
    @IBOutlet weak var forgetUserNameB: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        if sender == forgotPasswordB {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgetUserNameB {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title = userNameTextField.text
        }
    }
    
    @IBAction func forgetUser(_ sender: Any) {
        performSegue(withIdentifier: "pageToPage", sender: sender)
    }
    @IBAction func forgotPassword(_ sender: UIButton) {
        performSegue(withIdentifier: "pageToPage", sender: sender)
    }
    
    //    @IBAction func ButtonTapped(_ sender: Any) { if segueSwitch.isOn { performSegue(withIdentifier: "Green", sender: nil) } }

}

