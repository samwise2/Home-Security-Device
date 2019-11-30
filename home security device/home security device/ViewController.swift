//
//  ViewController.swift
//  home security device
//
//  Created by Sam Orend on 2019-11-25.
//  Copyright © 2019 Sam Orend. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let dataSource = ["At Home", "Sleeping", "Away"]
    
    
    
    
    var counter = 0
    @IBOutlet weak var DoorSwitch: UISwitch!
    @IBOutlet weak var MotionSwitch: UISwitch!
    @IBOutlet weak var BuzzerSwitch: UISwitch!
    @IBOutlet var background: UIImageView!
    @IBOutlet weak var picker: UIPickerView!
    
    var myPhoton : ParticleDevice?
    //var button = dropDownBtn()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ParticleCloud.sharedInstance().login(withUser:
        "erfanghafoori@gmail.com", password: "Particle1"){
            (error:Error?)-> Void in
            if let _ = error{
                print("Wrong credentials or no internet connectivity, please try again")
            }
            else {
                print("Logged in")
            }
        }
        
        ParticleCloud.sharedInstance().getDevices { (devices: [ParticleDevice]?, error:Error?) -> Void in
            if let _ = error {
                print("Check your internet connectivity")
            }
            else {
                if let d = devices {
                    for device in d {
                        if device.name == "Ishan" {
                            self.myPhoton = device
                            //print("done")
                        }
                    }
                }
            }
        }
        
        //print(myPhoton)
       
        /*
        var myPhoton : ParticleDevice? = nil
        ParticleCloud.sharedInstance().getDevice("290059000251353530373132", completion: { (device:ParticleDevice?, error:Error?) -> Void in
            if let d = device {
                myPhoton = d
            }
        })
 */
        
        /*
        if(myPhoton == nil)
        {
            print("no");
        }
 */
        //string x;
     //   let x = myPhoton?.getVariable("hello")
     //   print(x!)

        
        /*
        let myDeviceVariables : Dictionary? = myPhoton?.variables
        print("MyDevice first Variable is called \(String(describing: myDeviceVariables?.keys.first)) and is from type \(String(describing: myDeviceVariables?.values.first))")
 */
  
            //print("good")
        
        /*var handler : Any?
        handler =
            ParticleCloud.sharedInstance().subscribeToAllEvents(withPrefix: "motion", handler: {(event :ParticleEvent?, error: Error?) in
                if let _ = error {
                    print("could not sub")
                }
                else {
                    DispatchQueue.main.async(execute: {
                        print(event?.data)
                       // print("got event with data \(event?.data)")
                    })
                }
        })*/
        
        /*var eventListenerID : Any?
        eventListenerID =
            ParticleCloud.sharedInstance().subscribeToMyDevicesEvents(withPrefix: "1", handler: handler as? ParticleEventHandler)*/
        /*if(event?.data == 1)
        {
            print(event?.data)
        }*/
        //print(eventListenerID)
        
        
        //var item = eventListenerID
        
       /* if(item != nil) {
            print(item)
        }*/
        
        if (self.BuzzerSwitch.isOn == true){
            
            let funcArgs = ["D6", 1] as [Any]
            var task = myPhoton!.callFunction("digitalWrite", withArguments: funcArgs) { (resultCode : NSNumber?, error: Error?) -> Void in
                if (error == nil) {
                    print("Buzzer")
                }
            }
            var bytesToReceive : Int64 = task.countOfBytesExpectedToReceive
            
        }

        
        
        
        
        
        /*
            myPhoton?.getVariable("motion", completion: {
            (result:Any?, error:Error?) -> Void in
            if let _ = error {
                print("Failed reading motion variable")
            }
            else {
                if let motion = result as? NSNumber {
                    print("Motion is on: \(motion.stringValue) motion")
                    print("rgbrg")
                }
            }
        })
   */
 
        
      
        /*if (self.BuzzerSwitch.isOn == true){
      
                let funcArgs = ["D6", 1] as [Any]
                var task = myPhoton!.callFunction("digitalWrite", withArguments: funcArgs) { (resultCode : NSNumber?, error: Error?) -> Void in
                    if (error == nil) {
                        print("Buzzer")
                    }
                }
                var bytesToReceive : Int64 = task.countOfBytesExpectedToReceive
 
        }
        
        if (self.BuzzerSwitch.isOn == true){
            
            let funcArgs = ["D1", 1] as [Any]
            var task = myPhoton!.callFunction("digitalWrite", withArguments: funcArgs) { (resultCode : NSNumber?, error: Error?) -> Void in
                if (error == nil) {
                    print("Buzzer")
                }
            }
            var bytesToReceive : Int64 = task.countOfBytesExpectedToReceive
            
        }
/*
        if (self.BuzzerSwitch.isOn == false){
            
            let funcArgs1 = ["D1", 0] as [Any]
            var task1 = myPhoton!.callFunction("digitalWrite1", withArguments: funcArgs1) { (resultCode1 : NSNumber?, error1: Error?) -> Void in
                if (error1 == nil) {
                    print("Buzzer")
                }
            }
            var bytesToReceive1 : Int64 = task1.countOfBytesExpectedToReceive
            
        }*/
