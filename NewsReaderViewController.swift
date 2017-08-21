//
//  NewsReaderViewController.swift
//  WeatherAppSwift
//
//  Created by GLB-312-PC on 19/08/17.
//  Copyright © 2017 GLB-312-PC. All rights reserved.
//

import UIKit

class NewsReaderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var newsFeedsdetailsArray:NSArray!
    @IBOutlet weak var newsrederTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        newsrederTableview.estimatedRowHeight = 200
        newsrederTableview.rowHeight = UITableViewAutomaticDimension
        newsrederTableview.separatorColor = UIColor.clear
        Datamodelclass.init().getDatadetails { (response) in
            
            DispatchQueue.main.async {
                self.newsFeedsdetailsArray = response
                self.newsrederTableview.reloadData()
            }
            
        }
}

  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        var articledatamodel: Articlemodel!
        articledatamodel = newsFeedsdetailsArray[indexPath.row] as! Articlemodel
      cell.desclable.text = articledatamodel.descriptions
      cell.authorlable.text = articledatamodel.author
        cell.titlelabel.text = articledatamodel.title
        
        cell.contentImageview.sd_setImage(with: URL(string: articledatamodel.imageurl!))
        return cell
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.newsFeedsdetailsArray==nil{
            return 0
        }else{
            return self.newsFeedsdetailsArray.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
