//
//  ViewController.swift
//  touchup and faceid
//
//  Created by mymac on 08/01/24.
//

import UIKit
import LocalAuthentication
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Authorize", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    @objc func didTapButton(){
      let context = LAContext()
        var error:NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,error: &error){
            let reason = "please authorized with touch id!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason ){
                [weak self] success,error in
                guard success,error == nil else{
                    let alert = UIAlertController(title: "Failed", message: "you cant use this feature", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler: nil))
                    self?.present(alert,animated: true,completion: nil)
                    return
                }
                //show other screen
                //succes
                let vc = UIViewController()
                vc.title = "WELCOME"
                vc.view.backgroundColor = .systemBlue
                self?.present(UINavigationController(rootViewController: vc),animated: true,completion: nil)
                
            }
            
        }
        else{
            
        }
    }

}

