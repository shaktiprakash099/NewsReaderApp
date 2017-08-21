//
//  ViewController.swift
//  WeatherAppSwift
//
//  Created by GLB-312-PC on 03/08/17.
//  Copyright © 2017 GLB-312-PC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var citylable: UILabel!
    @IBOutlet weak var conditionLable: UILabel!
    @IBOutlet weak var weatypeImageview: UIImageView!
    @IBOutlet weak var degreelable: UILabel!
    var degree : Int!
    var condition : String!
    var imageUrl : String!
    var city : String!
    var exits :Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  // Mark ssearchbar delegate
    
    @IBAction func newsappButton(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NewsReaderViewController") as! NewsReaderViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchcityname = searchBar.text else {
            return
           
        }
       
        
        
        if searchcityname == "" {
        
            let alertcontroller = UIAlertController.init(title: "", message: "Please enter your city name", preferredStyle: .alert)
            let okayaction = UIAlertAction.init(title: "Okay", style: .default){ (okayaction) in
                alertcontroller.dismiss(animated: true, completion: nil)
            }
            alertcontroller.addAction(okayaction)
            self.present(alertcontroller, animated: true, completion: nil)
        }
        
       else if searchcityname != "" {

        let servisehelperclass :ServiseHelperclass = ServiseHelperclass()
        servisehelperclass.getweatherinformationofCity(cityname: searchcityname as NSString) { (response) in
            print(response!)
            
            if let responseDictionary :NSDictionary = response as? NSDictionary{
                if (responseDictionary["current"] as? [String :AnyObject]) != nil{
                    self.exits = true;
                    let current:NSDictionary = responseDictionary.object(forKey: "current") as! NSDictionary
                    if let temp: Int = current["temp_c"] as? Int{
                        self.degree = temp;
                        print(self.degree!)
                    }
                    if let condition = current["condition"] as? [String: AnyObject]{
                        self.condition = condition["text"] as? String
                           print(self.condition!)
                        let icon = condition["icon"] as! String
                        self.imageUrl = "http:\( icon)"
                           print(self.imageUrl!)
                   
                }
                    if (responseDictionary["location"] as? [String :AnyObject]) != nil{
                        let location:NSDictionary = responseDictionary.object(forKey: "location") as! NSDictionary
                        
                        if let cityname = location["name"] as? String{
                            self.city = cityname
                            print("\(self.city)")
                        }
                    }
                    
                }
               
              
               else if (responseDictionary["error"] as? [String :AnyObject]) != nil{
                    self.exits = false;
                    
                }
                
                else{
                     self.exits = false;
                }
                
            }
            DispatchQueue.main.async {
                if self.exits{
                    self.degreelable.text = "\(self.degree.description)°"
                    self.citylable.text = self.city
                    self.conditionLable.text = self.condition
                    self.weatypeImageview.isHidden = false
                    self.weatypeImageview.sd_setImage(with: URL(string: self.imageUrl))
                }
                else{
                    self.degreelable.text = " "
                    self.citylable.text = " "
                    self.conditionLable.text = " "
                    self.weatypeImageview.isHidden = true
                    
                    let alertcontroller = UIAlertController.init(title: "", message: "No result found ", preferredStyle: .alert)
                    let okayaction = UIAlertAction.init(title: "Okay", style: .default){ (okayaction) in
                        alertcontroller.dismiss(animated: true, completion: nil)
                    }
                    alertcontroller.addAction(okayaction)
                    self.present(alertcontroller, animated: true, completion: nil)

                }
            }
          }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }


}

