//
//  ViewController.swift
//  SunriseApp
//
//  Created by 時任幹太 on 2023/04/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameInput: UITextField!
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func findSunrise(_ sender: Any) {
        let url =  "https://weather.yahooapis.jp/v1/place/\(cityNameInput.text!)/info?output=json&u=c"
        getURL(url: url)

    }
    
    func getURL(url: String) {
        do {
            let apiURL = URL(string: url)!
            let data = try Data(contentsOf: apiURL)
            let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
            print(json)
        } catch {
            self.sunriseTimeLabel.text = "サーバーに接続できません。"
        }
    }

}

