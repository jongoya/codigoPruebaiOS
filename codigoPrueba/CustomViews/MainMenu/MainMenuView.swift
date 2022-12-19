//
//  MainMenuView.swift
//  sae
//
//  Created by Mac Mini 5 on 13/6/22.
//

import Foundation
import UIKit

class MainMenuView: UIView {
    var backgroundView: UIView!
    var menuLayout: UIView!
    var superView: UIView!
    
    var menuLeadingAnchor: NSLayoutConstraint!
    var menuTrailingAnchor: NSLayoutConstraint!
    var animationDuration: Double = 0.4
    
    var menuArray: [String] = ["Facebook", "Ajustes", "Idiomas", "Sobre la app"]
    var screenWidth = UIScreen.main.bounds.width
    var delegate: MainMenuDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func loadContentView(superView: UIView, delegate: MainMenuDelegate) {
        superView.addSubview(self)
        self.superView = superView
        self.delegate = delegate
        addViewConstraints(superView: superView)
        addBackground()
        addBackgroundButton()
        addMenuLayout()
        addMenu()
    }
    
    private func addViewConstraints(superView: UIView) {
        menuLeadingAnchor = leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: screenWidth)
        menuTrailingAnchor = trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: screenWidth)
        menuLeadingAnchor.isActive = true
        menuTrailingAnchor.isActive = true
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
    
    private func addBackground() {
        backgroundView = UIView(frame: .zero)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .clear
        addSubview(backgroundView)
        
        backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func addBackgroundButton() {
        let backButton = UIButton(type: .custom)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(backButton)
        backButton.setTitle("", for: .normal)
        backButton.addTarget(self, action: #selector(backgroundPressed(_:)), for: .touchUpInside)
        
        backButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor).isActive = true
        backButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: backgroundView.topAnchor).isActive = true
    }
    
    private func addMenuLayout() {
        menuLayout = UIView()
        menuLayout.translatesAutoresizingMaskIntoConstraints = false
        menuLayout.backgroundColor = .white
        menuLayout.clipsToBounds = true
        addSubview(menuLayout)
        
        menuLayout.topAnchor.constraint(equalTo: topAnchor).isActive = true
        menuLayout.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        menuLayout.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        menuLayout.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100).isActive = true
    }
    
    private func addTopDivisory() -> UIView {
        let topDivisory: UIView = UIView(frame: .zero)
        topDivisory.translatesAutoresizingMaskIntoConstraints = false
        topDivisory.backgroundColor = .clear
        menuLayout.addSubview(topDivisory)
        
        topDivisory.leadingAnchor.constraint(equalTo: menuLayout.leadingAnchor).isActive = true
        topDivisory.trailingAnchor.constraint(equalTo: menuLayout.trailingAnchor).isActive = true
        topDivisory.topAnchor.constraint(equalTo: menuLayout.topAnchor).isActive = true
        topDivisory.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        return topDivisory
    }
        
    private func addMenu() {
        var lastView: UIView = addTopDivisory()
        for menuOption in menuArray {
            lastView = addItemView(lastView: lastView, text: menuOption)
        }
    }
    
    private func addItemView(lastView: UIView, text: String) -> UIView {
        let itemView: UIView = UIView(frame: .zero)
        itemView.translatesAutoresizingMaskIntoConstraints = false
        menuLayout.addSubview(itemView)
        
        itemView.leadingAnchor.constraint(equalTo: menuLayout.leadingAnchor).isActive = true
        itemView.trailingAnchor.constraint(equalTo: menuLayout.trailingAnchor).isActive = true
        itemView.topAnchor.constraint(equalTo: lastView.bottomAnchor).isActive = true
        itemView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addItemDivisory(itemView: itemView)
        addItemLabel(itemView: itemView, text: text)
        
        return itemView
    }
    
    private func addItemDivisory(itemView: UIView) {
        let divisory: UIView = UIView(frame: .zero)
        divisory.translatesAutoresizingMaskIntoConstraints = false
        divisory.backgroundColor = .lightGray
        itemView.addSubview(divisory)
        
        divisory.leadingAnchor.constraint(equalTo: itemView.leadingAnchor, constant: 10).isActive = true
        divisory.trailingAnchor.constraint(equalTo: itemView.trailingAnchor, constant: -10).isActive = true
        divisory.bottomAnchor.constraint(equalTo: itemView.bottomAnchor).isActive = true
        divisory.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    private func addItemLabel(itemView: UIView, text: String) {
        let itemLabel: UILabel = UILabel(frame: .zero)
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        itemLabel.textColor = .black
        itemLabel.text = text
        itemLabel.font = UIFont.systemFont(ofSize: 15)
        itemView.addSubview(itemLabel)
        
        itemLabel.leadingAnchor.constraint(equalTo: itemView.leadingAnchor, constant: 25).isActive = true
        itemLabel.trailingAnchor.constraint(equalTo: itemView.trailingAnchor, constant: -25).isActive = true
        itemLabel.centerYAnchor.constraint(equalTo: itemView.centerYAnchor).isActive = true
    }
    
    func showMainMenu() {
        menuLeadingAnchor.constant = 0
        menuTrailingAnchor.constant = 0
        UIView.animate(withDuration: animationDuration) {
            self.superView.layoutIfNeeded()
        }
    }
    
    func hideMainMenu() {
        menuLeadingAnchor.constant = screenWidth
        menuTrailingAnchor.constant = screenWidth
        UIView.animate(withDuration: animationDuration) {
            self.superView.layoutIfNeeded()
        }
    }
    
    @objc private func itemPressed(_ sender: UIButton) {
        hideMainMenu()
    }
    
    @objc private func backgroundPressed(_ sender: AnyObject) {
        delegate.menuDismissed()
        hideMainMenu()
    }
}
