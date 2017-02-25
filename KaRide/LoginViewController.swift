
//
//  LoginViewController.swift
//  KaRide
//
//  Created by Elliot Licht on 25/02/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit
import Firebase
import FacebookCore
import FacebookLogin


class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginDidTouch(_ sender: Any) {
        
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile], viewController: self) { loginResult in
            switch loginResult {
                
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                print(accessToken)
                
                let connection = GraphRequestConnection()
                connection.add(GraphRequest(graphPath: "/me?fields=first_name")) { httpResponse, result in
                    switch result {
                    case .success(let response):
                        print("Graph Request Succeeded: \(response.dictionaryValue!)")
                        let userID: String = response.dictionaryValue!["id"] as! String
                        let firstName: String = response.dictionaryValue!["first_name"] as! String
                        //  self.imageOutlet.downloadedFrom(link: "https://graph.facebook.com/\(userID)/picture?type=large")
                        
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        
                        //                 print(AccessToken.current?.authenticationToken)
                        
                        let credential = FIRFacebookAuthProvider.credential(withAccessToken: (AccessToken.current?.authenticationToken)!)
                        
                        
                        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
                            // ...
                            if let error = error {
                                // ...
                                print(error)
                                return
                            }
                            print("LOGIN SEQUENCE")
                            //         print(user)
                            
                            if let userLoged = user {
                                
                               FirebaseHelper.sharedInstance.ref.child("Users").child(userLoged.uid).child("Public").setValue(["FacebookID": userID, "name": firstName, "photo": "https://graph.facebook.com/\(userID)/picture?type=large"])
                                
                              //  CurrentUser.sharedInstance.createProfile(name: firstName, imageLink: "https://graph.facebook.com/\(userID)/picture?type=large", description: "no data")
                                
                              //  print(CurrentUser.sharedInstance.profile)
                                
                                self.performSegue(withIdentifier: "login", sender: self)
                                
                            
                                
                            }
                            
                        }
                        
                        
                    case .failed(let error):
                        print("Graph Request Failed: \(error)")
                    }
                }
                connection.start()
                
            }
            
        }

        
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
