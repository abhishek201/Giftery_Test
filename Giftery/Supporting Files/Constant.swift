//
//  Constant.swift
//  Giftery
//
//  Created by abhishek on 17/02/18.
//  Copyright © 2018 abhishek. All rights reserved.
//

import Foundation
import UIKit

// Appdelegate variable
var appdelegate = UIApplication.shared.delegate as! AppDelegate

//tab bar selected color
let tab_selected_color = UIColor(red: 133.0/255.0, green: 188.0/255.0, blue: 189.0/255.0, alpha: 1.0)

//define font sizes to be used in the app
var heading_font_size : CGFloat = 18.0
var subtitle_font_size : CGFloat = 16.0
var normal_font_size : CGFloat = 14.0
var sub_normal_font_size : CGFloat = 13.0
var minimum_font : CGFloat = 12.0

//define font names to be used in the app
var regular_font : String = "AvenirNext-Regular"
var bold_font : String = "AvenirNext-Bold"

//tab bar images
let event_image = UIImage(named: "icon1") as! UIImage
let event_image_selected = UIImage(named: "icon1-selected") as! UIImage
let orders_image = UIImage(named: "icon2") as! UIImage
let orders_image_selected = UIImage(named: "icon2-selected") as! UIImage
let gift_image = UIImage(named: "icon3") as! UIImage
let me_image = UIImage(named: "icon4") as! UIImage
let me_image_selected = UIImage(named: "icon4-selected")  as! UIImage

//MARK:- Common class
// this class is used to define common function in the app.
class CommonValidations: NSObject
{
    //MARK:- functions
    // this function is used to read json file from the bundle
    func readJsonFileFromBundle(file_name : NSString) -> NSMutableArray
    {
        var gift_array = NSMutableArray()
        let file_name_path = Bundle.main.path(forResource: file_name as! String, ofType: "txt") as! String
         do {
            
                let text_file = try String(contentsOfFile: file_name_path)
                if let data = text_file.data(using: .utf8)
                    {
                    do {
                        let text_file_data_stored = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [[String : Any]]
                
                            if let myDictionary = text_file_data_stored
                            {
                                if  let x =  myDictionary  as? NSArray
                                {
                                    if x.count > 0
                                    {
                                        gift_array.addObjects(from: myDictionary as! [Any])
                                        return gift_array
                                    }
                                }
                        }
                    }
                    catch
                    {
                        print(error.localizedDescription)
                    }
                }
        }
        catch
         {
            print(error.localizedDescription)
         }
        return NSMutableArray()
    }
    // this function is used to calculate time
    func timeCal (_ start:Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"//this your string date format
        let convertedDate_String = dateFormatter.string(from: Date())
        var date_final_string = convertDateFormatter(date: convertedDate_String, format_final: "yyyy-MM-dd", format_start: "yyyy-MM-dd HH:mm:ss")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date_final = dateFormatter.date(from: date_final_string)
        let calendar = (Calendar.current as NSCalendar)
        
        let date1 = calendar.startOfDay(for: start) as! Date
        let date2 = calendar.startOfDay(for: date_final!) as! Date
        
        var ago_date = ""
        if date2.compare(date1) == .orderedDescending
        {
            let flags = NSCalendar.Unit.day
            let components = calendar.components(flags, from: date1, to: date2, options: []).day as! Int
            let flags_1 = NSCalendar.Unit.month
            let components_month = calendar.components(flags_1, from: date1, to: date2, options: []).month as! Int
            var month_date = ""
            if components != nil
            {
                if components <= 40
                {
                    if components == 1
                    {
                        month_date = "\(components) Day"
                    }
                    else
                    {
                        month_date = "\(components) Days"
                    }
                }
                else
                {
                    if components_month == 1
                    {
                        month_date = "\(components_month) mnth"
                    }
                    else
                    {
                        month_date = "\(components_month) mnths"
                    }
                }
            ago_date = "before " + month_date
        }
        }
        else
        {
            let flags = NSCalendar.Unit.day
            let components = calendar.components(flags, from: date2, to: date1, options: []).day as! Int
            
            
            let flags_1 = NSCalendar.Unit.month
            let components_month = calendar.components(flags_1, from: date2, to: date1, options: []).month as! Int
            
            var month_date = ""
            if components != nil
            {
                if components <= 40
                {
                    if components == 1
                    {
                        month_date = "\(components) Day"
                    }
                    else
                    {
                        month_date = "\(components) Days"
                    }
                }
                else
                {
                    if components_month == 1
                    {
                        month_date = "\(components_month) mnth"
                    }
                    else
                    {
                        month_date = "\(components_month) mnths"
                    }
                }
            ago_date = "in " + month_date
        }
    }
        return ago_date
    }
    // this function is used to convert one date format to another
    func convertDateFormatter(date: String, format_final : String, format_start : String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format_start//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let convertedDate = dateFormatter.date(from: date)
        
        guard dateFormatter.date(from: date) != nil else {
           // assert(false, "no date from string")
            return ""
        }
        dateFormatter.dateFormat = format_final ///this is what you want to convert format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let timeStamp = dateFormatter.string(from: convertedDate!)
        
        return timeStamp
        
    }
    
}

