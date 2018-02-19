//
//  EventViewController.swift
//  GifteryTest
//
//  Created by abhishek on 17/02/18.
//  Copyright © 2018 abhishek. All rights reserved.
//

import UIKit

class EventViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var plusButton: UIButton!
    var array_events = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 100;
        
        plusButton.layer.cornerRadius = plusButton.frame.size.height/2
        array_events = CommonValidations().readJsonFileFromBundle(file_name: "jsonresponse")
        
        print("json %@",array_events)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let view_background = cell.viewWithTag(200) as! UIView
        let person_name = cell.viewWithTag(1) as! UILabel
        let occasion_name = cell.viewWithTag(2) as! UILabel
        let date_label = cell.viewWithTag(3) as! UILabel
        let ago_label = cell.viewWithTag(4) as! UILabel
        let gift_button = cell.viewWithTag(5) as! UIButton
        gift_button.layer.cornerRadius = 15
        gift_button.backgroundColor = tab_selected_color
        if let x = (array_events.object(at: indexPath.row) as! NSDictionary).object(forKey: "Name") as? NSString
        {
          if x.length == 0
          {
            person_name.text = ""
            occasion_name.font = UIFont(name: bold_font, size: heading_font_size)
          }
          else
          {
            person_name.text = (array_events.object(at: indexPath.row) as! NSDictionary).object(forKey: "Name") as? String
            person_name.font = UIFont(name: bold_font, size: heading_font_size)
            occasion_name.font = UIFont(name: regular_font, size: subtitle_font_size)
          }
        }
        else
        {
             person_name.text = ""
            occasion_name.font = UIFont(name: bold_font, size: heading_font_size)
        }
        person_name.sizeToFit()
        if let x = (array_events.object(at: indexPath.row) as! NSDictionary).object(forKey: "Occasion") as? NSString
        {
            if x.length == 0
            {
                occasion_name.text = ""
            }
            else
            {
                occasion_name.text = (array_events.object(at: indexPath.row) as! NSDictionary).object(forKey: "Occasion") as? String
            }
        }
        else
        {
            occasion_name.text = ""
        }
         occasion_name.sizeToFit()
        if let x = (array_events.object(at: indexPath.row) as! NSDictionary).object(forKey: "Gifted") as? NSString
        {
            if x.lowercased == "false"
            {
                gift_button.setTitle("GIFT", for: .normal)
                gift_button.setImage(nil, for: .normal)
            }
            else
            {
                gift_button.setTitle("", for: .normal)
                gift_button.setImage(UIImage(named: "icon5"), for: .normal)
            }
        }
        else
        {
            gift_button.setTitle("GIFT", for: .normal)
            gift_button.setImage(nil, for: .normal)
        }
        date_label.text = CommonValidations().convertDateFormatter(date: (array_events.object(at: indexPath.row) as! NSDictionary).object(forKey: "Date") as! String, format_final: "dd MMM", format_start: "yyyy-MM-dd")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let convertedDate = dateFormatter.date(from: (array_events.object(at: indexPath.row) as! NSDictionary).object(forKey: "Date") as! String)
        ago_label.text = CommonValidations().timeCal(convertedDate!)
        if indexPath.row % 2 == 0
        {
            view_background.backgroundColor = UIColor.white
        }
        else
        {
             view_background.backgroundColor = UIColor(red: 245.0/255.0, green: 141.0/255.0, blue: 137.0/255.0, alpha: 1.0)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array_events.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
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
