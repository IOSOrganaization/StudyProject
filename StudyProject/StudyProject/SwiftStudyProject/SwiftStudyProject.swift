//
//  File.swift
//  StudyProject
//
//  Created by XiaoTian on 16/6/1.
//  Copyright © 2016年 XiaoTian. All rights reserved.
//

import Foundation
import UIKit
@objc class SwiftStudyProject : UIViewController ,UITableViewDelegate, UITableViewDataSource{
    // 1.声明TableSingle要自动映射连接的属性
    // 2.在TableSingle中映射连接File's Owner属性[Nib中的映射只是一个名称属性的标记,运行时根据名称自动设置属性值,如果没实体类没有映射的属性就会报设置属性异常,NSUnknownKeyException] Identity inspector 身份视图
    // 3.通过loadNibNamed:owner:options方法加载nib让系统自动映射连接
    @IBOutlet var rootView : [UIView]!
    @IBOutlet var tableView : UITableView!
    var arrayViewController : [ViewControllerItem] = []
    //
    override func viewDidLoad() {
        // 动态加载nib交互页面,返回的是顶层的Array UIView数组
        let _ = NSBundle.mainBundle().loadNibNamed("SingleTable", owner: self, options: nil)
        // rootView,tableView通过配置的Files' Owner自动映射连接方法从TableSingle中获取
        self.view.addSubview(rootView[0])
        tableView.dataSource = self
        tableView.delegate = self
        // VC
        arrayViewController.append(ViewControllerItem(IBViewController(), "IBViewController"))
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayViewController.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellView : UITableViewCell?
        cellView = tableView.dequeueReusableCellWithIdentifier("cellView")
        if cellView == nil {
            cellView = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellView")
        }
        let item = arrayViewController[indexPath.row]
        cellView?.textLabel?.text = item.title
        return cellView!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        self.navigationController?.pushViewController(arrayViewController[indexPath.row].viewController, animated: false)
    }
    class ViewControllerItem {
        let viewController : UIViewController
        let title : String
        init (_ viewController: UIViewController, _ title: String) {
            self.viewController = viewController
            self.title = title
        }
    }
}
