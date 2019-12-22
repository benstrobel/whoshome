//
//  ViewController.swift
//  WhosHome
//
//  Created by user162931 on 12/21/19.
//  Copyright © 2019 Benedikt Strobel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SimplePingDelegate{
    
    //MARK: Properties
    
    let home = "Zuhause"
    let nhome = "nicht Zuhause"
    let checking = "Ueberpruefe..."
    
    @IBOutlet weak var gertiLabel: UILabel!
    @IBOutlet weak var williLabel: UILabel!
    @IBOutlet weak var maxiLabel: UILabel!
    @IBOutlet weak var philippLabel: UILabel!
    @IBOutlet weak var benLabel: UILabel!
    
    var gertipinger: SimplePing?
    var willipinger: SimplePing?
    var philipppinger: SimplePing?
    var maxipinger: SimplePing?
    var benpinger: SimplePing?
    //let gertiaddress = "GertiHandy.fritz.box";
    let williaddress = "WilliHandy.fritz.box";
    //let maxiaddress = "MaxiHandy.fritz.box";
    let philippaddress = "PhilippHandy.fritz.box";
    let benaddress = "BenHandy.fritz.box";
    let gertiaddress = "www.google.de"
    let maxiaddress = "benstrobel.de"
    //MARK: Actions
        
    @IBAction func refreshButton(_ sender: UIButton) {
        self.dispatchButton()
    }
    
    func dispatchButton(){
        setLabelNHome(gertiLabel)
        setLabelNHome(williLabel)
        setLabelNHome(maxiLabel)
        setLabelNHome(philippLabel)
        setLabelNHome(benLabel)
        checkGerti()
        checkWilli()
        checkMaxi()
        checkPhilipp()
        checkBen()
    }
    
    func checkGerti(){
        gertipinger = SimplePing(hostName: gertiaddress)
        gertipinger?.delegate = self
        gertipinger?.start()
    }
    
    func checkWilli(){
        willipinger = SimplePing(hostName: williaddress)
        willipinger?.delegate = self
        willipinger?.start()
    }
    
    func checkMaxi(){
        maxipinger = SimplePing(hostName: maxiaddress)
        maxipinger?.delegate = self
        maxipinger?.start()
    }
    
    func checkPhilipp(){
        philipppinger = SimplePing(hostName: philippaddress)
        philipppinger?.delegate = self
        philipppinger?.start()
    }
    
    func checkBen(){
        benpinger = SimplePing(hostName: benaddress)
        benpinger?.delegate = self
        benpinger?.start()
    }
    
    func setLabelHome (_ label: UILabel){
        label.text = home;
        label.textColor = UIColor.green;
        
    }
    
    func setLabelChecking (_ label: UILabel){
        label.text = checking;
        label.textColor = UIColor.orange
    }
    
    func setLabelNHome (_ label: UILabel){
        label.text = nhome;
        label.textColor = UIColor.red;
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func sendPing(_ pinger: SimplePing){
        pinger.send(with: Data("Hallo".utf8))
    }
    func simplePing(_ pinger: SimplePing, didReceivePingResponsePacket packet: Data, sequenceNumber: UInt16) {
        if(pinger.hostName == gertiaddress){
            setLabelHome(gertiLabel)
        }
        if(pinger.hostName == williaddress){
            setLabelHome(williLabel)
        }
        if(pinger.hostName == maxiaddress){
            setLabelHome(maxiLabel)
        }
        if(pinger.hostName == philippaddress){
            setLabelHome(philippLabel)
        }
        if(pinger.hostName == benaddress){
            setLabelHome(benLabel)
        }
        print("Received Response: " + pinger.hostName)
    }
    
    func simplePing(_ pinger: SimplePing, didFailWithError error: Error) {
        print (error)
    }
    
    func simplePing(_ pinger: SimplePing, didStartWithAddress address: Data) {
        print ("Started with address: ")
        self.sendPing(pinger)
    }
    
    func simplePing(_ pinger: SimplePing, didReceiveUnexpectedPacket packet: Data) {
        //print("Unexpected Packet")
    }
    
    func simplePing(_ pinger: SimplePing, didSendPacket packet: Data, sequenceNumber: UInt16) {
        print ("did send packet")
    }
    
    func simplePing(_ pinger: SimplePing, didFailToSendPacket packet: Data, sequenceNumber: UInt16, error: Error) {
        print ("did fail to send packet")
    }
}

