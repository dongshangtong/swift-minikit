//
//  MNBaseNavigationController.swift
//  MySwiftDome
//
//  Created by dongshangtong on 2018/8/4.
//  Copyright © 2018年 dongshangtong. All rights reserved.
//

import UIKit

class MNBaseNavigationController: UINavigationController {
    private var viewWillAppear_firstTime = true
    private var viewDidAppear_firstTime = true
    private var viewWillDisappear_firstTime = true
    private var viewDidDisappear_firstTime = true
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if viewWillAppear_firstTime{
            viewWillAppear_firstTime = false
            viewWillAppear_first()
        } else{
            viewWillAppear_first_not()
        }
        viewWillAppear_every()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if viewDidAppear_firstTime{
            viewDidAppear_firstTime = false
            viewDidAppear_first()
        } else{
            viewDidAppear_first_not()
        }
        viewDidAppear_every()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if viewWillDisappear_firstTime{
            viewWillDisappear_firstTime = false
            viewWillDisappear_first()
        } else{
            viewWillDisappear_first_not()
        }
        viewWillDisappear_every()
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if viewDidDisappear_firstTime{
            viewDidDisappear_firstTime = false
            viewDidDisappear_first()
        } else{
            viewDidDisappear_first_not()
        }
        viewDidDisappear_every()
    }
    
    /// 只在第一次执行，不用写super.XX
    open func viewWillAppear_first(){
        
    }
    
    /// 非第一次执行，不用写super.XX
    open func viewWillAppear_first_not(){
        
    }
    
    /// 每次都执行，不用写super.XX
    open func viewWillAppear_every(){
        
    }
    
    /// 只在第一次执行，不用写super.XX
    open func viewDidAppear_first(){
        
    }
    
    /// 非第一次执行，不用写super.XX
    open func viewDidAppear_first_not(){
        
    }
    
    /// 每次都执行，不用写super.XX
    open func viewDidAppear_every(){
        
    }
    
    /// 只在第一次执行，不用写super.XX
    open func viewWillDisappear_first(){
        
    }
    
    /// 非第一次执行，不用写super.XX
    open func viewWillDisappear_first_not(){
        
    }
    
    /// 每次都执行，不用写super.XX
    open func viewWillDisappear_every(){
        
    }
    
    /// 只在第一次执行，不用写super.XX
    open func viewDidDisappear_first(){
        
    }
    
    /// 非第一次执行，不用写super.XX
    open func viewDidDisappear_first_not(){
        
    }
    
    /// 每次都执行，不用写super.XX
    open func viewDidDisappear_every(){
        
    }

}
