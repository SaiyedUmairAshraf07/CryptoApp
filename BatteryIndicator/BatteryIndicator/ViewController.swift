//
//  ViewController.swift
//  BatteryIndicator
//
//  Created by cedcoss on 04/12/25.
//

import UIKit

enum BatteryStatus{
    
    case fullCharge
    
    case halfCharge
    
    case lowCharge
    
    case charging
    
    case unplugged
}

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var batteryImg: UIImageView!
    
    @IBOutlet weak var batteryLabel: UILabel!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    
    var level: Int = 0
    
    var status: BatteryStatus = BatteryStatus.unplugged
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDevice.current.isBatteryMonitoringEnabled = true
        self.view.backgroundColor = .gray.withAlphaComponent(0.5)
//        getCurrentBatteryLevel()

        initView()
    }

    func initView() {
        
        self.refreshButton.addTarget(self, action: #selector(refreshPressed), for: .touchUpInside)
        
        self.refreshButton.tintColor = UIColor.black
        self.refreshButton.setTitle( "Refresh", for: .normal)
        self.refreshButton.backgroundColor = .systemBlue
        
        self.containerView.backgroundColor = .red.withAlphaComponent(0.2)

        self.batteryImg.contentMode = .scaleAspectFit
        self.batteryLabel.textAlignment = .center
        self.batteryLabel.font = UIFont.systemFont(ofSize: 30)
        self.batteryLabel.textColor = .black
        
        getCurrentBatteryLevel()
        
        
    }
    
    //TERMINAL CODE : xcrun simctl status_bar booted override --batteryState discharging --batteryLevel 20

    func getCurrentBatteryLevel() {
        
        let levelFloat = UIDevice.current.batteryLevel

        let percent = levelFloat < 0 ? -1 : Int(levelFloat * 100)
        
        let status = UIDevice.current.batteryState.rawValue
        
        debugPrint("Level : \(percent) % Status : \(status)")
        
//        self.level = level
        
    }

    
    func setUpView() {
        
        
        
    }
    
    @objc func refreshPressed() {
        
        print("REFRESHED PRESSED")
        
        getCurrentBatteryLevel()
        setUpView()
        
    }
}

