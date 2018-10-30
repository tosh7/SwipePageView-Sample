//
//  ViewController.swift
//  SwipePageView-Sample
//
//  Created by Satoshi Komatsu on 2018/10/28.
//  Copyright © 2018 Satoshi Komatsu. All rights reserved.
//

import UIKit
import SwipeMenuViewController

class ViewController: UIViewController {

    @IBOutlet weak var swipeMenuView: SwipeMenuView! {
        didSet {
            swipeMenuView.delegate = self
            swipeMenuView.dataSource = self
            let options: SwipeMenuViewOptions = .init()
            swipeMenuView.reloadData(options: options)
        }
    }
    
    private var array = ["全て", "恋愛", "スポーツ", "経済", "IT"]
    
    override func viewDidLoad() {
        array.forEach {eachArray in
            let vc = ContentViewController()
            vc.title = eachArray
            vc.content = eachArray
            self.addChild(vc)
            print(eachArray)
        }
        
        super.viewDidLoad()
    }
}

extension ViewController: SwipeMenuViewDataSource {
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return array.count
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return array[index]
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let vc = ContentViewController()
        return vc
    }
    
}

extension ViewController: SwipeMenuViewDelegate {
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
//        swipeMenuView(, viewWillSetupAt: currentIndex)
        print("will setup SwipeMenuView")
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
//        swipeMenuView(, viewDidSetupAt: currentIndex)
        print("did setup SwipeMenuView")
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
//        swipeMenuView(swipeMenuView, willChangeIndexFrom: fromIndex, to: toIndex)
        print("will change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
//        swipeMenuView(swipeMenuView, didChangeIndexFrom: fromIndex, to: toIndex)
        print("did change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }
}

