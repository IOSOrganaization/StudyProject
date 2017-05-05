//
//  UIButtonRed.swift
//  StudyProject
//
//  Created by XiaoTian on 16/6/6.
//  Copyright © 2016年 XiaoTian. All rights reserved.
//

import UIKit

// UIView 的Nib初始化,初始化时属性配置,初始化后方法回调
class UIButtonRed: UIButton {
    // [Nib初始化开始是的构造器]
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // 初始化构造器[当Nib构造时调用的方法,init(frame:)构造方法在Nib方式实例化时不会调用]
    }
   
    // loading of the nib call method [Nib初始化完后回调方法]
    override func awakeFromNib() { // 从nib加载完成[属性,映射,实例化等完成后]后唤起
        super.awakeFromNib()
        /* The awakeFromNib message is sent to all nib-instantiated objects just after they are instantiated by the loading of the nib: the object has been initialized and configured and its connections are operational.*/
        self.backgroundColor = UIColor.redColor()
    }
    
    // 自定义NIB属性配置变量值[想Nib编辑器的Attribute inspector开放] [Nib初始化过程中属性配置]
    @IBInspectable var borderWidth : CGFloat { // 声明向Nib的 Attribute inspector 开放的属性
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
}
