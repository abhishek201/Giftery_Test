//
//  EventViewController.swift
//  GifteryTest
//
//  Created by abhishek on 17/02/18.
//  Copyright © 2018 abhishek. All rights reserved.
//

import UIKit

class EventViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //MARK:- variable declaration
    // declare all variables for the class
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var plusButton: UIButton!
    var array_events = NSMutableArray()
    var cellReuseIdentifier = "eventCell"
    
    //MARK:- class functions
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 100;
        plusButton.layer.cornerRadius = plusButton.frame.size.height/2
        array_events = CommonValidations().readJsonFileFromBundle(file_name: "jsonresponse")
        tableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        //tableView.register(EventTableViewCell, forCellReuseIdentifier: cellReuseIdentifier)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- tableview functions
    // tableview delegates and datasource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! EventTableViewCell
        cell.setData(event_dic: array_events.object(at: indexPath.row) as! NSDictionary)
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
