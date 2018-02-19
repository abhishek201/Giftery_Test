//
//  TabBarViewController.swift
//  GifteryTest
//
//  Created by abhishek on 17/02/18.
//  Copyright © 2018 abhishek. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    //MARK:- variable declaration
    // declare all variables for the class
    
    var centerButton: UIButton!
    
    //MARK:- variable declaration
    // declare all variables for the class
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         addCenterRaisedButton(buttonImage: gift_image, highlightedButtonImage: gift_image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- functions
    // Add raised button on tab bar
    func addCenterRaisedButton(buttonImage: UIImage, highlightedButtonImage: UIImage) {
        centerButton = UIButton(type: .custom)
        centerButton.frame = CGRect(x: 0, y: 0, width: 68, height: 68)
        centerButton.setImage(buttonImage, for: .normal)
        centerButton.setImage(highlightedButtonImage, for: .selected)
        centerButton.contentMode = .scaleAspectFit
        /* Turn off button shadow when pressed */
        centerButton.adjustsImageWhenHighlighted = false
        centerButton.addTarget(self, action: #selector(centerButtonPressed(_:)), for: .touchUpInside)
        self.tabBar.addSubview(centerButton)
        
        centerButton.translatesAutoresizingMaskIntoConstraints = true
        
        print("width %f",UIScreen.main.bounds.size.width)
        if UIScreen.main.bounds.size.width == 320
        {
            centerButton.frame = CGRect(x: (self.view.frame.size.width - centerButton.frame.size.width)/2 + centerButton.frame.size.width/1.6, y: -(centerButton.frame.size.height)/1.6, width: centerButton.frame.size.width, height: centerButton.frame.size.width)
        }
        else if UIScreen.main.bounds.size.width == 375
        {
            centerButton.frame = CGRect(x: (self.view.frame.size.width - centerButton.frame.size.width)/2 + centerButton.frame.size.width/1.5, y: -(centerButton.frame.size.height)/1.6, width: centerButton.frame.size.width, height: centerButton.frame.size.width)
        }
        else
        {
        centerButton.frame = CGRect(x: (self.view.frame.size.width - centerButton.frame.size.width)/2 + centerButton.frame.size.width/1.2, y: -(centerButton.frame.size.height)/1.6, width: centerButton.frame.size.width, height: centerButton.frame.size.width)
        }
        centerButton.backgroundColor = tab_selected_color
        centerButton.layer.cornerRadius = centerButton.frame.size.width/2
    }
    // Center button action
    @objc func centerButtonPressed(_ sender: UIButton) {
        self.selectedIndex = 2
        sender.isSelected = true
    }
}
//MARK:- UITabBar Extension
// UITabBarDelegate
extension TabBarViewController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if self.tabBarController?.selectedIndex != 2 {
            centerButton.isSelected = false
        }
    }
}
