//
//  navigationController.swift
//  carrotUI
//
//  Created by 김성민 on 4/30/25.
//

import UIKit
import SnapKit

final class ViewController2: UIViewController {
    
    let carrotIcon: UIImageView = {
        let carrotIcon = UIImageView()
        carrotIcon.image = UIImage(named: "Icon")
        return carrotIcon
    }()
    
    let subLabel: UILabel = {
        let subLabel = UILabel()
        subLabel.numberOfLines = 0
        subLabel.lineBreakMode = .byWordWrapping
        subLabel.text = "???님\n반가워요!"
        subLabel.textAlignment = .center
        subLabel.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        subLabel.textColor = .black
        return subLabel
    }()
    
    let MainButton: UIButton = {
        let MainButton = UIButton()
        MainButton.setTitle("메인으로", for: .normal)
        MainButton.setTitleColor(.white, for: .normal)
        MainButton.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        MainButton.layer.cornerRadius = 6
        MainButton.backgroundColor = UIColor(named: "FF6F0F")
        return MainButton
    }()
    
    let reLoginButton: UIButton = {
        let reLoginButton = UIButton()
        reLoginButton.setTitle("다시 로그인", for: .normal)
        reLoginButton.setTitleColor(UIColor(named: "B6ACB9"), for: .normal)
        reLoginButton.backgroundColor = UIColor(named: "DDDEE3")
        reLoginButton.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        reLoginButton.layer.cornerRadius = 6
        return reLoginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetUpUI()
        view.backgroundColor = .white
        MainButton.addTarget(self, action: #selector(backViewController), for: .touchUpInside)

    }
    
//    @objc func backViewController() {
//        self.navigationController?.popViewController(animated: true)
//    }
    
    @objc func backViewController() {
        dismiss(animated: true)
    }
    
    

}

extension ViewController2 {
    private func SetUpUI() {
        
        view.addSubview(carrotIcon)
        view.addSubview(subLabel)
        view.addSubview(MainButton)
        view.addSubview(reLoginButton)
        
        carrotIcon.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(88)
            $0.width.height.equalTo(150)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        subLabel.snp.makeConstraints{
            $0.top.equalTo(carrotIcon.snp.bottom).offset(64)
            $0.leading.equalTo(view.snp.leading).offset(140)
            $0.trailing.equalTo(view.snp.trailing).offset(-140)
        }
        
        MainButton.snp.makeConstraints{
            $0.top.equalTo(subLabel.snp.bottom).offset(64)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.height.equalTo(57)
        }
        
        reLoginButton.snp.makeConstraints {
            $0.top.equalTo(MainButton.snp.bottom).offset(15)
            $0.leading.equalTo(MainButton.snp.leading)
            $0.trailing.equalTo(MainButton.snp.trailing)
            $0.height.equalTo(57)
        }
    }
    
}
