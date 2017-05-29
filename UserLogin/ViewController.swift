//
//  ViewController.swift
//  UserLogin
//
//  Created by Kien Nguyen Duc on 5/17/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtf_user: UITextField!
    @IBOutlet weak var txtf_password: UITextField!
    
    @IBOutlet weak var lbl_noti: UILabel!
    
    
    
    
    var account = ["kien":"111", " user1":"1", "user2":"2"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var count = 0
    
    @IBAction func btn_login(_ sender: UIButton) {
        if let password = account[txtf_user.text!] {
            if password == txtf_password.text{
                lbl_noti.text = "Đăng nhập thành công!"
                
            }else{
            lbl_noti.text = "Mật khẩu không đúng!"
            }
        }else {
            lbl_noti.text = "Tài khoản không tồn tại!"
        }
        
    }
    
    
    //Đăng ký tài khoản mới
    @IBAction func btn_register(_ sender: UIButton) {
        if let check = account[txtf_user.text!]{
            lbl_noti.text = "Tài khoản đã tồn tại!"
        }
        else if (txtf_user.text == "") {
            lbl_noti.text = "Chưa nhập tên tài khoản!"
            
        }else if (txtf_password.text == "") {
            lbl_noti.text = "Chưa nhập mật khẩu!"
        }else {
            account[txtf_user.text!] = txtf_password.text
            lbl_noti.text = "Đăng ký thành công!"
            
        }
        
        
        
    }

    //thay đổi mật khẩu
    @IBAction func btn_edit(_ sender: UIButton) {
        if (count == 0) {
            if let password = account[txtf_user.text!]{
                if password == txtf_password.text{
                    lbl_noti.text = "Nhập mật khẩu mới"
                    count = 1
                }else{
                lbl_noti.text = "Mật khẩu không đúng"
                }
                }
                else  {
                 lbl_noti.text = "Tài khoản không tồn tại"
                
                }
        }
            else if (count == 1){
                account[txtf_user.text!] = txtf_password.text
                lbl_noti.text = "Mật khẩu của bạn đã được thay đổi!"
                
            }
        }
    
    
    //Danh sách tài khoản
    
    @IBAction func btn_list(_ sender: UIButton) {
        var list = ""
        for (key,value) in account {
            list += "\(key) : \(value)\n"
            lbl_noti.text = "\(list)\n"
    }
    }
    
    // Xoá tài khoản
    @IBAction func btn_delete(_ sender: UIButton) {
        if (count == 0) {
            if let password = account[txtf_user.text!]{
                if password == txtf_password.text {
                    lbl_noti.text = "Xác nhận xoá tài khoản?"
                count = 1
                }
                else {
                lbl_noti.text = "Sai mật khẩu!"
                }
            }else {
            lbl_noti.text = "Tài khoản không tồn tại"
            
            }
            
        } else if (count == 1) {
            let delete = txtf_user.text
            account.removeValue(forKey: delete!)
            lbl_noti.text = String("Đã xoá")
        }
        
    }
    
}

