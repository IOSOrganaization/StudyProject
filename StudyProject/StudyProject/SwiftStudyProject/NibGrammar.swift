//
//  Nib.swift
//  StudyProject
//
//  Created by XiaoTian on 16/5/29.
//  Copyright © 2016年 XiaoTian. All rights reserved.
//
import UIKit

class NibGrammar : UIViewController {
    // 代码加载Nib的方式
    override func viewDidLoad() {
        // 1.在storyboard中实例化
        let uiStoryBoard = UIStoryboard(name:"MainStoryboard", bundle: nil)
        uiStoryBoard.instantiateInitialViewController()  // 实例化入口VC
        uiStoryBoard.instantiateViewControllerWithIdentifier("test") // 根据标识符实例化VC
        // 2.通过VC初始化方法实例化
        let _ = UIViewController(nibName: "SwiftNib", bundle: nil) // nibName:交换页面的nib名称,bundle:该nib所在的模块名称[当前模块:可以用NSBundle.mainBundle(),或者nil, 如果调用的是其他模块Boundle里面的nib则要传入该名称]
        // 3.通过NSBundle的实例方法加载[加载实际上是系统对该nib初始化并且返回该nib的顶层Object对象数组]
        let topLevelNibArray = NSBundle.mainBundle().loadNibNamed("SwiftNib", owner: nil, options: nil)
        let _ = topLevelNibArray[0] as? UIView // 获取nib实例化的顶层的第一个对象
        // 4.通过UINib实例化(nib名称,nib所在的资源模块名称)
        let _ = UINib(nibName: "SwiftNib", bundle: nil)
        // 5.通过绑定File's Owner类映射方式获取UIView
        // 5.1 在nib文件里声明File's Owner的class属性,指明如果有owner传入,那么就通过file's owner来进行映射连接
        // 5.2 在相应的映射类中声明要自动连接的UIView
        // 5.3 在nib中按住Control-click file's owner拖动鼠标到要绑定的UIView,然后在弹出框中选中映射绑定的连接属性
        NSBundle.mainBundle().loadNibNamed("SwiftNib", owner: self, options: nil) // 加载nib并且通过file's owner中的映射进行连接
        let _ = self.rootView // 系统加载时自动连接的UIView
        
    }
    // Connections nib Object链接器
    // 1.通过outlet进行链接,UI对象Object的引用
    // 2.通过action进行链接
    @IBOutlet var rootView : UIView! // 声明要映射连接的属性(可以映射连接其所有子类)
    @IBOutlet var tableView : UITableView!
}

