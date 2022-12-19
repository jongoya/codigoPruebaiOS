//
//  MainTabBarControllerViewController.swift
//  sae
//
//  Created by Mac Mini 5 on 3/6/22.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    var masView: UIView!
    var masImage: UIImageView!
    var masLabel: UILabel!
    var menu: MainMenuView!
    var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        getAvisos()
        addCustomView()
        addMenuBackground()
        addMainMenu()
    }
    
    private func setTabBar() {
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .black
        let items: [UITabBarItem] = tabBar.items!
        items[0].image = UIImage(named: "home")
        items[0].title = NSLocalizedString("menu_home", comment: "")
        items[0].selectedImage = UIImage(named: "home_selected")
        items[1].image = UIImage(named: "lineas")
        items[1].title = NSLocalizedString("menu_lineas", comment: "")
        items[2].image = UIImage(named: "estrella")
        items[2].title = NSLocalizedString("menu_favoritos", comment: "")
        items[2].selectedImage = UIImage(named: "estrella_rellena")
        items[3].image = UIImage(named: "como")
        items[3].title = NSLocalizedString("menu_como", comment: "")
        items[4].image = UIImage(named: "")
        items[4].title = NSLocalizedString("", comment: "")
    }
    
    private func addCustomView() {
        masView = UIView(frame: .zero)
        masView.translatesAutoresizingMaskIntoConstraints = false
        tabBar.addSubview(masView)
        
        masView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor, constant: -13).isActive = true
        masView.topAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        masView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        masView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addMasButton()
        addMasImage()
        addMasLabel()
    }
    
    private func addMasButton() {
        let masButton = UIButton(type: .custom)
        masButton.translatesAutoresizingMaskIntoConstraints = false
        masView.addSubview(masButton)
        masButton.leadingAnchor.constraint(equalTo: masView.leadingAnchor).isActive = true
        masButton.trailingAnchor.constraint(equalTo: masView.trailingAnchor).isActive = true
        masButton.bottomAnchor.constraint(equalTo: masView.bottomAnchor).isActive = true
        masButton.topAnchor.constraint(equalTo: masView.topAnchor).isActive = true
        masButton.setTitle("", for: .normal)
        masButton.addTarget(self, action: #selector(masPressed(_:)), for: .touchUpInside)
    }
    
    private func addMasImage() {
        masImage = UIImageView(frame: .zero)
        masImage.translatesAutoresizingMaskIntoConstraints = false
        masImage.image = UIImage(named: "mas")
        masImage.contentMode = .scaleAspectFit
        masImage.tintColor = .black
        masView.addSubview(masImage)
        
        masImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        masImage.heightAnchor.constraint(equalToConstant: 22).isActive = true
        masImage.topAnchor.constraint(equalTo: masView.topAnchor, constant: 8).isActive = true
        masImage.centerXAnchor.constraint(equalTo: masView.centerXAnchor).isActive = true
    }
    
    private func addMasLabel() {
        masLabel = UILabel(frame: .zero)
        masLabel.translatesAutoresizingMaskIntoConstraints = false
        masLabel.textColor = .black
        masLabel.text = localizedString("menu_mas")
        masLabel.font = UIFont.systemFont(ofSize: 11)
        masView.addSubview(masLabel)
        
        masLabel.topAnchor.constraint(equalTo: masImage.bottomAnchor, constant: 5).isActive = true
        masLabel.centerXAnchor.constraint(equalTo: masView.centerXAnchor).isActive = true
    }
    
    @objc private func masPressed(_ sender: AnyObject) {
        backgroundView.isHidden = false
        menu.showMainMenu()
    }
    
    private func getAvisos() {
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        masImage.tintColor = .black
        masLabel.textColor = .black
    }
    
    private func addMenuBackground() {
        backgroundView = UIView(frame: .zero)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.5
        backgroundView.isHidden = true
        view.addSubview(backgroundView)
        
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func addMainMenu() {
        menu = MainMenuView()
        menu.loadContentView(superView: view, delegate: self)
    }
}

extension MainTabBarController: MainMenuDelegate {
    func menuDismissed() {
        backgroundView.isHidden = true
        masImage.tintColor = .black
        masLabel.textColor = .black
    }
    
    func itemPressed(item: String) {
        backgroundView.isHidden = true
        masImage.tintColor = .black
        masLabel.textColor = .black
    }
}
