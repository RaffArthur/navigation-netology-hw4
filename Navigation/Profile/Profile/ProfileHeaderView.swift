//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Arthur Raff on 02.10.2020.
//

import UIKit
class ProfileHeaderView: UIView {
    
    // MARK: - Properties
    private lazy var photoProfile: UIImageView = {
        var photoProfile = UIImageView()
        photoProfile.toAutoLayout()
        photoProfile.isUserInteractionEnabled = true
        photoProfile.image = UIImage(named: "haskey_avatar")
        photoProfile.layer.masksToBounds = true
        photoProfile.layer.borderColor = UIColor.white.cgColor
        photoProfile.layer.borderWidth = 3
        
        return photoProfile
    }()
    private lazy var nameProfile: UILabel = {
        var nameProfile = UILabel()
        nameProfile.toAutoLayout()
        nameProfile.font = .systemFont(ofSize: 18, weight: .heavy)
        nameProfile.textAlignment = .left
        nameProfile.text = "Dmitry \"Haskey\""
        nameProfile.textColor = .black
        
        return nameProfile
    }()
    private lazy var statusBarProfile: UILabel = {
        var statusBarProfile = UILabel()
        statusBarProfile.toAutoLayout()
        statusBarProfile.font = .systemFont(ofSize: 14,weight: .regular)
        statusBarProfile.textAlignment = .left
        statusBarProfile.text = "Add your profile status..."
        statusBarProfile.textColor = .darkGray
        
        return statusBarProfile
    }()
    private lazy var buttonStatusProfile: UIButton = {
        var buttonStatusProfile = UIButton()
        buttonStatusProfile.toAutoLayout()
        buttonStatusProfile.setTitle("Set my status 👀", for: buttonStatusProfile.state)
        buttonStatusProfile.titleLabel!.font = .systemFont(ofSize: 18, weight: .bold)
        buttonStatusProfile.backgroundColor = UIColor(named: "color_set")
        buttonStatusProfile.layer.cornerRadius = 12
        buttonStatusProfile.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonStatusProfile.layer.shadowColor = UIColor.black.cgColor
        buttonStatusProfile.layer.shadowRadius = 4
        buttonStatusProfile.layer.shadowOpacity = 0.2
        buttonStatusProfile.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
                
        return buttonStatusProfile
    }()
    private lazy var textFieldProfile: UITextField = {
        var textfieldProfile = UITextField()
        textfieldProfile.toAutoLayout()
        textfieldProfile.clearsOnBeginEditing = true
        textfieldProfile.leftView = UIView(frame: CGRect(
                                            x: 0,
                                            y: 0,
                                            width: 10,
                                            height: textfieldProfile.frame.height))
        textfieldProfile.leftViewMode = .always
        textfieldProfile.backgroundColor = .white
        textfieldProfile.font = .systemFont(ofSize: 15,weight: .regular)
        textfieldProfile.placeholder = "Type status here..."
        textfieldProfile.textColor = .black
        textfieldProfile.layer.cornerRadius = 12
        textfieldProfile.layer.borderWidth = 3
        textfieldProfile.layer.borderColor = UIColor.darkGray.cgColor
        textfieldProfile.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)

        return textfieldProfile
    }()
    private lazy var statusText = String()
//    private lazy var tapGestureRecognizer = UIGestureRecognizer(target: self, action: #selector(photoSizeChaged))

    // MARK: - Initis
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        tapGestureRecognizer.delegate = self
        
//        photoProfile.addGestureRecognizer(tapGestureRecognizer)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Subviews funcs
    func setupLayout() {
        addSubview(photoProfile)
        addSubview(nameProfile)
        addSubview(statusBarProfile)
        addSubview(buttonStatusProfile)
        addSubview(textFieldProfile)
        
        let constraints = [
            photoProfile.heightAnchor.constraint(equalToConstant: 100),
            photoProfile.widthAnchor.constraint(equalToConstant: 100),
            photoProfile.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            photoProfile.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            nameProfile.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameProfile.leadingAnchor.constraint(equalTo: photoProfile.trailingAnchor, constant: 16),
            nameProfile.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            statusBarProfile.topAnchor.constraint(equalTo: nameProfile.bottomAnchor , constant: 8),
            statusBarProfile.leadingAnchor.constraint(equalTo: photoProfile.trailingAnchor, constant: 16),
            statusBarProfile.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            textFieldProfile.heightAnchor.constraint(equalToConstant: 40),
            textFieldProfile.leadingAnchor.constraint(equalTo: photoProfile.trailingAnchor, constant: 16),
            textFieldProfile.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textFieldProfile.bottomAnchor.constraint(equalTo: photoProfile.bottomAnchor),
            
            buttonStatusProfile.heightAnchor.constraint(equalToConstant: 50),
            buttonStatusProfile.topAnchor.constraint(equalTo: photoProfile.bottomAnchor, constant: 16),
            buttonStatusProfile.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            buttonStatusProfile.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buttonStatusProfile.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoProfile.layer.cornerRadius = photoProfile.frame.height / 2
    }
    
    // MARK: - @objc Actions
    @objc private func buttonPressed() {
        statusBarProfile.text = statusText
        print("\(String(describing: statusBarProfile.text!))")
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text!
    }
    
    @objc private func photoSizeChaged(_ gestureRecognizer: UIGestureRecognizer) {
        photoProfile.image = #imageLiteral(resourceName: "photo_11")
        photoProfile.layer.cornerRadius = 100
        
        print("GOG")

    }
}

//extension ProfileHeaderView: UIGestureRecognizerDelegate {
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
//}
