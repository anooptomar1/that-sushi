//
//  resultViewController.swift
//  that_sushi
//
//  Created by Atsushi KONISHI on 2017/09/11.
//  Copyright © 2017年 小西篤志. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    
    var cameraEvent: CameraEvent?
    
    //typealias Callback = () -> Void
    
    var takePicture: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func retake(_ sender: Any) {
        dismiss(animated: false, completion: cameraEvent?.tocamera)
    }
    
    @IBAction func back_to_home(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func toDetail(_ sender: Any) {
        performSegue(withIdentifier: "toDetailfromResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC: detailViewController = segue.destination as! detailViewController
//        nextVC.receivedItem =
        nextVC.parentID = self.restorationIdentifier!
    }
}

protocol CameraEvent {
    func tocamera()
}
