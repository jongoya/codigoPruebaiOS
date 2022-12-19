//
//  NavigationBar.swift
//  sae
//
//  Created by Mac Mini 5 on 6/6/22.
//

import UIKit

class NavigationBar: UIView {
    var backButtonView: UIView!
    var backButtonWidthConstraint: NSLayoutConstraint!
    var bellButtonView: UIView!
    var informationButtonView: UIView!
    var navigationBarDelegate: NavigationBarDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        loadContentView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadContentView()
    }
    
    private func loadContentView() {
        backgroundColor = .white
        addBackButton()
        addAppLogo()
        addBellButton()
        addInformationButton()
    }
    
    private func addBackButton() {
        backButtonView = UIView(frame: .zero)
        backButtonView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backButtonView)
        backButtonView.clipsToBounds = true
        backButtonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        backButtonView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButtonWidthConstraint = backButtonView.widthAnchor.constraint(equalToConstant: 40)
        backButtonWidthConstraint.isActive = true
        backButtonView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        addBackImage()
        
        let backButton = UIButton(type: .custom)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButtonView.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        backButton.leadingAnchor.constraint(equalTo: backButtonView.leadingAnchor).isActive = true
        backButton.trailingAnchor.constraint(equalTo: backButtonView.trailingAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: backButtonView.topAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: backButtonView.bottomAnchor).isActive = true
    }
    
    private func addBackImage() {
        let arrowImage: UIImageView = UIImageView(frame: .zero)
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.image = UIImage(systemName: "arrow.left")
        arrowImage.tintColor = .black
        backButtonView.addSubview(arrowImage)
        
        arrowImage.centerYAnchor.constraint(equalTo: backButtonView.centerYAnchor).isActive = true
        arrowImage.centerXAnchor.constraint(equalTo: backButtonView.centerXAnchor).isActive = true
        arrowImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        arrowImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    private func addAppLogo() {
        let logoImage: UIImageView = UIImageView(frame: .zero)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "")
        logoImage.contentMode = .scaleAspectFit
        addSubview(logoImage)
        
        logoImage.leadingAnchor.constraint(equalTo: backButtonView.trailingAnchor, constant: 10).isActive = true
        logoImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func addBellButton() {
        bellButtonView = UIView(frame: .zero)
        bellButtonView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bellButtonView)
        bellButtonView.clipsToBounds = true
        bellButtonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        bellButtonView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bellButtonView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        bellButtonView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        
        addBellImage()
        
        let bellButton = UIButton(type: .custom)
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        bellButtonView.addSubview(bellButton)
        bellButton.addTarget(self, action: #selector(bellButtonPressed(_:)), for: .touchUpInside)
        bellButton.leadingAnchor.constraint(equalTo: bellButtonView.leadingAnchor).isActive = true
        bellButton.trailingAnchor.constraint(equalTo: bellButtonView.trailingAnchor).isActive = true
        bellButton.topAnchor.constraint(equalTo: bellButtonView.topAnchor).isActive = true
        bellButton.bottomAnchor.constraint(equalTo: bellButtonView.bottomAnchor).isActive = true
    }
    
    private func addBellImage() {
        let bellImage: UIImageView = UIImageView(frame: .zero)
        bellImage.translatesAutoresizingMaskIntoConstraints = false
        bellImage.image = UIImage(named: "bell")
        bellImage.contentMode = .scaleAspectFit
        bellImage.tintColor = .black
        bellButtonView.addSubview(bellImage)
        
        bellImage.centerYAnchor.constraint(equalTo: bellButtonView.centerYAnchor).isActive = true
        bellImage.centerXAnchor.constraint(equalTo: bellButtonView.centerXAnchor).isActive = true
        bellImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        bellImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    private func addInformationButton() {
        informationButtonView = UIView(frame: .zero)
        informationButtonView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(informationButtonView)
        informationButtonView.clipsToBounds = true
        informationButtonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        informationButtonView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        informationButtonView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        informationButtonView.trailingAnchor.constraint(equalTo: bellButtonView.leadingAnchor).isActive = true
        
        addInfoImage()
        
        let infoButton = UIButton(type: .custom)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        informationButtonView.addSubview(infoButton)
        infoButton.addTarget(self, action: #selector(informationButtonPressed(_:)), for: .touchUpInside)
        infoButton.leadingAnchor.constraint(equalTo: informationButtonView.leadingAnchor).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: informationButtonView.trailingAnchor).isActive = true
        infoButton.topAnchor.constraint(equalTo: informationButtonView.topAnchor).isActive = true
        infoButton.bottomAnchor.constraint(equalTo: informationButtonView.bottomAnchor).isActive = true
    }
    
    private func addInfoImage() {
        let infoImage: UIImageView = UIImageView(frame: .zero)
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        infoImage.image = UIImage(named: "info")
        infoImage.tintColor = .black
        informationButtonView.addSubview(infoImage)
        
        infoImage.centerYAnchor.constraint(equalTo: informationButtonView.centerYAnchor).isActive = true
        infoImage.centerXAnchor.constraint(equalTo: informationButtonView.centerXAnchor).isActive = true
        infoImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        infoImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func hideBackButton() {
        backButtonWidthConstraint.constant = 0
    }
    
    func showBackButton() {
        backButtonWidthConstraint.constant = 40
    }
    
    func showBellButton() {
        bellButtonView.isHidden = false
    }
    
    func hideBellButton() {
        bellButtonView.isHidden = true
    }
    
    func hideInformationButton() {
        informationButtonView.isHidden = true
    }
    
    func showInformationButton() {
        informationButtonView.isHidden = false
    }
    
    func setNavigationDelegate(delegate: NavigationBarDelegate) {
        self.navigationBarDelegate = delegate
    }
    
    @objc private func backButtonPressed(_ sender: AnyObject) {
        navigationBarDelegate.backButtonPressed()
    }
    
    @objc private func bellButtonPressed(_ sender: AnyObject) {
        navigationBarDelegate.bellButtonPressed()
    }
    
    @objc private func informationButtonPressed(_ sender: AnyObject) {
        navigationBarDelegate.informationButtonPressed()
    }
}
