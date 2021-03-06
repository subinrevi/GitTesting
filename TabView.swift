//
//  TabView.swift
//  BlueTeleMed
// New details added
//  Created by Hussanal Faroke on 03/05/20.
//  Copyright © 2020 Subin Revi. All rights reserved.
//

//I am trying to reciprocate a conflict during rebase

//import UIKit - I have commented this since we are using Foundataion only here

//Now i will go back to the previous way of doing this

protocol TabViewDelegateMaster: class {

    func didTapAppointments()
    func didTapProfile()
    
}


class TabView: UIView {

    var delegateTestMaster:TabViewDelegate?
    private static var tabView: TabView = Bundle.main.loadNibNamed("TabView",
                     owner: nil,
                     options: nil)?.first as! TabView

    var isVisibleMasterChange = true
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBAction func didTapAppointmentButton(_ sender: Any) {
        delegate?.didTapAppointments()
    }
    
    @IBAction func didTapProfileButton(_ sender: Any) {
        delegate?.didTapProfile()
    }
    
    
    public static func loadInWindow()
    {
        
        let window = UIApplication.shared.keyWindow!
                  
        TabView.tabView.frame = CGRect(x: 0, y: window.frame.height - 81, width: window.frame.width, height: (TabView.tabView.frame.height))
                   
                   
        let swipeGestureRecognizer = UITapGestureRecognizer(target: TabView.tabView, action: #selector(TabView.tabView.windowTap))
                   window.addSubview(TabView.tabView)
            window.addGestureRecognizer(swipeGestureRecognizer)
        }
    
    
        @objc
    public func windowTap()
        {
            UIView.animate(withDuration: 3, animations: {
                       
                if(self.isVisible)
                       {
                        TabView.tabView.frame = CGRect(x: 0, y: TabView.tabView.frame.origin.y + TabView.tabView.frame.height, width: TabView.tabView.frame.width, height: TabView.tabView.frame.height)
                       }
                       else{
                    TabView.tabView.frame = CGRect(x: 0, y: TabView.tabView.frame.origin.y - TabView.tabView.frame.height, width: TabView.tabView.frame.width, height: TabView.tabView.frame.height)
                       }
                       
                self.isVisible = !(self.isVisible)
                       
                   })
    }
    
}