*/
       
        /*
        if (self.DoorSwitch.isOn == false){
           
            let funcArgs = ["D6", 0] as [Any]
            var task = myPhoton!.callFunction("digitalWrite", withArguments: funcArgs) { (resultCode : NSNumber?, error: Error?) -> Void in
                if (error == nil) {
                    print("Off")
                }
            }
            var bytesToReceive : Int64 = task.countOfBytesExpectedToReceive
       
        }
 */
 
        
        
        
        picker.dataSource = self
        picker.delegate = self
        
        //Configure the button
        //button = dropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        //button.setTitle("At Home", for: .normal)
        //button.translatesAutoresizingMaskIntoConstraints = false
        
        //Add Button to the View Controller
        //self.view.addSubview(button)
        //button Constraints
       // NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 180.0).isActive = true
       // NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: view, attribute:.bottomMargin, multiplier: 1.0, constant:-310.0).isActive = true
        //button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        //var xPos = 50.0
        //var yPos = 50.0
        //button.frame = CGRectMake(CGFloat(xPos),CGFloat(yPos), 50 .width)
       // button.widthAnchor.constraint(equalToConstant: 100).isActive = true
       // button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Set the drop down menu's options
        //button.dropView.dropDownOptions = ["At Home", "Sleeping", "Away"]
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doorLockToggled(_ sender: Any) {
        //var newImage : UIImage = UIImage(named:"securedHomeScreen")!
        if(DoorSwitch.isOn)
        {
            background.image = UIImage(named: "secured")
            print(myPhoton)
            print("seperator")
            //let myDeviceVariables : Dictionary? = myPhoton?.variables as? Dictionary<String,String>
           // print(myDeviceVariables!.keys.first)
        }
        else if(!DoorSwitch.isOn)
        {
            background.image = UIImage(named: "homeScreen")
        }
    }
    

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView)
        -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //detailLabel.text = dataSource[row]
        //picks given thing
        if dataSource[row] == "Away"
        {
            background.image = UIImage(named: "secured")
            BuzzerSwitch.isOn=true;
            DoorSwitch.isOn = true;
            MotionSwitch.isOn = true;
        }
        if dataSource[row] == "At Home"
        {
            background.image = UIImage(named: "secured")
            BuzzerSwitch.isOn = false
            DoorSwitch.isOn = true
            MotionSwitch.isOn = false;
        }
        if dataSource[row] == "Sleeping" {
            background.image = UIImage(named: "secured")
            DoorSwitch.isOn = true
            MotionSwitch.isOn = true
            BuzzerSwitch.isOn = false
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
    
}

/*protocol dropDownProtocol {
    func dropDownPressed(string : String)
}

class dropDownBtn: UIButton, dropDownProtocol {
    
    func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        self.dismissDropDown()
    }
    
    var dropView = dropDownView()
    
    var height = NSLayoutConstraint()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
        
        dropView = dropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 25)
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
            
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
            
        }
    }
    
    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource  {
    
    var dropDownOptions = [String]()
    
    var tableView = UITableView()
    
    var delegate : dropDownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.backgroundColor = UIColor.darkGray
        self.backgroundColor = UIColor.darkGray
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.backgroundColor = UIColor.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}*/


