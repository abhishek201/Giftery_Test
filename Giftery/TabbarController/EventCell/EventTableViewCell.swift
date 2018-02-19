//
//  EventTableViewCell.swift
//  Giftery
//
//  Created by abhishek on 19/02/18.
//  Copyright © 2018 abhishek. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    //MARK:- functions
    // this function is used to set the data for the event cell
    func setData(event_dic : NSDictionary)
    {
        let view_background = self.viewWithTag(200) as! UIView
        var person_name_blank = false
        let person_name = self.viewWithTag(1) as! UILabel
        let occasion_name = self.viewWithTag(2) as! UILabel
        let date_label = self.viewWithTag(3) as! UILabel
        let ago_label = self.viewWithTag(4) as! UILabel
        let gift_button = self.viewWithTag(5) as! UIButton
        gift_button.layer.cornerRadius = 15
        gift_button.backgroundColor = tab_selected_color
        if let x = event_dic.object(forKey: "Name") as? NSString
        {
            if x.length == 0
            {
                person_name_blank = true
                person_name.text = ""
                occasion_name.font = UIFont(name: bold_font, size: heading_font_size)
            }
            else
            {
                person_name_blank = false
                person_name.text = event_dic.object(forKey: "Name") as? String
                person_name.font = UIFont(name: bold_font, size: heading_font_size)
                occasion_name.font = UIFont(name: regular_font, size: subtitle_font_size)
            }
        }
        else
        {
            person_name_blank = true
            person_name.text = ""
            occasion_name.font = UIFont(name: bold_font, size: heading_font_size)
        }
        person_name.sizeToFit()
        if let x = event_dic.object(forKey: "Occasion") as? NSString
        {
            if x.length == 0
            {
                occasion_name.text = ""
            }
            else
            {
                occasion_name.text = event_dic.object(forKey: "Occasion") as? String
            }
        }
        else
        {
            occasion_name.text = ""
        }
        occasion_name.sizeToFit()
        date_label.text = CommonValidations().convertDateFormatter(date: event_dic.object(forKey: "Date") as! String, format_final: "dd MMM", format_start: "yyyy-MM-dd")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let convertedDate = dateFormatter.date(from: event_dic.object(forKey: "Date") as! String)
        ago_label.text = CommonValidations().timeCal(convertedDate!)
        for constraint in (person_name.constraints)
        {
            if constraint.identifier == "person_name_height"{
                constraint.constant = person_name_blank == true ? 0:20
            }
        }
        if let x = event_dic.object(forKey: "Gifted") as? NSString
        {
            if x.lowercased == "false"
            {
                if person_name_blank == true
                {
                    date_label.textColor = UIColor(red: 140.0/255.0, green: 107.0/255.0, blue: 148.0/255.0, alpha: 1.0)
                    occasion_name.textColor = UIColor(red: 140.0/255.0, green: 107.0/255.0, blue: 148.0/255.0, alpha: 1.0)
                    ago_label.textColor = UIColor(red: 147.0/255.0, green: 149.0/255.0, blue: 152.0/255.0, alpha: 1.0)
                }
                else
                {
                person_name.textColor = UIColor(red: 140.0/255.0, green: 107.0/255.0, blue: 148.0/255.0, alpha: 1.0)
                date_label.textColor = UIColor(red: 140.0/255.0, green: 107.0/255.0, blue: 148.0/255.0, alpha: 1.0)
                occasion_name.textColor = UIColor(red: 147.0/255.0, green: 149.0/255.0, blue: 152.0/255.0, alpha: 1.0)
                ago_label.textColor = UIColor(red: 245.0/255.0, green: 141.0/255.0, blue: 137.0/255.0, alpha: 1.0)
                }
                view_background.backgroundColor =  UIColor.white
                gift_button.setTitle("GIFT", for: .normal)
                gift_button.setImage(nil, for: .normal)
            }
            else
            {
                if person_name_blank == true
                {
                    date_label.textColor = UIColor(red: 140.0/255.0, green: 107.0/255.0, blue: 148.0/255.0, alpha: 1.0)
                    occasion_name.textColor = UIColor(red: 140.0/255.0, green: 107.0/255.0, blue: 148.0/255.0, alpha: 1.0)
                    ago_label.textColor = UIColor(red: 147.0/255.0, green: 149.0/255.0, blue: 152.0/255.0, alpha: 1.0)
                }
                else
                {
                person_name.textColor = UIColor(red: 147.0/255.0, green: 149.0/255.0, blue: 152.0/255.0, alpha: 1.0)
                date_label.textColor = UIColor(red: 147.0/255.0, green: 149.0/255.0, blue: 152.0/255.0, alpha: 1.0)
                occasion_name.textColor = UIColor(red: 147.0/255.0, green: 149.0/255.0, blue: 152.0/255.0, alpha: 1.0)
                ago_label.textColor = UIColor(red: 147.0/255.0, green: 149.0/255.0, blue: 152.0/255.0, alpha: 1.0)
                }
                view_background.backgroundColor = UIColor(red: 245.0/255.0, green: 141.0/255.0, blue: 137.0/255.0, alpha: 1.0)
                gift_button.setTitle("", for: .normal)
                gift_button.setImage(UIImage(named: "icon5"), for: .normal)
            }
        }
        else
        {
            person_name.textColor = UIColor(red: 140.0/255.0, green: 107.0/255.0, blue: 148.0/255.0, alpha: 1.0)
            date_label.textColor = UIColor(red: 140.0/255.0, green: 107.0/255.0, blue: 148.0/255.0, alpha: 1.0)
            occasion_name.textColor = UIColor(red: 147.0/255.0, green: 149.0/255.0, blue: 152.0/255.0, alpha: 1.0)
            ago_label.textColor = UIColor(red: 245.0/255.0, green: 141.0/255.0, blue: 137.0/255.0, alpha: 1.0)
            view_background.backgroundColor = UIColor.white
            gift_button.setTitle("GIFT", for: .normal)
            gift_button.setImage(nil, for: .normal)
        }
        
    }
    //MARK:- class functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
