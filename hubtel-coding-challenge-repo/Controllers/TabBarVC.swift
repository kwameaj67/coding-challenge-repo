//
//  TabBarVC.swift
//  hubtel-coding-challenge-repo
//
//  Created by Kwame Agyenim Boateng on 7/13/23.
//

import UIKit

class TabBarVC: UITabBarController {

    private var tabItem = UITabBarItem()
    private var tabBarAppearance = UITabBar.appearance()
    private var tabBarItemAppearance = UITabBarItem.appearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = UINavigationController(rootViewController: HomeVC())
        let sendVC = UINavigationController(rootViewController: SendVC())
        let historyVC = UINavigationController(rootViewController: HistoryVC())
        let scheduleVC = UINavigationController(rootViewController: ScheduleVC())
        
        viewControllers = [ homeVC, sendVC, historyVC, scheduleVC ]
        setupTabBar()
        
        // tabs
        setupTabItem("house.fill", "house", 0, "")
        setupTabItem("arrow.up.circle.fill", "arrow.up.circle", 1, "Send")
        setupTabItem("doc.fill", "doc", 2, "History")
        setupTabItem("person.badge.clock.fill", "person.badge.clock", 3, "Schedule")
        
        tabBar.standardAppearance.shadowColor = nil
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    func setupTabBar(){
        tabBar.barTintColor = UIColor.white
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = UIColor.white
        tabBar.isTranslucent = true
        
        tabBar.layer.borderColor = UIColor.systemGray3.cgColor
        tabBar.layer.borderWidth = 0.7

        tabBarAppearance.tintColor = .black
        tabBarAppearance.unselectedItemTintColor = .systemGray2
        
        additionalSafeAreaInsets.top = 20
    }
    
    func setupTabItem(_ activeImage: String, _ inactiveImage: String, _ index: Int,_ tabTitle: String){
        let selectedImage = UIImage(systemName: activeImage)?.withRenderingMode(.alwaysTemplate)
        let deSelectedImage = UIImage(systemName: inactiveImage)?.withRenderingMode(.alwaysTemplate)
        deSelectedImage?.withTintColor(.systemGray3)
        tabItem = self.tabBar.items![index]
        tabItem.image = deSelectedImage
        tabItem.selectedImage = selectedImage
        tabItem.title = tabTitle
        tabItem.imageInsets.bottom = -10
        tabItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 6)
    }
    
    override var selectedIndex: Int {
        didSet{
            guard let _ = viewControllers?[selectedIndex] else { return }
            tabBarItemAppearance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 12)!,NSAttributedString.Key.foregroundColor:UIColor.black], for: .normal)
        }
    }
    override var selectedViewController: UIViewController?{
        didSet{
            guard let viewControllers = viewControllers else { return }
            for viewVC in viewControllers{
                if viewVC == selectedViewController {
                    //print("Selected")
                    tabBarItemAppearance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir-Heavy", size: 12)!,NSAttributedString.Key.foregroundColor:UIColor.black], for: .normal)
                    }
                else
                {
                    tabBarItemAppearance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir", size: 12)!,NSAttributedString.Key.foregroundColor:UIColor.systemGray2], for: .normal)
                }
            }
        }
    }
}
