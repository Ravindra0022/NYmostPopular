//
//  ViewController.swift
//  swiftyjson
//
//  Created by Ravindra Sharma on 02Apr2019
//

import UIKit


class ViewController: UIViewController {
    
    var titleArray = [String]()
    var authorArray  = [String] ()
    var publishedDate = [String]()
    var  imageURLArray  = [String] ()
    var counter:Int  = 0
    
    @IBOutlet var tableView: UITableView!
    var arrData = [JsonModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsing()
    }

    func jsonParsing(){
        
        let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=UHS9gXpBZGZ0wpLrSY6kzLeZ3i7Otoiz")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                let results =  json["results"]
              
                for item in results.arrayValue{
                    
                    self.titleArray.append(item["title"].stringValue)

                    self.authorArray.append(item["byline"].stringValue)

                    self.publishedDate.append(item["published_date"].stringValue)
                    
                    self.imageURLArray.append(item["url"].stringValue)
                   
                }
               self.counter = results.arrayValue.count
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of items in table is \(self.counter)")
        return self.counter
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        cell.populateCell(newsTitle: titleArray[indexPath.row], author: authorArray[indexPath.row], mydate: publishedDate[indexPath.row])
        return cell
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

      let url:String  = self.imageURLArray[indexPath.row]
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailViewID") as? DetailedViewController
        detailVC!.urlStr = url
      //  self.navigationController?.pushViewController(detailVC!, animated: true)
       self.navigationController?.pushViewController(detailVC!, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
