//
//  AlertViewBuilder.swift
//  TODOLIST
//
//  Created by Leonardo Piovezan on 15/09/17.
//  Copyright © 2017 Leonardo Piovezan. All rights reserved.
//

import UIKit

class AlertViewManager{


    private init(){

    }

    static let shared = AlertViewManager()

    func getYesOrNoAlertWith(title:String, message: String, style:UIAlertControllerStyle, action:@escaping ()->())->UIAlertController {

        let confirmationAction = getActionWith(title: "Sim", style: .destructive, action: action)

        let cancelAction = getActionWith(title: "Não", style: .cancel, action: {return})

        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)

        alertController.addAction(confirmationAction)
        alertController.addAction(cancelAction)

        return alertController


    }

    private func getActionWith(title:String,style:UIAlertActionStyle, action:@escaping ()->()?) -> UIAlertAction{

        let alertAction = UIAlertAction(title: title, style: style) { (alert) in
            action()
        }
        return alertAction
    }


}
