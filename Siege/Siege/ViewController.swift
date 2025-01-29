//
//  ViewController.swift
//  Siege
//
//  Created by Melanie Laveriano on 12/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Green: UIButton!
    @IBOutlet weak var segueSwitch: UISwitch!
    @IBOutlet weak var Yellow: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func YellowTapped(_ sender: Any) { if segueSwitch.isOn { performSegue(withIdentifier: "yellow", sender: nil) }}



    @IBAction func GreenTapped(_ sender: Any) { if segueSwitch.isOn { performSegue(withIdentifier: "green", sender: nil) } }

    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue) { }
    

}

