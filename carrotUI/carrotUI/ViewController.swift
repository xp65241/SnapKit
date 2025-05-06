//
//  ViewController.swift
//  carrotUI
//
//  Created by 김성민 on 4/30/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.numberOfLines = 0
        mainLabel.lineBreakMode = .byWordWrapping
        mainLabel.text = "동네라서 가능한 모든것 \n 당근에서 가까운 이웃과 함께해요."
        mainLabel.textAlignment = .center
        mainLabel.font = UIFont(name: "Pretendard-Bold" , size: 18)
        return mainLabel
    }()
    
    
    let idTextField: UITextField = {
        let idTextField = UITextField()
        idTextField.attributedPlaceholder = NSAttributedString(
            string: "아이디", attributes: [
                .foregroundColor: UIColor(named: "ACB0B9")!,
                .font: UIFont(name: "Pretendard-SemiBold" , size: 14)!,
            ]
        )
        idTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        idTextField.leftViewMode = .always
        idTextField.layer.cornerRadius = 3
        idTextField.backgroundColor = UIColor(named: "DDDEE3")
        return idTextField
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호", attributes: [
                .foregroundColor: UIColor(named: "ACB0B9")!,
                .font: UIFont(name: "Pretendard-SemiBold" , size: 14)!,
            ]
        )
        
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.cornerRadius = 3
        passwordTextField.backgroundColor = UIColor(named: "DDDEE3")
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .whileEditing
        return passwordTextField
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Pretendard-Bold" , size: 18)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 6
        loginButton.backgroundColor = UIColor(named: "FF6F0F")
        return loginButton
    }()
    
    let seeButton: UIButton = {
        let seeButton = UIButton()
        seeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        seeButton.tintColor = .black
        return seeButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        

        
        loginButton.addTarget(self, action: #selector(moveToViewController2), for: .touchUpInside)
        seeButton.addTarget(self, action: #selector(showPassword), for: .touchDown)
        seeButton.addTarget(self, action: #selector(hidePassword), for: [.touchUpInside , .touchUpOutside])
        
        setUpUI()
        setUpUIConstraints()
        
    }
    
//    @objc func moveToViewController2() {
//        let nextViewController = ViewController2()
//        self.navigationController?.pushViewController(nextViewController, animated: true)
//    }
    
    @objc func moveToViewController2() {
        let nVC = ViewController2()
        present(nVC, animated: true)
    }
    
    
    
    @objc func showPassword(){
        passwordTextField.isSecureTextEntry = false
    }
    @objc func hidePassword(){
        passwordTextField.isSecureTextEntry = true
    }
    
    

}


extension ViewController{


    func setUpUI () {
        view.backgroundColor = .white
        
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(mainLabel)
        view.addSubview(loginButton)
        view.addSubview(seeButton)
    }

    
    
    func setUpUIConstraints() {
        mainLabel.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(view.snp.top).offset(170)
            $0.leading.equalTo(view.snp.leading).offset(70)
            $0.trailing.equalTo(view.snp.trailing).offset(-69)
        }
        
        idTextField.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(view.snp.top).offset(276)
            $0.height.equalTo(52)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.leading.equalTo(view.snp.leading).inset(20)
            $0.trailing.equalTo(view.snp.trailing).inset(20)
            $0.height.equalTo(57)
        }
        
        seeButton.snp.makeConstraints {
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-30)
            $0.width.equalTo(15)
            $0.height.equalTo(10)
            $0.centerY.equalTo(passwordTextField.snp.centerY)
        }
    }
}
