//
//  swiftBaseGrammar.swift
//  StudyProject
//
//  Created by XiaoTian on 16/1/6.
//  Copyright © 2016年 XiaoTian. All rights reserved.
//

import Foundation

import UIKit

// @objc :声明向object-c开放, NSObject继承Object-C的根对象,该类会自动创建在Object-C映射的Swift头文件中:: 
// Object-C 与Swift实体映射文件: <项目名称>-swift.h
@objc class SwiftBaseGrammar : NSObject{
    //
    func baseGrammar (){
        print("Hello")
        print("World")
        //
        changeOne()
        silly()
        changeTow()
        Manny0().sayName()
        Moe0().sayName()
        Dog().speak()
        instance()
        print(sum(3,5))
        say1("name")
        say4()
        let letCount = repeatString("hello",times: 3,userAge: 26)
        print(letCount)
        Dog1().start()
        Dog2().start()
        Dog3().start()
        Dog4().start()
        Dog5().start()
        Dog6().start()
        checkDog(Dog6(),and: Dog6())
        count(1)
        doThisStart()
        functionAnonymous()
        SampleTypeVariable().start()
        ObjectType().start()
        //
    }
}
//
func initGrammar(){
    print("Hello")
    print("World")
}
var one = 1;
func changeOne(){
    let tow = 2;
    print(tow)
}
// 定义类
class Manny{} // class 类
struct Moe {} // struct 结构类
enum Jack{} // enum 枚举类
func silly(){
    if true{
        class Cat{} // function 内部类
        var one = 1 // function 内部属性
        one = one + 1 // Operation
    }
}
// 嵌套类
// function 嵌套
func changeTow(){
    let tow = 2; //嵌套属性
    func sayTow(){ //嵌套function
        print(tow)
    }
    class Klass{} //嵌套class
    struct Struct{} //嵌套结构体
    enum Enum{} //嵌套枚举
    one = tow; //Operation
}
// class 嵌套
class Manny0{
    let name = "manny" //嵌套属性
    func sayName(){ //嵌套function
        print(name)
    }
    class Klass{} //嵌套class
    struct Struct {} //嵌套Struct
    enum Enum{} // 嵌套enum
}
struct Moe0{
    let name = "moe" //嵌套属性
    func sayName(){ //嵌套function
        print(name)
    }
    class Klass{} //嵌套class
    struct Struct{} //嵌套struct
    enum Enum{} //嵌套enum
}
enum Jack0{
    var name : String{ //嵌套属性 名称:类型{}
        return "Jack"
    }
    func sayName(){ //嵌套function
        print(name)
    }
    class Klass{} //嵌套class
    struct Struct{} //嵌套struct
    enum Enum{} //嵌套enum
}
// 实例化
class Dog{
    // 公开属性
    var name = ""; //类内部属性必须定义初始化,因为var自身没有类型,定义一个属性必须要有类型[其他方式定义类谈]
    var whatADogSays = "woof" // 初始化类型
    // 私有属性
    private var dogSex = "female"
    func bark(){
        print(self.whatADogSays) //self自引用属性
    }
    func speak(){
        self.bark() //自引用function
    }
}

func instance(){
    let manny = Manny() //实例化一个类
    let manny0 = Manny0()
    print(manny0.sayName()) //调用类方法
    let dog1 = Dog()
    dog1.name = "Fido" //修改属性值
    let z = sum(4,5)
    print(z)

    
}
// 带输入,输出的function
// sum:函数名
// ():(圆括号)输入参数列表,逗号作为分隔符,每个参数格式固定为名称+冒号+类型 name:type,参数属于变量可以在函数内部修改值,
// _ 下划线+空格:忽略外部参数标签[_下划线:忽略]
// ->:声明返回值的类型
// {}:代码体
func sum (x:Int,_ y:Int) -> Int{
    let result = x + y // operation
    return result // 返回值
}
// 带输入参数,没输出值的function[声明无输出值/省略声明输出]
func say1(s:String) -> Void {} //用Void表示无输出值[Swift的Void类型,可以用Swift的Void对象接受返回接口,当然这个结果是Void值]
func say2(s:String) -> (){} //用()括号表示无输出值
func say3(s:String) {} //直接省略输出值部分声明
// 无输入,有输出值的function
func say4() -> String{
    return "liming"
}
// ::无参数输入,无参数输出(无返回值)
func say5() -> Void{}
func say6() -> (){}
func say7() {}
// ::函数签名:函数名+输入参数列表
// ::外部参数变量名[标签]与内部参数变量名[标签]:外部变量名主要用于给程序更加好的理解而已,[函数名前加下划线_ 可以取消外部参数标签,对函数无影响,Swift自动处理]
// 与OC语法相同法则:第一个参数名称标签Label默认省略(可以强制声明)[原因:1.函数名建议包含第一个参数含义,2:OC语法传统影响],后面的参数Label默认不省略[与OC语法相同]
// 强制省略[抑制/废除]外部参数标签(下划线) : _ name:Type [外部调用时省略参数标签]
// 强制声明参数标签:声明外部参数标签与内部参数标签: outName innerName :Type [外部调用时参数标签为:outName,内部使用是参数标签为:innerName]
func repeatString(s:String,times:Int,userAge age:Int) -> String{
    var result = ""
    // 使用普通方式的输入参数:在外部输入时 times:3,函数体使用的是times
    for _ in 1...times{ // _ 下划线:忽略迭代值, 1...times:Range(1到times)范围集合
        result += s
    }
    // 使用外部函数参数和内部函数参数不同的方式:在外部输入时 userAge:20,函数体使用的是age
    print("My Age is")
    print(age)
    return result
}
// 调用时利用外部函数名标签[External Paramater Name]
let s = repeatString("hi",times:3,userAge:20) // 调用时通过写外部函数变量名[参数标签],使得函数更加直观明确,当然建议你这样使用,参数一目了然[与OC一样]
// ::因为Swift通过()括号来输入参数,而OC不是通过括号来输入参数,为了Swift和OC之间互调,通过括号里面加参数变量名的方式进行调用
// 例如:Swift的String 与OC里面的Cocoa NSString自动包装
let s1 = "Hello" //Swift的String
let s2 = s.stringByReplacingOccurrencesOfString("ell", withString: "ipp") //OC里面的Cocoa的NSString方法[NSString 里的方法stringByReplacingOccurrencesOfString:withString:]
// ::包含默认参数值的function
class Dog1{
    func say(s:String, times:Int = 1){
        for _ in 1...times{
            print(s)
        }
    }
    func start(){
        Dog1().say("finy")
        Dog1().say("woof",times:3)
    }
}
// ::带外部参数名的默认参数值的function
class Dog2{
    func say(s s:String = "boff", times:Int = 3, dogAge age:Int = 1){
        for _ in 1...times{
            print(s)
        }
    }
    func start(){
        Dog2().say(dogAge:3, times:3, s:"Bog") // 参数位置可随意,但是不建议这样使用,因为这样很容易漏掉没有默认值的参数(编译器不会报错可能是Swift的缺陷吧),所以最好按照标准顺序写不会漏参数
    }
}
// ::可变(variadic)参数的function
class Dog3{
    func say(arrayOfString:String...){// 可变参数放在最后
        // ::可变参数(以逗号分隔的参数数组)由系统自动转化为Array数组
        // ::可惜Swift里面没有办法把一个Array数组转化为以逗号分隔的参数数组
        for s in arrayOfString{
            print(s);
        }
    }
    func say(arrayOfString:String..., times:Int){// 可变参数可以放在前面
        for _ in 1...times{
            for s in arrayOfString{
                print(s)
            }
        }
        // print 多参数输出,无格式,系统会在中间用默认空格分隔符
        print("mannie", 3, true)//结果:mannie 3 true
        // print 自定义声明分隔,结束符
        print("mannie", 3, true, separator:",", terminator:",") // 结果:mannie,3,true,
    }
    func start(){
        Dog3().say("woof","goog","uooi")
        Dog3().say("woof","goog","uooi",times:3)
    }
}
// ::内部忽略参数的function(这个参数相当于无效,这个的作用一般用来作为开发者自己的一个标志,编译器会自动优化没用到的参数)
class Dog4{
    func say(s:String, times:Int, loudly _:Bool){ //内部忽略参数loudly,外部不能忽略
        for _ in 1...times{
            print(s)
        }
    }
    func say(s:String, times:Int, _:Bool){ //内部忽略参数,同时声明忽略外部参数名
        for _ in 1...times{
            print(s)
        }
    }
    func start(){
        say("woof",times:3,loudly:false)
        say("food",times:3,true)
    }
}
// ::修改参数值的function
class Dog5{
    func say(s:String, times:Int, loudly:Bool){ //默认常量参数
        // 系统默认的function参数为let常量参数,所以默认的参数是不能改值的
        // s = "Bill" // compile error
    }
    func say(s:String, times:Int, var modifiableLoudly:Bool){ //声明var变量参数
        modifiableLoudly = true // 改变值
    }
    func removeFromString(var s:String, character c:Character) -> Int{ //修改字符串,同时返回值
        var howMany = 0
        while let ix = s.characters.indexOf(c) {
            s.removeRange(ix...ix) // 修改参数值(参数内部变量值,声明var系统会自动创建拷贝值作为变量传入)
            howMany += 1
        }
        return howMany; // 返回统计值
    }
    func start(){
        let s = "hello" //let 常量
        let result = removeFromString(s, character: Character("l"))
        print(s, result)// hello 2
    }
}
// ::修改参数值,双向传递值的function
class Dog6{
    func removeFromString(inout s:String, character c:Character) -> Int{ //声明双向传递参数
        var howMany = 0
        while let ix = s.characters.indexOf(c) {
            s.removeRange(ix...ix)
            howMany += 1
        }
        return howMany
    }
    func start(){
        var s = "hello" //var 变量
        let result = removeFromString(&s, character: Character("l")) //双向参数传地址&(and):取地址符
        print(s,result) // heo 2
    }
    // String :字符串不是class,而是Struct,所以默认传值,而不是地址
    // 除了class实例在参数传递中是传地址外,其他的都是传值,如果你要强制其他类型实体传地址则要用inout并且传入地址
    // UnsafeMutablePointer:可变地址声明用于Object-C代替Swift里的inout作为地址传递的转换器
    // Object-C 里面的CGRect,是struct 结构体,不是实体
    // 传入Object-C的struct机构体地址例子:
    func CGRectDivide(rect: CGRect, _ slice: UnsafeMutablePointer<CGRect>, _ remainder: UnsafeMutablePointer<CGRect>, _ amount: CGFloat, _ edge: CGRectEdge){
        // 传入OC结构体
        // rect:传入机构体CGRect的值
        // slice:传入结构体的地址
        // remainder:传入结构体的地址
        // amount:传入结构体值
        // edge:传入机构提值
    }
    func CGRectDivideStart(){
        let rect = CGRectZero;
        let arheight = CGFloat.min;
        var arrow = CGRectZero;
        var body = CGRectZero;
        CGRectDivide(rect, &arrow, &body, arheight, .MinYEdge) //传递地址模式,不用inout关键字
    }
    func popoverPresentationController(popoverPresentationControll: UIPopoverPresentationController, willRepositionPopoverToRect rect: UnsafeMutablePointer<CGRect>, inView view: AutoreleasingUnsafeMutablePointer<UIView?>){
        // 在function内部可以修改view,rect的属性值,因为声明了传入的是参数地址
    }
    // 传入实体参数,实体类传递的是地址,不用任何声明符
    var name = ""
    func changeDogName(d:Dog6){
        d.name = "wof"
    }
}
// :: function in functin
func checkDog(dog1:Dog6, and dog2:Dog6){
    // let checkNameIdJack = "li"
    func checkNameIdJack(s:String) -> Bool{ //Local Function 本地函数,只能在本地访问,本地函数实际上是与本地变量同作用级的,所以本地函数不能与本地变量同名,同作用域内本地函数名必需保持唯一性(不能与变量或者其他本地函数同名)
        //
        return "Jack" == s;
    }
    for y in 0...2{
        //
        print(y)
        checkNameIdJack(dog2.name) //调用内部函数function
    }
    if true{
        // distance 分离函数(当在一个域中的函数很多时可以用这种模式,但是这样并不一定可以节省代码,不过可以让程序更加清晰,明确,易读,分离函数可以帮助你更加容易理解代码逻辑)
        func printNumber(d:Int){ //在if内部定义function,访问域只能在if内部[用于分离重用部分函数]
            print(d)
        }
        for ix in 0..<7{ //在if内部调用function ,0..<7 Rang范围
            printNumber(ix)
        }
    }
}
// ::递归Recursion
func count(ix:Int){
    print(ix)
    if ix < 10 {
        // 自调用
        count(ix+1)
    }
}
// ::函数参数/函数作为值 ,在Swift中Function属于第一类属性(function的类型是它的签名类型[不是签名,是签名类型]) Function AS Value
func doThis(f:()->()){ // 用function[此function的的签名类型为()->()]作为参数():可以作为无参数/空Function 的意思
    f() // 执行function自身
}

func whatToDo(){
    print("I did it")
}

func doThisStart(){
    // 通过函数执行其他函数
    let wtd = whatToDo //函数签名作为变量
    doThis(wtd) //调用函数参数的function,同时把function函数名作为参数传入
    
    func IntVoidFunctin(f:(Int)->()) -> (){ // 输入Int,输出Void的函数Function[function签名类型为(Int)->()]
        f(0) // 执行输入参数函数
    }
    // Object-C Handle语法格式的函数
    func whatToAnimate(){
        //
    }
    func whatToDoLater(finished:Bool){
        //
    }
    // Object-C 语法引用function函数作为参数
    UIView.animateWithDuration(0.4, animations: whatToAnimate, completion: whatToDoLater)
}
// ::匿名函数 Anonymous Function
func functionAnonymous(){
    // ::有名称的函数
    func whatToAnimate(){ // 定义函数
        //
    }
    func whatToDoLater(finished:Bool){
        //
    }
    UIView.animateWithDuration(0.4,
        animations: whatToAnimate, //引用已定义的函数
        completion: whatToDoLater) //引用已定义的函数
    // ::标准匿名函数(声明输入参数,返回参数)
    UIView.animateWithDuration(0.4,
        animations: {
            // 匿名函数
        },
        completion: {
            (finished:Bool) in // ::(finished:Bool)声明输入变量,in :声明匿名函数的变量出入口
            // 匿名函数
            print(finished)
        }
    )
    // ::匿名函数省略输入变量类型
    UIView.animateWithDuration(0.4,
        animations: {
        },
        completion: {
            (finished) in // ::输入变量只有变量名,无变量类型
            // 匿名函数
            print(finished)
        }
    )
    // ::匿名函数省略输入参数类型,同时省略输入变量括号
    UIView.animateWithDuration(0.4,
        animations: {
        },
        completion: {
            finished in // ::输入变量只有变量名,无变量类型
            // 匿名函数
            print(finished)
        }
    )
    // ::忽略输入参数声明,直接用系统内部变量$引用方式:$0,$1,$2s
    UIView.animateWithDuration(0.4,
        animations: {},
        completion: {
            // 系统默认输入函数$,不能省略,如果省略in,同时没有$系统接收参数,则系统默认为空函数()->()
            print($0) // 第一个输入参数
        }
    )
    // ::忽略所有输入参数声明,所有系统引用参数无效
    UIView.animateWithDuration(0.4,
        animations: {},
        completion: {
            _ in // 忽略所有输入参数,输入参数可能有(...)->?,也可能为空()->()
            print("finished") // 如果用$0,$1将编译错误
        }
    )
    // :: 后缀函数/后置函数(拖尾函数:trailing function),如果函数的最后一个输入变量为function类型,可以后置作为后缀函数
    UIView.animateWithDuration(0.4, animations: {})/*函数的最后一个输入参数后置成为后缀函数/拖尾函数*/{
        _ in
        print("后缀函数结束")
    }
    // :: 匿名函数省略()括号
    func doThis(f:()->()){
        f() // 执行输入参数的function
    }
    doThis({
        print("normal call this")
    })
    doThis {
        print("匿名函数省略()括号")
    }
    // :: 匿名函数省略return关键字
    func sayHowdy() -> String{
        return "Howdy"
    }
    func performAndPrint(f:()->String){
        let s = f()
        print(s)
    }
    performAndPrint{ // performAndPrint({}),匿名函数省略(),省略 in 输入参数,省略return返回关键字
        sayHowdy() // 当且仅当匿名函数只有一个语句,并且该语句执行的返回值与匿名函数的参数返回值类型相同时,可以直接省略return关键字
    }
    // ::匿名数组转换器
    let arr = [2,4,6,8] //声明数组
    func doubleMe(i:Int) -> Int{ //声明转换器函数(输入,输出都为数组数据的类型)
        return i*2
    }
    let arr2 = arr.map(doubleMe) // 普通方式利用转换器对数组进行转换
    // 由于匿名函数中只有一个语句,并且该语句的类型与返回类型相同,所以省略return关键字
    let arr3 = arr.map { $0*2 } // arr.map({ $0*2 }):最后一个参数为function所以成为后缀函数,并忽略()括号 (专业装逼 $0与返回类型相同,所以$0*2也于返回类型相同,如果用let接受,类型为主动识别,不能匹配$0类型)
    let arr4 = arr.map{ // 标准形式匿名转换器
        (i:Int) -> Int in
        let result = i*2
        return result + 2
    }
    print(arr2)
    print(arr3)
    print(arr4)
    // ::定义匿名函数同时调用匿名函数 {}()
    let content = NSMutableAttributedString()
    let para = NSMutableParagraphStyle() // 实例化对象属性
    para.headIndent = 10
    para.firstLineHeadIndent = 10
    // more configuration of para
    content.addAttribute(NSParagraphStyleAttributeName, value: para, range: NSMakeRange(0,0)) //标准形式,value:AnyObject,传入para实体
    // 属性实体通过匿名函数进行返回的形式
    content.addAttribute(NSParagraphStyleAttributeName,
        value: { // 匿名函数的形式返回该参数的实体,并且要自调用 {}() // 声明一个匿名函数{},并调用匿名函数()
            let para = NSMutableParagraphStyle()
            para.headIndent = 10
            para.firstLineHeadIndent = 10
            return para // 匿名函数返回参数实例
        }(),
        range: NSMakeRange(0,0)
    )
    // 匿名函数定义并调用只能在函数里面了,不能单独运行
    //{
    //  print("")
    //}()
    // ::声明函数作为输入输出变量
    func countAdder(f:()->()) -> ()->(){
        var ct = 0 // 函数内部变量,内部变量作用域在函数内
        return { // 返回匿名函数{},函数里面的函数
            ct = ct + 1
            print("count is \(ct)")
            f()
        }
    }
    // 输入函数
    func greet(){
        print ("howdy")
    }
    let countedGreet = countAdder(greet); // 创建函数调用函数变量,函数内部变量自增
    countedGreet()
    countedGreet()
    countedGreet()
    //
    print("声明两个变量:")
    let countedBlue = countAdder(greet)
    let countedBlue2 = countAdder(greet)
    countedBlue()
    countedBlue2()
    // 
    print("引用同个变量:")
    let countedBlue3 = countedBlue;
    countedBlue()
    countedBlue3();
    // ::局部函数,风味函数
    func imageOfSize(sz:CGSize, f:() -> ()) -> UIImage { // 根据大小,和圆角处理func创建UIImage
        // ......
        return UIImage()
    }
    // 1.正常方式根据大小,圆角处理函数,创建圆角图片
    func makeRoundedRectangleMaker(sz:CGSize) -> () -> UIImage {
        return {
            imageOfSize(sz) {
                // 在Image Context 上下文创建半径为8的圆角Path
                let p = UIBezierPath(roundedRect: CGRect(origin: CGPointZero, size: sz), cornerRadius: 8)
                //
                p.stroke()
            }
        }
    }
    let _ = makeRoundedRectangleMaker(CGSizeMake(45, 20));
    // 2.根据传入图片大小,图片圆角大小创建圆角图片,sz:作用于当前函数,r:作用于内部函数
    func makeRoundedRectangleMaker1(sz:CGSize, _ r:CGFloat) -> () -> UIImage {
        return {
            imageOfSize(sz){
                let p = UIBezierPath(roundedRect: CGRect(origin: CGPointZero, size: sz), cornerRadius: r)
                p.stroke()
            }
        }
    }
    let _ = makeRoundedRectangleMaker1(CGSizeMake(45, 20), 8)
    // 3.将第二个输入函数变量后置到返回值得输入变量中: (CGFloat) -> UIImage
    func makeRoundedRectangleMake2(sz:CGSize) -> (CGFloat) -> UIImage {
        return {
            r in // func中的输入变量,声明输入变量r
            imageOfSize(sz){
                let p = UIBezierPath(roundedRect: CGRect(origin: CGPointZero, size: sz), cornerRadius: r)
                p.stroke()
            }
        }
    }
    // 3-1.根据传入的图片大小创建图片生成函数
    let maker3 = makeRoundedRectangleMake2(CGSizeMake(45, 20))
    // 3-2.根据圆角的半径生成图片
    maker3(8)
    // 4.合并局部变量的方式,直接传入图片大小,圆角半径生成图片[Curried Function],两个输入变量列表(),中间省略 ->
    // [专业装逼写法,两个输入变量间省略 ->]
    func makeRoundedRectangleMakeCurried(sz:CGSize) (_ r:CGFloat) -> UIImage {
        return imageOfSize(sz){
            let p = UIBezierPath(roundedRect: CGRect(origin: CGPointZero, size: sz), cornerRadius: r)
            p.stroke()
        }
    }
    let makerCurried = makeRoundedRectangleMakeCurried(CGSizeMake(45,20))
    makerCurried(8)
    //
}
// ::基础类型变量和属性
class SampleTypeVariable{
    // : 1.全局变量
    // 定义变量时必须初始化,初始化后该变量的类型就固定了,后续不能改变变量类型
    var x : Int/*定义*/ = 1/*初始化*/ // var:声明变量,x:变量名,Int:变量类型,1:变量值(基础类型 struct)
    var x1 = 1 // 隐藏变量类型,系统自动识别为Int
    let separator : CGFloat = 2.0 // 声明为CGFloat,浮点型数字系统自动识别为Double,所以必须显示声明类型
    // 1-1:变量数组,数组初始化为成员变量: UIViewAnimationOptions.Autoreverse
    let opts :UIViewAnimationOptions = [.Autoreverse, .Repeat] // 全局静态变量初始化,必须声明所在类型
    // 1-2:当我们想明显知道某个变量的类型时,最好显式声明,即使系统可以识别该类型,但是不方便我们查看
    // 1-3:操作变量初始化[必须符合:1.变量类型为var声明变量,2.必须是已声明的类型,3.必须用大括号括起变量操作函数]
    var now : String {
        // Getter / Setter
        get { // 重写getter方法,必须返回一个同类型的值
            return NSDate().description
        }
        set { // 重写setter方法,默认包含一个名为newValue的输入参数[可以在set方法声明其他名称: set(val) {}]
            print(newValue)
        }
    }
    var now1 : String {
        // Getter 只声明Getter的函数,该变量为只读函数,没有Setter
        get{
            return NSDate().description
        }
    }
    var now2 : String {
        // 简略方法声明只读函数
        return NSDate().description
    }
    var mp : UIViewAnimationOptions{
        // 利用只读变量的方式,简略封装部分小代码(mp == UIViewAnimationOptions.Repeat)
        return UIViewAnimationOptions.Repeat
    }
    var myBigDataReal : NSData! = nil // 初始化class为nil的外部被引用变量: Facade variables
    var myBigData : NSData {
        // 变量外部存蓄变量值的引用方式
        set (newdata) {
            self.myBigDataReal = newdata // 赋值给外部变量值
        }
        get{
            // 缓存值得方式获取变量值
            if self.myBigDataReal == nil{
                // ... 从文件,共享等地方重新获取缓冲的外部变量值,初始化
                self.myBigDataReal = NSData() // 
                // ...
            }
            return self.myBigDataReal
        }
    }
    // 1-4.变量初始化侦听器[必须符合:1.变量为var声明的变量,2.必须初始化的 :运算变量不能添加侦听器]
    var myBigData1 : String = "This is the BIG DATA" {
        willSet{ // 被修改前调用,默认包含一个newValue的输入参数
            print("" + newValue)
        }
        didSet{ // 被修改后调用,默认包含一个oldValue的输入参数,可以通过ditSet(valueOld)修改函数输入名称
            print("old value : " + oldValue)
            self.myBigData1 = "Re Change The BIG DATA Value" // 这里对被侦听变量进行修改不会触发侦听器
        }
    }
    var angle : CGFloat = 0 { // 实例:通过变量侦听器控制angle的大小范围
        didSet{
            if(self.angle < 0){
                self.angle = 0
            }
            if self.angle > 5{
                self.angle = 5
            }
        }
    }
    // : 2.全局成员属性[class,struct,emun]
    class MyClass{
        static let sharedMyClassSingleton = MyClass() // 单例实体
        // 延迟初始化全局变量[当调用时执行自调用方法生成实例]
        lazy var prog : UIProgressView = { // 自调用函数 {}()
            let p = UIProgressView(progressViewStyle: .Default)
            p.progress = 1.0
            return p
        }()
        
    }
    // : 3.静态成员属性
    // : 4.局部变量
    init(){
        
    }
    ////////////
    func start(){
        print(separator)
        localVeriable()
        baseSimpleType()
    }
    // : 5.局部变量
    func localVeriable(){
        // 5-1.局部变量定义
        var xe : Int
        let xel : Int
        let timed : Bool
        
        // 局部变量初始化
        if x == 1 {
            timed = true;
        } else {
            timed = false
        }
        print("局部变量timed:" + timed.description)
        // 当变量传入地址时,该变量必须初始化
        var arrow = CGRectZero // 传入地址到func中,必须初始化才有存储地址
        var body = CGRectZero
        CGRectDivide(CGRectMake(0, 0, 40, 20), &arrow, &body, separator, .MaxYEdge)
        // 例如: UIBackgroundTaskIdentifier 为Int类型的变形,在调用的方法中传入该变量时,必须初始化
        var bti : UIBackgroundTaskIdentifier = 0
        bti = UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler({
            UIApplication.sharedApplication().endBackgroundTask(bti) // bti必须先初始化,不然编译器报初始化不存在异常
        })
        // 变量Getter/Setter重写
        now = "你好"
        print(now)
        print(now1)
        //
        print(myBigData1)
        myBigData1 = "Big Data"
        print(myBigData1)
    }
    
    func baseSimpleType(){
        // 基本类型
        var _ : Int; // 十进制,二进制(0b),8进制(0o),16进制(0x)
        var _ : Bool;// true,false
        var _ : Double = 0x10p2; // 科学计数法(3e2 :3*100),取冪形式(0x10p2[2的2次冪] :16*4)
        // :1: 数字类型
        let ti = 10
        let td = Double(ti) // 显式转换,小->大
        print(td)
        let td2 = 3.8
        let ti2 = Int(td2) // 显式转换,大->小
        let ti3 : Int = 10/3 // 结果为Int
        let _ : Double = Double(ti3) // 必须显式转换
        let _ = 10/3.3 // 结果为Double
        print(ti2)
        print(ti3)
        let _ : CGFloat = CGFloat(10.9) // 显式类型转换
        let _ : Float = Float(10.9)
        let _ : Float = Float(CGFloat(10.9)) // Double->CGFloat->Float
        let ti4 = Int.max - 2;
        //let _ = ti4 + 12/2; // 超出Int的范围,程序异常/崩溃
        let (j, over) = Int.addWithOverflow(ti4, 12/2) // Int相加超出范围方法,超出Int的范围
        print("j:" + String(j))
        print("over:" + String(over))
        // 数字运算符: +,-,*,/,%,&,|,^,~,<<,>>,+=,-=,*=,/=,%=,&=,|=,^=,~=,<<=,>>=,++,--
        let _ : Int = abs(-7)
        let _ : Int = max(-7, 10)
        // :2: 布尔类型
        // 布尔运算符: ==,!=,<,<=,>,>=
        // :3: 字符串
        let _ : String = "Hello World"
        let utfString = "\u{21DA}"
        print(utfString)
        // 字符串转义 \n,\t,\",\\
        print("You have \n widgets")
        // 字符串引入变量
        let ti6 = 10
        print("You number is \(ti6)."); // 通过\()引入变量
        print("You number is \(ti6 + 1)") // 通过\()引入表达式
        let ud = NSUserDefaults.standardUserDefaults()
        let ti7 = ud.integerForKey("widgets")
        print("You have \(ti7) widgets."); // 嵌套引入
        let _ = "hello" + " world"
        var ts1 = "hello" // 定义var变量用于append字符串,"hello"系统默认是let类型
        let _ = ts1.appendContentsOf(" world")
        let ts2 = ["hello","world"].joinWithSeparator(" ") // 数组加入分隔符生成String
        print(ts2)
        print("String Value:" + String(ti6)); // String() String类型转换
        print("Hex String:" + String(125, radix: 16)) // String 16进制显示
        let ti8 : Int! = Int("7d", radix:16) //16进制串转Int类型 ,Int!: ?不封装类型,!自动封装类型[整形,int,bigInt...]
        print(ti8)
        print(Int("7d", radix:16)) // 默认不封装整形:Optional(125)
        let _ = ts2.characters.count // 字符串长度
        for c in ts2.characters { // 迭代字符串中的字符
            print(c)
        }
        let tsUTF = "\u{BF}Qui\u{E9}"
        print("迭代字符串的字符编码:")
        for i in tsUTF.utf8 { // 迭代字符串的UTF-8字符编码
            print(i)
        }
        for i in tsUTF.utf16 { // 迭代字符串的UTF-16字符编码
            print(i)
        }
        print("字符编码转换为字符")
        func flag(country:String) -> String { //国旗符号转义
            let BASE_UINT_32 : UInt32 = 127397 // UInt32 国旗基数
            var s = ""
            for v in country.unicodeScalars {
                s.append(UnicodeScalar(BASE_UINT_32 + v.value)) // 基数+标量
            }
            return s
        }
        let cn : String = flag("CN"); // 中国国旗
        let de : String = flag("DE"); // 德国国旗
        print(cn);
        print(de);
        //
        let ts3 = "hello world";
        print(ts3.capitalizedString) // 字符串首字母大写[这个是NSString的方法,系统自动将Swift的String转换为NSString在执行该方法]
        let range = ts3.rangeOfString("ell") //获取指定字符串所在的范围[封装NSString方法]
        print(range) // Optional(Range(1..<4))[Swift的Range类型]
        let range2 = (ts3 as NSString).rangeOfString("ell") // 显式转换为NSString,再调用NSString的方法,返回NSRange
        print(range2) // (1,3), an NSRange[OC的NSRange类型]
        let _ = ts3.substringWithRange(ts3.rangeOfString("ell")!) // Switf String类型字符串的剪切
        let _ = (ts3 as NSString).substringWithRange(NSMakeRange(1, 3)) // NSString类型的字符串剪切,传入的范围为NSRange
        let ts4 = "Ha\u{030A}kon" // Swift字符串[Swift字符串没有直接过去字符串长度的方法,而是获取可见字符长度:Håkon]\u{030A}:小圆圈
        print(ts4.characters.count) // Swift字符串中的字符长度:5,不包括UTF-16字符
        let nsLength = (ts4 as NSString).length // NSString字符串中的字符长度[NSString使用的是UTF-16编码,在有效范围内算一个字符],长度:6,包含UTF-16字符
        print(nsLength)
        print(ts4.utf16.count)
        let tc = Character("h") // 创建一个字符,传入的是字符串String,根据String初始化
        let ts5 = (String(tc)).uppercaseString // 字符-字符串-大写字符串
        print(ts5)
        let tc2 = ts4.characters.first // 第一个字符,返回值为?不封装,因为返回值可能为空,所以是可选的Optional,所以系统不自动封装,当为空时可以用!显式声明封装
        let tc3 = ts4.characters.last // 最后一个字符
        print(tc2)
        print(tc3)
        print(ts4.characters.indexOf("o")) // 获取指定字符的索引
        print(ts4.characters.contains("o")) // 判断是否包含指定字符
        let tb = ts4.characters.contains({"aeiou".characters.contains($0)}) // 判断aeiou是否包含ts4中的任意一个字符[判断是否包含元音字母]
        print("字符串包含字符串检测:" + String(tb))
        let tc4 = ts4.characters.filter {"aeiou".characters.contains($0)} // 字符拦截器,返回true则保留,false则移除[获取字符串中的元音字母]
        print("字符拦截器拦截的字符:" + String(tc4))
        let tca = ts4.characters.prefix(4) // 获取前面的4个字符[字符数组]
        let tca2 = ts4.characters.suffix(4) // 获取后面的4个字符[字符数组]
        print("前面4个前缀:" + String(tca)) // 字符数组-字符串
        print("后面4个后缀:" + String(tca2))
        let arr = ts3.characters.split{$0 == " "}.map{String($0)} // split分隔字符串,得到的结果为Array的SubSlice,然后调用集合的map方法强制转换为String数组
        print(arr)
        var tis = ts3.characters.startIndex // 获取开始位置Index 类型: String.CharacterView.Index对象
        var tie = ts3.characters.endIndex
        let c = ts3[tis.advancedBy(1)] // String[Index] 获取指定位置的字符,返回[开始位置+1]的Index对象
        print("获取字符串的Index=1的字符:"+String(c))
        print(ts3[tie.advancedBy(-1)]) // [最后位置-1]的Index对象
        print(ts3[--tie]) // 除了advancedBy方法对Index进行加减外还有(++,--)[最后位置-1],decrement自减Index
        print(ts3[++tis]) // [第一个位置+1],increment自增Index
        var ts6 = "hello"
        let tis6 = ts6.startIndex.advancedBy(1) // index=1的Index对象
        ts6.insertContentsOf("ey,h".characters, at: tis6); // 插入字符数组到指定Index位置
        print("指定Index位置插入字符串:" + ts6)
        ts6.removeAtIndex(tis6)
        print("指定Index位置移除字符:" + ts6)
        let tcs4 = Array(ts6.characters) // 将CharacterView转换为Array,Array的Index为Int类型,操作更方便
        print("转换为Array后获取指定Index的字符:" + String(tcs4[0]))
        // :4: Range 范围类型
        // 范围类型包含一个起始值 n1,一个结束值 n2, n1...n2(直到),n1..<n2(直到小于),n2不能小于n1,否则运行时报异常
        let _ = 1...3 // 声明范围类型,从1到3,包含3 [1,2,3]
        let _ = 1..<3 // 1到3,不包含3 [1,2]
        let _ = -1000...(-1) // -1000到-1
        for ix in 1...3 {
            print(ix)
        }
        let tr = 1...9
        if tr.contains(3) { // Range 类型操作方法
            print("范围值包含:3")
        }
        print("0.1...0.9包含0.5:" + String((0.1...0.9).contains(0.5)))
        let tca3 = Array(ts6.characters) // ts6转换为数组
        let tca4 = tca3[3...5] // 获取指定范围的数组
        print("根据指定范围截取数组:" + String(tca4));
        let _  = ts6.rangeOfString("hel") // Swift的字符串获取指定字符串的Range,返回值为Swift的Range范围对象
        let tis2 = ts6.startIndex.advancedBy(1)
        let tie2 = ts6.endIndex.advancedBy(-2)
        let ts7 = ts6[tis2...tie2] // 根据两个Index对象,创建一个Range范围,并根据Range直接截取字符串
        print("由2个Index对象创建的Range范围截取字符串:" + ts7)
        var tr6 = ts6.characters.indices // 返回字符串数组所在的范围[StartIndex...EndIndex范围]
        tr6.startIndex++
        tr6.endIndex--
        print("通过String.charaters.indices获取字符串的范围截取字符串:" + ts6[tr6])
        let tis7 = ts6.startIndex
        let tr7 = tis7.advancedBy(1) ... tis7.advancedBy(3) // 根据Index...Index创建范围对象
        ts6.replaceRange(tr7, with: "iPhone") // 范围替换
        print("通过Range范围进行字符串替换:" + ts6)
        ts6.removeRange(tr7) // 范围移除
        print("通过Range范围进行字符串移除:" + ts6)
        // 注意: Swift的Rang有两个点声明一个范围,而NSRange则有1个起点和长度声明一个范围,两者是完全不同的
        let tr8 = ts6.rangeOfString("ell") // 获取的是Optional Range
        print(tr8)
        // :元组: Tuple 用户自定义的有序集合对象,对象间用逗号分隔[这个是纯粹Swift专属语法]
        let _ : (Int, String) // (Int,String)元组,数列
        let _ : (Int, String) = (1, "One") // 元组定义并初始化,定义和初始化格式一样,类型顺序一致
        let _ = (1, "One") // 省略定义类型,隐式元组/数列
        var tti : Int
        var tts : String
        (tti, tts) = (1, "One") // 利用元组/数列进行多值初始化
        print("Tuple 元组/数列多值同时初始化:" + String(tti) + "," + tts)
        let (tt1i, tt1s) = (2,"Tow") // 利用元组同时定义多个变量
        print("Tuple 定义同时初始化多变量:" + String(tt1i) + "," + tt1s)
        let tt2 = (1, "One")
        let (_, s) = tt2 // 利用 _ 忽略指定位置的元组变量值
        print("利用 _ 忽略指定位置的元组:" + s)
        for (ix, c) in ts6.characters.enumerate() { // 字符数组枚举方法:enumerate() 产生的迭代对象为元组(index,character)
            print("character \(ix) is \(c)")
        }
        var tt3 = (1,"One") // 通过元组索引直接获取元组值, Tuple.0,Tuple.1, ...
        print("Tuple 利用Index索引获取元组指定位置值:" + tt3.1)
        tt3.1 = "Hello World" // 通过元组索引方式修改元组值
        var tt4 : (first:Int, second:String) = (1,"One") // 1. 为元组的属性添加元组属性名称,定义并初始化
        var _ = (first:1, second:"One") // 2. 简单方式定义元组
        var _ : (first:Int, second:String) = tt4 // 3. 赋值初始化
        tt4.first = 100 // 通过引用元组属性名称对元组进行赋值
        tt4.second = "One hundred"
        print("Tuple 利用声明元组名称方式引用:" + String(tt4.first) + "," + tt4.second)
        func tupleMaker() -> (first:Int, second:String) { // 定义函数返回元组类型
            return (1,"One")
        }
        let _ = tupleMaker();
        typealias Point = (Int,Int) // 利用typealias别名的方式定义元组类型,方便对元组类型的引用
        func pieceAt(p:Point){
            let (x,y) = p // 转义方便对元组变量进行操作使用
            print("利用typealias 对元组声明别名传入的值: x=" + String(x) + " y=" + String(y))
        }
        pieceAt((20, 45))
        // 输入参数列表,输出参数列表实际上就是一个元组/数列 Tuple
        func funcTuple2(i1:Int, _ i2:Int) ->(){}
        let inputParamsTuple = (1,2)
        funcTuple2(inputParamsTuple) // 直接用一个元组/数列作为输入参数列表,传入的元组必须是let常量,var变量编译报错
        func funcTuple3(i1 i1:Int, i2:Int) ->(){} // 声明外部参数名 (i1:,i2:)
        let inputParamsTuple2 = (i1:1, i2:2)
        funcTuple3(inputParamsTuple2)
        let _ = () // 空元组/数列
        // :5: Optional 对象类型是一个可以包含其他类型的容器当然也可不包含对象(空Optional),一个Option容器只能包含同一种类型对象
        var stringMaybe = Optional("howdy") // 创建一个Optional包含String类型的实体::他的类型是: Option(:String) 类型,不是Option更不是String
        print(stringMaybe)
        stringMaybe = Optional("XiaoMing") // 从新赋值给stringMaybe,类型为Option(:String)
        var _ = Optional(123) // 类型为:Optional(:Int)
        stringMaybe = "farawell" // Option对象直接赋值,该值会自动被Option封装,这个是合法的,系统自动封装
        var _ : Optional<String> // 声明一个为Option(:String)类型的Optional
        // Optional对象 封包? 解包!
        var _ : String?  // 声明一个为Option(:String)类型的Optional
        var _ : String? = "howdy" // 声明一个Optiaonal(:String)并初始化
        // Optional(:String)作为输入参数,系统自动封包
        func optionalExpecter(s:String?){}
        let stringMaybe1 : String? = "howdy"
        optionalExpecter(stringMaybe1) // Optional(:String)作为传入变量
        optionalExpecter("howday") // 系统自动封包String为Optional(:String),注意:系统不能自动解Optional封包
        // Optional(:String)解包
        func realStringExpecter(s:String){}
        realStringExpecter(stringMaybe1!) // 直接解包标识 !
        let _ = stringMaybe1! // 解包到变量
        let stringMaybe2 : ImplicitlyUnwrappedOptional<String> = "howdy" // 定义一个隐式不封包的Optional(:String)对象,注意:该对象的类型还是Optional(:String)而不是String
        realStringExpecter(stringMaybe2)
        let _ : String! = "howdy" // 简便方式定义一个隐式不封装Optional(:String)该对象的类型为Optional(:String)
        print("定义隐式不封包的Optional对象:")
        print(stringMaybe2)
        var stringMaybe3 : String? = "Howdy" // 封包Optional
        if stringMaybe3 == nil { // Optional 对象中的封装对象为空
            print("stringMaybe3 is empty")
        } else {
            print("stringMaybe3 is :")
            print(stringMaybe3)
        }
        stringMaybe3 = nil // nil 赋值,nil是一个速记符号
        print(stringMaybe3)
        if stringMaybe3 == nil {
            print("stringMaybe3 is empty now...")
        }
        var stringMaybe4 : String? // 定义一个Optional(:String)对象,并不初始化(系统默认初始化为nil),Swift只对Optional默认初始化为nil,其他类型不会默认初始化,nil值不能解包,因为Value不存在
        print("定义Optional对象变量,不初始化(系统默认自动初始化为nil):")
        print(stringMaybe4)
        if stringMaybe4 != nil {
            let realString = stringMaybe4! // nil值解包会导致程序崩溃
            print(realString)
        }
        // Optional对象不包含任何操作方法,不能通过.的方式访问到Optional对象的任何方法,必须先解包
        let stringMaybe5 : String? = "howdy"
        let upper = stringMaybe5!.uppercaseString // 先显式解包,后执行操作方法
        print(upper)
        // :: nil 一个神奇的符合
        var stringMaybe6 : String?
        let upper1 = stringMaybe6?.uppercaseString // Optional访问链?,系统先判断Optional对象是否包含值,如果包含值,则执行.操作方法,如果为nil不包含值,则不执行任何方法(对Optional执行不会系统崩溃)
        print(upper1) // Optional对象为nil那么执行的所有结果都为nil,Optional对象不为空通过?方式执行的所有结果都为Optional对象
        print(stringMaybe6?.uppercaseString) // 结果为Optional的nil对象
        stringMaybe6 = "XiaoTian"
        print(stringMaybe6?.uppercaseString) // 结果为Optional(:String)对象
        var window : UIWindow?
        let _ = window?.rootViewController?.view.frame // Optional(:UIWindow)访问链,多层Optional嵌套访问操作,当其中一个Optional对象为nil时,立即返回nil不会继续执行后续操作,所以Optional对象嵌套实体对象的方法并不会导致程序崩溃
        let ok : Void? = window?.rootViewController = UIViewController() // 利用Void?接受语句返回值[Swift的所有语句都是返回Void值的],当语句没有执行时(window为nil时)系统返回nil值
        if ok != nil {
            // ok 语句已经执行过
            print("利用Void?封包检测到Optional自动解包ok语句\"已经执行\"过了")
        } else {
            // ok 语句没有执行
            print("利用Void?封包检测到Optional自动解包ok语句\"没有执行\"")
        }
        if (window?.rootViewController = UIViewController()) != nil {
            print("合并方式,利用Void?封包检测到Optional自动解包ok语句\"已经执行\"过了")
        }
        // 注意: Void? Optional自动解包语句执行返回值不能进行解包,因为语句执行完成后为Void类型,这个是无类型
        class Dog {
            var noise : String?
            func speak() -> String? {
                return self.noise
            }
        }
        let d = Dog()
        let bigname = d.speak()?.uppercaseString // 通过Optional方式执行Optional自动解包语句
        print(bigname) // nil Optional类型
        // Optional比较运算符,Optional运算符实际上是执行Optional封包的值的运算
        let stringMaybe7 : String? = "howdy"
        if "howdy" == stringMaybe7 { // Optional对象的Value值执行运算符 ==
            print("Optional操作运算符==(:equal:操作)运算符.")
        }
        let intMaybe : Int? = 2
        if intMaybe < 3 {
            print("Optional操作运算符 < 运算符.")
        }
        // 1.Optional的目的是为了可以和Object-C中的nil转换
        let v = UIView()
        let c1 = v.backgroundColor
        let _ = c1?.colorWithAlphaComponent(0.5) // backgroundColor可以为nil,所以定义的是UIColor?
        // 2.Optional的目的是为了延时初始化
        @IBOutlet  var _ : UIButton! // unwrapped Optional Object default nil ::Interface Builder::
        var _ : [String]! // 定义[]数组array
        let s2 = "32"
        let i2 = Int(s2) // String -> Int :: Optional 类型,因为可能为nil(转换失败的时候)
        print(i2) // Optional(32)
        let arr2 = [1,2,3]
        let ix = (arr2 as NSArray).indexOfObject(4) // Swift中封装了的Object-C方法
        if ix == NSNotFound {
            // Check the index is Found in string
        }
        let ix2 = arr2.indexOf(4) // Swift中的方法,返回Optional(:Int)类型
        if ix2 == nil {
            // Check the index is Found in string
        }
    }
}
// ::Object Type 对象,三种风格的对象enum,struct,class
// protocol 接口协议,generic ,extension 扩展
class ObjectType {
    func start() -> Void{
        // 类的定义可以在任何地方,位置不同,作用域也不同(1.在文件Level作用域为整个文件/整个项目/整个Module)
        class Manny{} // 首字母大写,驼峰命名法则
        struct Moe{}
        enum Jack{}
        // 类初始化构造器
        class Dog {
            var name = ""
            var license = 0
            init() {} // 无参构造器
            init(name:String) { // 多构造器
                 self.name = name
            }
            init(license:Int) {
                self.license = license
            }
            init(name:String, license:Int) {
                self.name = name
                self.license = license
            }
            func instance() -> Dog? {
                let _ = Dog()
                let _ = Dog(name: "Fido")
                let _ = Dog(license: 2)
                let _ = Dog(name: "Spot", license: 1)
                return nil
            }
        }
        class Dog1 {
            var name = ""
            var license = 0
            init(name:String = "", license:Int = 0) { // 带默认值得参数,初始化时可以省略带默认值得参数
                self.name = name
                self.license = license
            }
            func instance() -> Dog1? {
                let _ = Dog1() // 直接省略两个带默认参数的构造器
                let _ = Dog1(name: "Fido") // 省略license带默认值得参数
                let _ = Dog1(license: 1) // 省略name带默认值得参数
                let _ = Dog1(name: "Spot", license: 1) // 不省略带默认值的参数
                return nil
            }
        }
        class Dog2 {
            var name : String // 为初始化,必须在构造器中初始化[所有变量都要初始化]
            var license : Int
            init(name:String = "", license:Int = 1) {
                self.name = name // 构造器初始化变量
                self.license = license
            }
        }
        class Dog3 {
            let name : String // 定义为常量[自能初始化一次],常量必须在构造器中初始化
            let license : Int
            init(name:String, license:Int) { // 没有默认值,不能省略
                self.name = name // 构造器中初始化常量
                self.license = license
            }
        }
        class Dog4 {
            var name : String! // Optional(:String) unwrapped Optional default init as nil
            var license : Int! // Optional(:Int) unwrapped Optional
            var albums : [String]!
        }
        class Dog5 {
            var name : String
            var license : Int
            init(name:String, license:Int) {
                self.name = name
                // meow()
                self.license = license
                // 实例方法
                meow() // 在构造器中调用实例方法,必须要在所有变量都初始化完成后(Optional除外:自动初始化:),因为在实例方法里可能调用成员变量
            }
            func meow() {
                print("meow")
            }
        }
        class Digit {
            var number : Int
            var meaningOfLine : Bool
            init(number:Int) {
                self.number = number
                self.meaningOfLine = false
            }
            convenience init() { // 委托初始化,Delegate Initializer[convenience:简便构造器]
                self.init(number:42)
                // 简便构造器不能初始化/重设置常量(普通构造器已经初始化了,常量已经赋值完成)
                self.meaningOfLine = true
            }
            // 注意:构造器可以相互委托(相互调用),但是注意不要造成死锁
        }
        class Dog6 {
            let name : String
            let license : Int
            // 构造器默认返回Dog6实体,并且系统自动返回self,所以默认省略返回语句
            init!(name:String, lincense:Int) { // 返回 unwrapped Optional 对象[目的:可以返回为nil,可以直接使用实体成员]
                self.name = name
                self.license = lincense
                if name.isEmpty {
                    return nil // failable initializers :实体类初始化失败
                }
                if lincense <= 0 {
                    return nil // 实体类初始化失败,返回nil
                }
            }
            // 注意:
            // 1.Object-C的所有构造器都是可以返回nil,所以在Swift中基本都是Wrapped Optional (init?)类型,然而在Swift中如果没有声明为Optional的类型则不能返回nil,不是所有的类的构造器都是failable initializer
            // 2.构造器中的变量初始化时不会触发变量的Setter 侦听器 [Setter Observe]
        }
        class Moi {
            let first = "Matt"
            let last = "Neuburg"
            // let whole = self.first + " " + self.last
            var whole : String { // 引用到类属性,self必须在初始化后才能引用
                // property getter
                return self.first + " " + self.last // 初始化后引用self
            }
        }
        //
        class Moi2 {
            let first = "Matt"
            let last = "Neuburg"
            // 如果通过匿名自执行函数方式初始化变量同时引用其他成员,那么该变量必须声明为lazy延时变量
            lazy var whole : String = { // 匿名自执行函数(define-and-call anonymous function)
                //var s = self.first
                //s.appendContentsOf(" ")
                //s.appendContentsOf(self.last)
                //return s
                return ""
            }()
        }
        // 
        struct Greeting {
            static let friendly = "Hello there" // 静态成员常量
            static let hostile = "Go away"
            // 静态成员常量直接引用其他静态成员常量(因为静态成员属于lazy延时初始化:运行时:成员)
            static let ambivalent = Greeting.friendly + " but " + Greeting.hostile
            static var ambivalent2 : String { // computed property 合成成员属性
                return self.friendly + " but " + self.hostile // 引用self,self代表Greeting类型Type,延时初始化变量
            }
            static var ambivalent3 : String = {
                //return self.friendly + " but " + self.hostile
                return ""
            }()
        }
        MyClass().start()
        enumStart()
        structStart()
        classStart()
    }
    // Methods / function
    class MyClass {
        var s = ""
        func store(s:String) { //1. Instance Method 实体方法 2.Method方法成员
            self.s = s
        }
        func start() {
            let m = MyClass()
            let f = MyClass.store(m) // 根据传入的实体获取方法成员Method
            f("howdy") // 执行方法Method成员
            print(m.s)
        }
    }
    // SubScript 标注方法
    struct Digit {
        var number : Int
        init(_ n:Int) {
            self.number = n
        }
        // instance[index] 下标模式访问
        subscript(ix:Int) -> Int { // 定义subscribe[] 方法,索引方法::subscript紧接输入参数列表,没有函数名称
            // getter(如果只有Getter,那么Getter方法名和大扩号可以省略)
            get {
                let s = String(self.number)
                return Int(String(s[s.startIndex.advancedBy(ix)]))!
            }
        }
        func start() {
            let d = Digit(1234) // 实例化
            let _ = d[1] // 执行subscribe方法,传入Index,Index Getter
        }
    }
    struct Digit2 {
        var number : Int
        init(_ n:Int) {
            self.number = n
        }
        subscript(index:Int) -> Int { // instance subscript method [Swift专属索引方法]
            get {
                let s = String(self.number)
                return Int(String(s[s.startIndex.advancedBy(index)]))! // 获取数字指定索引的Index的值
            }
            set {
                var s = String(self.number)
                let i = s.startIndex.advancedBy(index)
                s.replaceRange(i...i, with: String(newValue)) // 设置指定索引的Index的值
                self.number = Int(s)!
            }
        }
        subscript(index:String) -> Int { // 定义多个subscript method
            get {
                return number
            }
        }
        subscript(index:Digit2) -> Digit2? {
            get {
                return nil
            }
        }
        func start() {
            var d = Digit2(1234)
            d[0] = 2 // 触发subscript的setter方法,设置第一个数字为2
        }
        class Dog {
            struct Noise {
                static var noise = "Woof" // 嵌套类成员
            }
            func bark() {
                print(Dog.Noise.noise) // 引用其他类成员
                Dog.Noise.noise = "Arf" // 设置嵌套成员值
            }
        }
        func instanceReference() {
            let s2 = "Hello, world"
            let _ = s2.uppercaseString
            //let theVC = ViewController()
            let app = UIApplication.sharedApplication() // Application Instance 程序上下文(代表整个程序本身)
            let window = app.keyWindow // Window Key 属性(程序窗口Key)
            let viewController = window?.rootViewController // Window Root View Controller 窗口的根视图管理器(Optional Type)
            let _ = UIApplication.sharedApplication().keyWindow?.rootViewController // 合并写法(方便但是不利于调式Debug,所以尽量分解多部)
            print(viewController)
        }
    }
    // Enums 枚举
    enum Filter { // 枚举-包含一个不同内容的集合
        case Albums // 枚举元素Item
        case Playlists
        case Podcasts
        case Books
    }
    enum PepBoy : Int { // 枚举声明Item的类型
        case Mannie // 默认从0开始累加
        case Moe
        case Jack
    }
    enum Filter2 : String { // 枚举声明Item的类型同时赋值,当为String时如果不赋值,那么值默认为枚举类型名称
        case Albums = "albums" // 如果不赋值,默认值等于枚举Item的名称
        case Playlists = "playlists"
        case Podcasts = "podcasts"
        case Books = "books"
    }
    enum Error { // 枚举声明Item多类型,创建的时候必须要传入指定类型的值(后赋值)
        case Number(Int) // 声明为Int类型的Item
        case Message(String) // 声明为String类型的Item
        case Mutilate(n:Int, s:String) // 声明为多类型集合的Item
        case Fatal // 不声明类型(不传初始化参数)
        init(_ ix:Int){
            self = Error.Number(-1)
        }
    }
    enum Filter3 : String { // 枚举包含初始化函数
        case Albums = "albums"
        case Books = "books"
        case Playlists = "playlists"
        static var cases : [Filter3] = [Albums, Books, Playlists] // 枚举成员变量
        init!(_ index:Int) { // 声明返回unwrapped Optional类型,可以返回nil
            if !(0...3).contains(index) { return nil } // 检测数组Index越界返回nil(faildable initializer)
            self = Filter3.cases[index] // 必须设置self的值,self初始化
        }
        init!(_ rawValue:String) { // 声明多个初始化方法,返回unwrapped Optional类型,可以返回nil
            self.init(rawValue:rawValue) // 调用枚举类的初始化方法
        }
        // 定义枚举类的成员属性(声明的枚举实例必须是变量var才可以引用实体中的属性)
        var query : String {
            switch self { // 根据当前Self枚举分支[getter方法当然也可以定义setter方法]
            case .Albums:
                return "albums"
            case .Books:
                return "books"
            case .Playlists:
                return "playlists"
            }
        }
    }
    enum ShapeMaker { // 枚举类方法
        case Rectangle
        case Ellipse
        case Diamond
        func drawShape (p: CGMutablePath, inRect r : CGRect) { // 枚举成员方法
            switch self {
            case Rectangle:
                break
            case .Ellipse:
                break
            case .Diamond:
                break
            }
        }
        static var cases : [ShapeMaker] = [Rectangle,Ellipse,Diamond]
        // 如果枚举的方法包含对当前枚举实体的重新赋值,那么该枚举的方法必须声明为mutating方法
        mutating func advance() { // 对当前枚举selft进行重新赋值,用关键字mutating[变化,可变],调用本方法的实体必须为变量实体var不能为常量let
            var ix = ShapeMaker.cases.indexOf(self)! // 解封装
            ix = (ix + 1) % 4
            self = ShapeMaker.cases[ix] // 重新赋值
        }
    }
    func enumStart() {
        let _ = Filter.Albums // 定义一个枚举类型的常量
        let _ : Filter = .Albums // 定义枚举常量,类型显式定义(注意:必须要带点 . )
        func filterExpecter(type:Filter){
            if type == .Albums { // 省略枚举类名, Swift识别到这个一个比较Equality,所以前面的type是枚举Filter类,所以后面的比较项Swift也能识别到,可以省略枚举类名
                
            }
        }
        filterExpecter(.Albums) // 智能的Swift会自动检测函数定义的枚举类型,可以省略枚举类的名称直接.Albums[由此Cocoa中的枚举类名很长,可以很省事喔]
        // Swift智能识别枚举类型,省略枚举类名
        let v = UIView()
        v.contentMode = .Center // UIViewContentMode.Center 简洁的Swift
        // 枚举的值
        let type = Filter2.Albums // 枚举Item(字面值)
        let rawValue = type.rawValue // 枚举Item的值(实际值 value)
        print(rawValue)
        // 枚举通过实际值初始化
        let type2 = Filter2(rawValue: "albums") // 初始化的值可能为nil
        if type2 == .Albums {
            // 初始化的值为Optional,因为可能为nil不存在的类型
        }
        let _ : Error = .Number(4) // 初始化枚举的时候传入值
        let _ : Error = .Message("this is message.")
        let _ : Error = .Mutilate(n: -12, s: "oh the error")
        let _ : Error = .Fatal
        let mutilateMaker = Error.Mutilate // 先引用枚举
        let _ = mutilateMaker(n:-1000, s:"Unbelievable bad error") //初始化
        // 注意:Optional类型其实就是一个简单的枚举:Optional.None (没有值,nil),Optional.Some(包含值,封装值)
        let _ = Filter3.Albums
        let _ = Filter3(rawValue:"Playlists")
        let _ = Filter3(1) // init(:Int) 初始化方法创建枚举
        let _ = Filter3("Playlists") // init(:String)初始化方法创建枚举
        let typeQuery = Filter3(2).query; // 调用枚举类的成员属性
        print(typeQuery)
        var typeShape = ShapeMaker.Ellipse
        typeShape.advance() // 调用实体可变方法,typeShape本身的值被改变
        //
        // 注意:Enum 是一个用名称标识switch状态的类型,可以包含已知的多种类型值[主要就是可以用名字标识的作用]
        enum InterfaceMode : Int {
            case Timed = 0
            case Practice = 1
        }
        var interfaceMode : InterfaceMode = .Timed {
            willSet (mode) { // 声明Setter Observe 设置侦听器
                //
            }
        }
        interfaceMode = .Practice // 重新赋值
    }
    // Structs 结构体[Swift中的优秀的类型,Swift中的几乎所有构造类型都是Struct:Int,String,Range,Array...]
    struct Digit1 {
        var number = 42 // struct 属性变量
        var number1 : Int // 声明变量,可以通过实例改变值
        static let Rows = "CardMatrixRows" // 静态常量
        init(){ // 无参构造器
            number1 = 42
        }
        init(number:Int) { // 有参构造器
            self.number = number
            self.number1 = number
        }
        static var One : Digit1 = Digit1(number: 1) // 静态枚举类型变量
        static var Tow : Digit1 = Digit1(number: 2)
        // 注意: struct 可以包含静态方法,普通方法,索引(下标)方法
    }
    struct Digit3 {
        var number : Int
        init(_ n:Int){
            self.number = n
        }
        mutating func changeDigit3To(n:Int){ // mutaing可变属性方法,前提是定义的struct必须为var变量
            self.number = n
        }
    }
    func structStart(){
        var _ = Digit1() // struct 无参初始化
        var _ = Digit1(number: 50) // struct 有参初始化
        var _ = Digit1.Rows
        var _ : Digit1 = .One // struct类型中的静态同类型属性,可以省略struct名称(Swift会从类型中搜寻该属性)
        var _ = Digit3(80) // 省略外部变量名
        var d = Digit3(0)
        d.number = 100
        var d1 = Digit3(123){ // struct绑定Setter Observer[Digit3的值改变是会触发]
            didSet {
                print("struc因为内部属性值改变而触发struct改变侦听器 :d1 was set")
            }
        }
        d1.number = 20 // 触发struct的setter observer侦听器[struct类型的属性改变前提必须为var类型struct,let声明的struct不能改变属性值],因为结构体的属性改变可以引起结构体的值变
    }
    // Classes 类(相当于struct的简化:区别点1.类是引用类型2.可变实体[类不能包含可变方法mutating method]2.多引用3.继承性)
    // 1.Class可变性是相对于struct,enum而言的,struct,enum是对地址值得直接引用,所以struct,enum都是代表唯一的地址值,定义时如果定义为常量,则不能再改变值,如果要通过方法改变其值则必须声明为可变方法 mutating keyword 关键字,声明struct,enum中的方法为可变实体方法,而Class没有这个关键字的说法,因为Class本身是可变的实体
    class Dog {
        var name : String = "Fido"
    }
    // 类的继承
    class Quadruped {
        func walk() {
            print("Quadruped walk")
        }
    }
    class Dog2 : Quadruped {
        func bark() {
            print("Quadruped bark")
        }
    }
    class NoisyDog : Dog2 {
        override func bark() { // 子类覆盖父类方法,override覆盖关键字
            super.bark() // super父类引用
            print("NoisyDog bark")
        }
    }
    // 类的初始化
    class ImplicitInitalizer {
        // 无init构造器,隐式初始化,传统默认调用无参构造器
    }
    class DesignatedInitalizer {
        var n : Int
        //显式构造器
        init(n:Int){
            self.n = n
        }
    }
    class ConvenienceInitalizer {
        var n : Int
        // 快速构造器,调用其他显式构造器来完成必要的初始化工作[快速构造器也必须保证完成所有变量初始化]
        init(n:Int) {
            self.n = n
        }
        convenience init(){
            self.init(n: 1) // 通过self.init(...)来调用其他显式构造器
        }
        // 快速构造器可以通过调用其他快速构造器完成初始化
        convenience init(name:String) {
            self.init() // 调用其他快速构造器
        }
    }
    class SubConvenienceInitalizer : ConvenienceInitalizer {
        // 子类不声明构造器,那么子类的构造器全部与父类一样,自动继承
    }
    class Sub2ConvenienceInitalizer : ConvenienceInitalizer {
        convenience init(){ // 快速构造器必须通过slef调用显式构造器来初始化,不能super.init(...)调用父类构造器
            // 快速构造器不能override,不能用覆盖
            print("Sub2ConvenienceInitalizer init")
            self.init(n:1) // 快速构造器只能用过self调用本类构造器进行初始化,不能super
        }
        override init(n: Int){ // 显式覆盖构造器必须要用 override覆盖关键字声明为覆盖,并且必须用super调用父类构造器完成父类的初始化
            // instanceMethod() 显式构造器的super.init(...)必须在第一,必须在执行实体函数之前进行初始化
            super.init(n: 2) // 必须用super构造器,确保所有变量初始化
            instanceMethod() // 只有在初始化完成后才可以调用实体方法...
        }
        // :: 显式构造器必须要调用父类的构造器进行初始化,当然如果你不写super.init(...)系统会自动帮你添加无参构造器,前提是你的父类包含无参显式构造器
        func instanceMethod() {
            
        }
        class Cat {
            // 默认只包含无参构造器
        }
        class NameCat : Cat {
            let name: String
            init(name:String) { // 显式构造器
                self.name = name // 没有调用父类super.init(...)构造器,其实系统默认会调用父类无参构造器(如果有,如果构造器被重写,则会报编译错误),建议不要省略调用父类构造器
            }
        }
    }
    class FailableInitalizer : NSObject {
        // 可为空nil初始化构造器
        init?(ok: Bool) {
            super.init() // 可空构造器可以调用非可空构造器,并且不会报错,因为非空构造器永远为非空
        }
    }
    class NormalInitalizer : FailableInitalizer {
        override init(ok:Bool) { // 普通非空构造器可以覆盖父类的可空构造器,同时可以调用父类的可空构造器,但是如果父类构造器返回nil空,则程序会崩溃
            super.init(ok: ok)! // 调用父类的可空构造器,并且对构造结果进行解包
        }
    }
    class RequireInitalizer {
        // 声明子类必须要继承的构造器
        var name : String
        required init(name:String) {
            self.name = name
        }
    }
    class SubRequireInitalizer : RequireInitalizer {
        // 没重写构造器,那么继承父类的所有构造器
    }
    class Sub2RequireInitalizer : RequireInitalizer {
        var isSub = false
        init(isSub:Bool) {
            self.isSub = isSub
            super.init(name: "Fido")
        }
        required init(name:String) { // required声明的父类构造器必须要重写,否则编译移除
            super.init(name: "Liya")
            //let _ = MyViewController()
            //let _ = MyViewController(coder: NSCoder.init())
        }
        // 利用覆盖特性,自定义重写coco控件构造器方法,可以方便简单构造coco控件
        class MyViewController : UIViewController {
            init() { // 自定义的快速构造器
                super.init(nibName: "nibFileName", bundle: nil)
            }
            
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented") // 运行时报fatal error 错误,程序崩溃
            }
        }
    }
    class DeInitalizer {
        // 重初始化构造器,这个构造器不是由用户调用的,而是由系统运行时管理,例如当实体被系统强制回收后,系统在程序要访问该实体时会触发重初始化
        deinit {
            // 重初始化构造器
        }
    }
    class ClassPropertiesAndMethod {
        // 静态方法,类final方法[不能被覆盖]
        static func staticSay() -> String {
            return "ClassPropertiesAndMethod staticSay"
        }
        // 类方法[可以被覆盖]
        class func classSay() -> String {
            return "ClassPropertiesAndMethod classSay"
        }
        class SubClass : ClassPropertiesAndMethod {
            override class func classSay() -> String { // 覆盖父类的class method类方法
                return "ClassPropertiesAndMethod sub classSay"
            }
        }
        // 静态变量,类final变量[不能被覆盖]
        static var someThing = "static var say something"
        // 类运算变量,类变量[可以被覆盖,必须是可运算的: Computed Property]
        class var computedSomeThing : String {
            return "class var computed say something"
        }
        class SubClass2 : ClassPropertiesAndMethod {
            override static var computedSomeThing : String {
                return "SubClass2 override class var computed say something"
            }
        }
        // 实体方法
        func sayAllSomething() {
            // 类引用
            print(ClassPropertiesAndMethod.staticSay())
            print(ClassPropertiesAndMethod.classSay())
            print(SubClass.classSay())
            print(ClassPropertiesAndMethod.someThing)
            print(ClassPropertiesAndMethod.computedSomeThing)
            print(SubClass2.computedSomeThing)
        }
    }
    // 类的继承与多态性 Polymorphism(继承与引用)
    class MyDog {
        func bark() {
            print("MyDog")
        }
    }
    class MySubDog : MyDog { // 继承父类,并改写父类[多态]
        override func bark() {
            super.bark() // 父类方法
        }
    }
    // 类型转换[多态性,子类->父类, 父类->子类]
    class CastingClass {
        class Dog {
            func bark() {
                print("Dog bark")
            }
        }
        class NoisyDog : Dog {
            override func bark() {
                super.bark()
                print("Noisy Dog bark")
            }
            func beQuiet() { // 子类扩展方法
                print("Noisy beQuiet")
            }
        }
        func start() {
            let d = NoisyDog()
            noisyDogSay(d)
        }
        func noisyDogSay(d:Dog) {
            (d as! NoisyDog).beQuiet() // Casting 强制转型[父类->子类,向下转型]
            let d : Dog? = NoisyDog()
            if d is NoisyDog {
                print("用if is Type 来判断是否是指定类型")
            }
            // as! 实际上就是强制转型的一个方式,因为Option类型是一个struct然而as!由系统先判断转化对象是否为nil,如果不为nil那么就获取Option里面的值,然后执行转化
            let d1 : Dog? = NoisyDog()
            let d2 = d1 as! NoisyDog // as! option类型转化为指定类型,如果不能转化那么程序崩溃
            d2.beQuiet()
            // as? Option 类型先检查是否为nil,如果不是nil系统通过Option方式转化为指定类型,如果不能转那么返回nil的Option
            let d3 : Dog? = NoisyDog()
            let d4 = d3 as? NoisyDog // as? option类型转化为指定option类型
            d4?.beQuiet()
            // as Swift->Object-C Casting转化
            let s = "Hello"
            let range = (s as NSString).rangeOfString("ell") // Swift->Object-C :结果为NSRange类型
            print(range)
            // 实际上Swift->Object类型系统会自动转化并且通用不保存,所以在swift上可以直接用Object-C对应的Swift类型代替
            let ud = NSUserDefaults.standardUserDefaults()
            ud.setObject(1, forKey: "Test") // NSUserDefaults 中的setObject方法,参数为Object类型
            let i = ud.objectForKey("Test") as! Int // NSUserDefaults 中的objectForKey方法,返回的是NSNumber类型
            print("Swift对应于Object-C类型的通用方法(系统自动处理) i=" + String(i))
        }
        func noisyDogSay2(d:Dog) {
            if d is NoisyDog { // is 关键字判断是否可以转型
                let d2 = d as! NoisyDog // 转型[as,as!,as? 转型符号]
                d2.beQuiet()
                // :: as Swift->OC类型转换[桥接器类型转换,事实上不需要用户手动转,因为Swift系统会自动适应桥接器转换]
                // :: as! 转换并解包
                // :: as? 转换并封包
                let s = "hello"
                let _ = (s as NSString).rangeOfString("ell")
                //
                let ud = NSUserDefaults.standardUserDefaults() // OC方法
                ud.setObject(1, forKey: "Test") // Int:1 系统自动转换为NSObject类型[Int->NSNumber->保存]
                let _ = ud.objectForKey("Test") as! Int // NSObject 转为Int [NSNumber->Int]
            }
        }
        func noisyDogSay3(d:Dog) {
            let d2 = d as? NoisyDog // Casting 强制转换,如果类型不合法,转化不成功返回nil,而不会崩溃
            if d2 != nil {
                d2?.beQuiet()
            }
        }
        func noisyDogSay4(d:Dog) {
            (d as? NoisyDog)?.beQuiet() // 强制转型为Optional类型,解包成功则执行方法[转型执行,而不会崩溃]
        }
    }
    // Type Reference 类型引用
    class TypeReference {
        
        func start(){
            Dog().bark()
            Dog2().bark()
            let dog : Dog = Dog2()
            print(dog.dynamicType) // 输出实体引用的实际类型名称
            typeExpecter(Dog)
            let d = Dog();
            typeExpecter(d.dynamicType)
            let _ = dogMakerAndNamer(Dog) // 通过类类型初始化实体
            let _ = dogMakerAndNamer(Dog2)
            let _ = Dog.makeAndName() // 通过类方法初始化实体
            let _ = Dog2.makeAndName()
        }
        
        class Dog {
            var name : String
            class var whatDogsSay : String { // 可运算的类属性
                return "Woof"
            }
            func bark() {
                print("直接类型引用类变量:" + Dog.whatDogsSay) // 类属性,通过类型来引用[指定类的类型]
                print("通过动态类型dynamicType引用类变量:"+self.dynamicType.whatDogsSay) // 类属性,通过类型来引用[不指定类型,通过获取当前的类型dynamicType动态类型]
            }
            init () { // 无参构造器
                name = "Dog"
            }
            required init(name:String) { // required构造器,声明后可以通过类型来初始化该实体
                self.name = name;
            }
            
            class func makeAndName() -> Dog { // 类方法的构造器:通过self.init(...)初始化:返回类型为Dog根类型
                let d = self.init(name: "Fido")
                return d
            }
            
            class func makeAndNameSelf() -> Self { // 通过类方法构造,返回的是Self当前类类型::大写Self::
                let d = self.init(name:"Fido")
                return d
            }
            
            func havePuppy(name name:String) -> Self { // 通过普通实例方法构造,返回的是Self当前类类型::大写Self::
                return self.dynamicType.init(name:name) // 同当前实例的动态类类型进行初始化 当前实例::小写self::
            }
            // 类操作
            // :: .daynamicType 动态类类型 self.dynamicType.init(name: "")
            // :: .Type 类类型 Dog.Type
            // :: .self 实体类型的实例 Dog.self.init(name: "")
            // :: self 当前实例
            // :: Self 当前类类型:大写Self
        
        }
        
        class Dog2 : Dog {
            override class var whatDogsSay : String {
                return "Woof Woff Woff" // dynamicType 动态引用当前类型self 和 self.dynamicType的区别
            }
        }
        
        func typeExpecter(whatType:Dog.Type){ // 传入Dog的类型/继承类型
            
        }
        
        func dogMakerAndNamer(whatType:Dog.Type) -> Dog {
            let d = whatType.init(name:"Fido"); // 通过类型Type来初始化的初始化方法必须要是required的,否则不能保证该类型一定有该构造器
            return d
        }
    }
    // 协议,接口
    class Protocols {
        func start() {
            let bird = Bird()
            tellToFly(bird) // 接口作为参数
            let type = Filter.Albums
            print(type)
            print("It is \(type)")
            tellGetWorm(Bird())
            // 可选的实现方法的接口协议,实例初始化
            let cop : OptionalProtocol = ClassOptionalProtocol()
            print(cop.song) // 没有继承的属性,默认为nil
            let doubleWrapped : String?? = cop.song // 双重封包?? Option中封装Option是合法的
            print(doubleWrapped)
            // 当可选协议中的方法不确认是否已经被继承时,可以通过?对方法进行继承判断,如果没有改方法,则不会报错
            cop.sing?() // 协议中可选方法中的封包与解包,Object-C桥接方法通过Option进行桥接,在执行方法前声明执行的转换操作
            let _ = Nest(integerLiteral:10)
            reportEggs(10)
            
        }
        struct Bird : Flier { // struct继承接口协议[协议必须定义在swift文件的根层]
            func fly() { // 接口协议方法
                
            }
            func getWorm() {
                print("Call get worm method")
            }
        }
        func tellToFly(f:Flier) { // 接口协议类型作为传入参数类型
            f.fly()
        }
        enum Filter : String, CustomStringConvertible { // 实现自定义字符串转换接口
            case Albums = "Albums"
            case Playlists = "Playlists"
            case Podcasts = "Podcasts"
            case Books = "Audiobooks"
            // 重写转换方法[enum实例转字符串描述方法]
            var description : String {
                return self.rawValue // 返回当前的Enum 的值
            }
        }
        func isBird(f:Flier) -> Bool {
            return f is Bird
        }
        func tellGetWorm(f: Flier) {
            (f as? Bird)?.getWorm() // 通过接口传入实例,强制转换为类型,调用其方法
        }
        // 如果你要省略的方法同时继承过协议,可以用合并匿名方法实现,参数为多接口协议类型
        func combineProtocols(p: protocol<CustomStringConvertible,Flier>) {
            // p为多种协议类型的合并类型
        }
        class ViewController : UIViewController {
            init() { // 只用来实现自己自定义的构造器
                super.init(nibName: "viewController", bundle: nil)
            }
            required init?(coder aDecoder: NSCoder) { // 为了编译通过而补全的构造器,不属于自定义的构造器,直接禁止使用
                fatalError("nit?(coder:) has not been implemented") // 如果调用运行时crash
            }
        }
        // Literal Convertibles 文字值转义接口::传入文字值类型,系统自动转义为相应的类型值
        // NilLiteralConvertible : nil
        // BooleanLiteralConvertible
        // IntegerLiteralConvertible
        // FloatLiteralConvertible
        // StringLiteralConvertible
        // ExtendedGraphemeClusterLiteralConvertible
        // UnicodeScalarLiteralConvertible
        // ArrayLiteralConvertible
        // DictionaryLiteralConvertible
        struct Nest : IntegerLiteralConvertible { // 继承整数值转义接口:传入整数,系统调用定义进行转义
            var eggCount : Int = 0
            init() {}
            init(integerLiteral value : Int){ // 整数字面转义初始化构造器
                self.eggCount = value
            }
        }
        func reportEggs(nest: Nest) { // 可以直接传入Integer类型,由IntegerLiteralConvertible进行转型
            print("this nest contains \(nest.eggCount) eggs")
            // 文字值转义调用 reportEggs(4) ::传入4系统自动将4转义为Nest对象传入
        }
        
    }
    
    func classStart() {
        let dog = Dog() // 定义为let常量
        dog.name = "Lop" // class 类的可变性原因,即使定义为let都可以对实体变量赋值[let对实体类的属性没限制常量作用]
        var rover : Dog = Dog() { // 实体改变侦听器
            didSet {
                print("did set rover")
            }
        }
        rover.name = "Rover" // 改变实体类的属性值不会触发实体值改变侦听器[和struct,enum 不同]
        // rover = Dog() // 会触发Dog实体改变侦听器
        // 枚举,结构体:传值
        var d = Digit3(123)
        print(d.number)
        var d2 = d // 结构体传值
        d2.number = 456
        print(d.number) // 传值的结构体对原变量不会变化
        // 类:传引用地址
        var fido = Dog()
        print(fido.name)
        fido.name = "Rover"
        print(fido.name)
        // 方法传枚举,结构体的值
        func digitcChanger(var d:Digit3){ // 用var声明传入的参数可变,但是这个是原参数的拷贝
            d.number = 12 // 结构体传进来的是值,即使改为var也是一个拷贝值,改变参数对原来外部变量没影响
        }
        var d3 = Digit3(123)
        print(d3.number)
        digitcChanger(d3) // 传值
        print(d3.number)
        //方法传类的引用地址
        func dogChanger(d:Dog){
            d.name = "Bill"
        }
        let fido2 = Dog()
        dogChanger(fido2)
        print(fido2.name)
        // :: 结构体内部不能包含结构体本身的变量,因为结构体是一个值
        // :: 枚举类内部可以包含枚举类本身,但是包含枚举的case必须用indirect间接枚举关键字声明
        enum Node{
            case None(Int)
            indirect case Left(Int,Node)
            indirect case Right(Int,Node)
            indirect case Both(Int,Node)
        }
        NoisyDog().bark()
        SubConvenienceInitalizer(name: "lisa")
        let _ = Sub2ConvenienceInitalizer()
        let _ = Sub2RequireInitalizer(name: "Bill")
        ClassPropertiesAndMethod().sayAllSomething()
        CastingClass().start()
        TypeReference().start()
        Protocols().start()
        GenericsCallBack().start()
        FlowControlAndMore().start()
    }
    func digetChanger(var d:Digit3){ // 方法参数默认传入的是let,所以结构体要用var声明后才可以改变结构体
        d.number = 12
    }
    func dogChanger(d:Dog){ // 方法传入的类型虽然是let,但是类是引用类型,let对引用类型没有限制作用
        d.name = "Rover"
    }
}
// 接口协议,必须在文件的根层定义
protocol Flier {
    func fly()
}
protocol BaseProtocol {
    // 协议属性
    var propertyString : String { // 1.接口协议中不能包含let的静态实现
        get set // 2.接口协议中必须声明该实现实现的get,set方法,不能省略
    }
    static var propertyStringStatic : String { // 静态属性
        get
    }
    // 协议方法
    func getProtocolName() -> String // 接口协议方法不能包含方法体
    subscript(index: Int) -> String { // subscribe方法,必须声明继承的get,set类型
        get set // 声明类型,不是方法体,get,set不能包含方法体
    }
    static func baseName() -> String // 静态方法[必须要有实现类继承]
    // 类型别名
    typealias Time = Double // 声明在本协议内部用Time代表一个Double类型
    // 协议继承,一个协议可以继承其他许多协议,如果你要省略的方法同时继承过协议,可以用合并匿名方法实现 protocol<...,...,...,>多协议参数
    // 可选继承协议方法,Objcect-C中有可选继承实现方法,Swift中没有,可以通过Objcect-C协议桥的方法实现
    
}
protocol SubBaseProtocol : BaseProtocol, Flier {

}
@objc protocol OptionalProtocol { // 声明Object-C桥接协议,@objc,实现的类中如果要实现其中的方法要通过@objc进行桥接声明
    optional var song : String{get set}
    optional func sing()
}
// class 协议,@objc是声明为Object-C类型的协议,因为Object-C默认继承NSObjc,所以@objc的协议都是class协议
protocol ClassProtocol : class { // 继承与class的协议必须由class来实现或继承
    // 协议初始化方法声明,协议声明的初始化方法在实现类型中必须要继承,并且必须要用required关键字声明为必须的初始化方法
    init()
}
class ClassProtocolAdopted : ClassProtocol {
    required init() { // 协议中的构造器,用required的目的是为了声明它的所有子类都要继承这个构造器,如果实现类是最终类,可以不用声明required
        
    }
}
final class FinalClassProtocolAdopted : ClassProtocol {
    init () { // 协议中的构造器,因为这个是final最终类,所以可以不用声明为required[没有子类可以继承本类]
        
    }
}
class ClassOptionalProtocol : OptionalProtocol {
    @objc func sing() { // Swift类中声明通过Object-C桥接协议中的实现可选方法
        print("tweet")
    }
}
struct MyType : CustomStringConvertible, Hashable, Comparable { // 继承Comparable接口协议,必须要在文件顶层定义其实现方法
    var description : String {
        return "MyType"
    }
    var hashValue : Int {
        return 0
    }
}
// 顶层实现Comparable接口协议方法
func <(lhs: MyType, rhs: MyType) -> Bool {
    return false
}
func <=(lhs: MyType, rhs: MyType) -> Bool {
    return false
}
func >=(lhs: MyType, rhs: MyType) -> Bool {
    return false
}
func >(lhs: MyType, rhs: MyType) -> Bool {
    return false
}
func ==(lhs: MyType, rhs: MyType) -> Bool {
    return false
}
// ::泛型Generics
enum OptionalGenerics<Wrapped> { // Wrapped 泛型占位符
    case None
    case Some(Wrapped)
    init (_ some: Wrapped){
        self = None
    }
}
enum OptionalString<String> { // String 泛型占位符,不是类型
    case None
    case Some(String)
    init (_ some: String) {
        self = None
    }
}
// :: 泛型用于接口 Generic protocol with self
protocol FlierProtocol {
    func flockTogetherWith(f:Self) // Self 泛指当前接口类型
}
// :: 泛型用于空类型别称 Generic protocol with empty type alias
protocol FlierProtocolAlias {
    typealias Other // 空类型别称泛型占位符[Alias Empty Type]
    func flockTogetherWith(f: Other) // Self.Other
    func mateWith(f: Other)
}
struct BirdGenericAlias : FlierProtocolAlias {
    func flockTogetherWith(f: String) { // 实现接口协议方法,声明泛型类型[整个结构体中的泛型应保持一致]
        
    }
    func mateWith(f: String) {
        
    }
}
// :: 泛型用于实体类型 Generic object types
struct HolderOfTwoSameThings<T> { // struct 对象类型泛型
    var firstThing : T
    var secondThing : T
    init(thingOne:T, thingTow:T) {
        self.firstThing = thingOne
        self.secondThing = thingTow
    }
}
// :: 泛型用于类型限定 Type Constraints
protocol Constraiints {}
protocol FlierConstraints : Constraiints{
    typealias GenericsConstraints : Constraiints // 声明泛型必须是指定限定类型的类/子类[限定的类型不能是自身类型]
    func flockTogeterWith(f: GenericsConstraints) // 限定类型泛型
}
struct FlierConstraintsStruct : FlierConstraints {
    func flockTogeterWith(f: FlierConstraintsStruct) { // 子类作为限定类型泛型
        
    }
}
class GenericsCallBack {
    func start() {
        let _ = OptionalGenerics("")
        let _ = OptionalGenerics(3)
        let _ = OptionalString("string")
        let _ = OptionalString(3)
        //
        let _ = OptionalGenerics<String>("string")
        let _ = OptionalGenerics<Int>(23)
        let _ = OptionalString<String>("someting")
        takeAndReturnSameThing("String") // 泛型为String
        takeAndReturnSameThing(120) // 泛型为Int
        let _ = HolderOfTwoSameThings(thingOne: "Howdy", thingTow: "Lisay")
        ExtensionClass().start()
    }
    // :: 泛型用于函数
    func takeAndReturnSameThing<T> (t: T) -> T { // 声明泛型<T>为func内部的泛型,由传入的t的类型进行适配
        return t
    }
    func takeAndReturnSameThing<T, U>(f1: T, _ f2: U) { // 多个泛型之间用逗号隔开
        
    }
    // :: 限制泛型用于函数
    func flockTwoTogether<T:Flier>(f1:T, _ f2:T){}
    // :: 声明泛型继承的接口,泛型类可以调用继承的接口方法
    func myMin<T: Comparable>(things: T...) -> T { // 声明泛型继承Comparable比较符合接口协议 T... 不定参数
        var minimum = things[0]
        for ix in 1..<things.count {
            if things[ix] < minimum { // Comparable 接口协议的<比较
                minimum = things[ix]
            }
        }
        // :: 系统里面的全局min方法就是用这种方式实现的
        return minimum
    }
    // :: 通过占位符限定输入参数为接口协议类型
    func flockTowTogether2<T1: Flier,T2: Flier>(f1:T1, f2:T2){
        // f1,f2:必须是继承于Flier的接口
        func flockTowTogether2(f1: Flier,_ f2: Flier){} // Swift2+支持的语法
    }
}
// ::明确显式指定泛型类型 Explicit Specialization
protocol FlierGenericsExplicitSpecialization {
    typealias Other
}
struct BirdGenericsExplicitSpecialization {
    typealias Other = String // 明确指定泛型的类型为String
}
// :: 泛型类型变量
class DogGenericsExplicitSpecialization<T> {
    var name : T? // Option<T> 类型
}
// :: 继承泛型占位符的类
class DogGenericsExplicitSpecializationSub : DogGenericsExplicitSpecialization<String> { // 传入实际类型泛型,类似JAVA
    
}
// :: 泛型关联链,泛型链
protocol Wieldable { // 可融焊
}
struct Sword : Wieldable { // 宝剑
}
struct Bow : Wieldable{ // 弓箭
}
protocol Superfighter { // Supper 战斗机
    typealias Weapon : Wieldable // 武器
}
protocol Fighter : Superfighter { // 战斗机
    typealias Enemy : Superfighter // 敌方
    func steal(weapon:Self.Enemy.Weapon, from:Self.Enemy) // 偷袭行动(weapon:武器类型, from:人物类型)
}
struct Soldier : Fighter { // 军人
    typealias Weapon = Sword // 武器 = 宝剑
    typealias Enemy = Archer // 敌人 = 弓箭手
    func steal(weapon: Bow, from: Archer) {
        // 偷袭行动,武器=弓箭,来自=弓箭手
    }
}
struct Archer : Fighter { // 弓箭手
    typealias Weapon = Bow // 武器 = 弓箭
    typealias Enemy = Soldier // 敌人 = 军人
    func steal(weapon: Sword, from: Soldier) {
        // 偷袭行动,武器=宝剑,来自=军人
    }
    // 泛型类型通过关联链进行声明泛型类型 Self.Enemy.Weapon,Self代表当前的接口协议,当然可以省略Self
}
// :: 泛型的额外约束,多接口协议约束
class GenericsAdditionalConstraints {
    func start() {
        flockTogetherFlier2(Bird()) // 编译正确
        //flockTogetherFlier2(Insect()) 编译失败,不符合T.Other:Equatable类型
        flockTogetherFlier3(Flier3Pig2())// 编译正确,符合T:Flier3 where T.Other:Flier3Dog类型(掉该方法),不符合T.Other:Flier3NoisyDog类型
        flockTogetherFlier3(Flier3Pig()) // 编译正确
        flockTogetherFlier3(Flier3Pig()) // 编译正确 == 恒等号
        
    }
    // 直接多协议声明泛型
    func flyAndWalk<T where T:Flier, T:FlierGenericsExplicitSpecialization>(f:T){} // T 必须继承于两种协议
    func flyAndWalk<T where T:Flier, T:FlierGenericsExplicitSpecialization,T:Wieldable>(f:T){} // T 必须继承于三种协议
    // 内部泛型限定
    func flockTogetherFlier2<T:Flier2 where T.Other:Equatable>(f:T){} // 限定T为Flier2类型,同时T.Other为Equatable类型
    func flockTogetherFlier3<T:Flier3 where T.Other:Flier3Dog>(f:T){}
    // 内部泛型限定 == 恒等符号
    func flockTogetherFlier3<T:Flier3 where T.Other == Flier3NoisyDog>(f:T){}
    // 多泛型内部限定,一般 == 恒等好用于多个泛型的内部泛型比较
    func flockTogetherFlier3<T:Flier3, U:Flier3 where T.Other == U.Other>(f:T,_ f2:U){} // 限定T.Other == U.Other类型
    // 类型泛型限定普通用于系统使用性强的操作,例如Generator.appendContentsOf方法
}
// :: 泛型内部的泛型限定
protocol Flier2 {
    typealias Other
}
struct Bird : Flier2 {
    typealias Other = String
}
struct Insect : Flier2 {
    typealias Other = Bird
}
// :: 实体类作为泛型内部的泛型限定
protocol Flier3 {
    typealias Other
}
class Flier3Dog {
}
class Flier3NoisyDog : Flier3Dog {
}
struct Flier3Pig : Flier3 {
    typealias Other = Flier3NoisyDog // 声明Other类型
}
struct Flier3Pig2 : Flier3 {
    typealias Other = Flier3Dog
}
// :: Extension 扩展
class ExtensionClass {
    func start() {
        UmbrellaDog().umbrellaTypeMethod()
    }
}
// :: Extension 扩展必须要在文件的第一层/根层, 
// 1.扩展不能覆盖已存在的成员,但是可以重载已存在的方法 
// 2.扩展不能声明存储类型属性,但是可以声明操作属性 
// 3.扩展不能定义显式构造器,不能取消显式构造器,但是可以定义快速构造器(convenience initializer)
// 扩展对象类型 Extending Object Type
extension Array { // Swift 内置对象 Build-in struct Object Type
    // 扩展方法
    mutating func shuffle () { // 可变元函数
        // 洗牌
        for i in (0..<self.count).reverse() { // reverse : 倒序
            let ix1 = i
            // 生成 0 ~ i 的一个随机数
            let ix2 = Int(arc4random_uniform(UInt32(i+1))) // arc4random_uniform(N):生成0-(N-1)的均匀分布随机整数
            // 交换当前与随机生成位置的值
            (self[ix1], self[ix2]) = (self[ix2], self[ix1]) // 交换两个变量值
        }
    }
    // 扩展操作属性
    var center : Element {
        return self[self.count/2]
    }
}
extension UIColor {
    // 扩展全局返回/类函数
    class func myGoldenColor() -> UIColor {
        return self.init(colorLiteralRed: 1.000, green: 0.894, blue: 0.541, alpha: 0.9)
    }
}
extension NSCoder {
    // 扩展最重要的用法是用于扩展内置对象
    func encodeObject(objv: AnyObject?, forkey key: Archer) { // 扩展NSCode内置对象,可以对内置对象直接操作
        self.encodeObject(objv, forKey: "Archer")
    }
}
// 扩展对象的同时继承接口协议(统一继承接口协议方式)
class ExtensionViewController : UIViewController { // 自定义类型
    // 继承内置类型,自定义VC
}
extension ExtensionViewController : UIPopoverPresentationControllerDelegate {
    // 为自定义VC添加全局继承接口协议...编写统一委托实现方法
}
extension ExtensionViewController : UIToolbarDelegate {
    // 为自定义VC添加全局继承接口协议...编写统一委托实现方法[当然方法体很长可以分多个扩展文件]
}
// 扩展struct构造器,不用声明便捷convenience
struct ExtensionDigit {
    var number : Int
    init(number: Int) {
        self.number = number
    }
}
extension ExtensionDigit {
    init() {
        self.init(number:42)
    }
}
// :: 扩展接口协议
protocol ExtensionProtocolFlider {
}
extension ExtensionProtocolFlider { // 扩展接口协议
    func fly() {
        print("flap flap falp")
    }
}
struct ExtensionBird : ExtensionProtocolFlider {
    // 包含扩展方法,当然可以重写扩展方法
}
extension RawRepresentable { // 扩展内置接口 RawRepresentable原始数据接口协议(元数据协议接口)
    init?(_ what: RawValue){
        self.init(rawValue:what)
    }
}
enum ExtensionFill : Int { // Int整数数据(继承于元数据协议接口)
    case Empty = 1
    // 系统自动添加扩展该协议的构造器
}
enum Color : Int {
    case White = 1
    // 系统自动添加扩展该协议的构造器[扩展协议接口的方法相当于全局方法]
}
// :: 扩展泛型
class ExtensionGenericsDog<T> {
    var name : T?
}
extension ExtensionGenericsDog {
    func sayYouName() -> T? {
        return self.name
    }
}
// :: 扩展泛型内部类,同时指定泛型的约束(相当于扩展指定的泛型类)
extension Array where Element:Comparable { // 指定Element占位符泛型的类型 Element is the element type
    // 只有Array<Element> 中的泛型符合指定的类型才可以调用 Inject to the kinds of arrays
    func min() -> Element { // Comparable协议接口的Array才有的方法
        var minimun = self[0]
        for ix in 1..<self.count {
            minimun = self[ix]
        }
        return minimun
    }
}
extension CollectionType where Generator.Element : Equatable { // 扩展指定类型对应的的泛型
    func myIndexOf(element: Self.Generator.Element) -> Self.Index? {
        return nil
    }
}
// :: Umbrella Types 伞型(泛型伞型类型)
// 1.AndyObject 系统内置伞型
class UmbrellaDog {
    func umbrellaTypeMethod() -> Void {
        print("mbrella Types 伞型泛型")
        let d = UmbrellaDog()
        let any : AnyObject = d // AnyObject所有类对象的泛型
        let d2 = any as! UmbrellaDog // 强制转换
        print(d2)
        // Object-C 类型可以直接赋值给 AnyObject,因为AnyObject有Swift控制,并自动把Object-C 类型通过桥接的方式转换为Swift对应类型
        let s = "howdy" // Swift String 不是Class类对象而是Struct
        let any2 : AnyObject = s // AnyObject 类型用于接收的是Class 类对象,所以Swift默认自动转换为NSString类对象
        let s2 = any2 as! String // 当然可以转换为NSString [Swift自动对Object-C实体生成桥接头,适应于Swift中]
        print(s2)
        let i = 1 // Int Struct 类型,不是Class类对象
        let any3 : AnyObject = i // 隐式转换为NSNumber类对象
        let i2 = any3 as! Int
        print(i2)
        let mi = MyInteger(integerLiteral:3)
        //let any4 : AnyObject = mi // 编译错误 不匹配AnyObject类型 does not conform to specified type 'AnyObject'
        // :: 可以把Swift中的AnyObject理解为Object-C里面的id 类型[AnyObject is the Swift version of id]
        // Object-C an Object arrive into Swift an AnyObject
        let c : AnyObject = Cat() // AnyObject 类型
        let _ = c.noise // AnyObject类型调用属性,编译器不会报错,也不会崩溃,因为AnyObject是封包的,返回nil [直接调用AnyObject系统识别的成员,所有Object-C成员+Swift中扩展Object-C类型成员+Swift中声明为Object-C的成员]
        let _ = c.bark?() // AnyObject类型调用方法[安全调用,比接口协议简单,方便],对方法接口进行封包,结果为Option<String>
        // AnyObject 对象标识,类型标识 Object identity and type identity
        // 标识操作 === 判断AnyObject是不是同一对象[用于AnyObject用于判断是否引用的是同一个内存对象],类似于 == 操作
        let any4 : AnyObject = "LiSa String"
        let any4B : AnyObject = "LiSa String"
        if any4 === any4B { // === 同一个引用对象判断,!== 不同引用对象判断
            print("\(any4)和\(any4B) 是同内存对象")
        } else {
            print("\(any4)和\(any4B) 不是同一内存对象")
        }
    }
    struct MyInteger : IntegerLiteralConvertible { // 不是Class类对象,不能适配AnyObject泛型
        var number : Int
        init(integerLiteral value: Int) {
            self.number = value
        }
    }
    init () {}
    // :: NSCoder 类编码得到的结果为AnyObject类型
    init (coder decoder : NSCoder) {
        let _ = decoder.decodeObjectForKey("color") as! String
    }
    // AnyObject 可以直接访问的成员
    // 1. Object-C 的成员(Object-C的Object对象对应于AnyObject)::It is a member of an Objective-C class.
    // 2. 你手动扩展的Objective-C 类型的成员::It is a member of your own Swift subclass (or extension) of an Objective-C class
    // 3. 在Swift中声明为Objc对象的成员::It is a member of a Swift class, and is marked @objc (or dynamic).
    class Dog {
        // 声明为@objc相当于扩展了Object-C中的Object根类型
        @objc var noise : String = "woof" // 声明为Object-C属性[相当于扩展AnyObject里面的方法,因为Object-C中的Object id 对应 AnyObject]
        @objc func bark() -> String { // 声明为Object-C方法
            return "woof"
        }
    }
    class Cat {
    }
}
// :: AnyClass 它是AnyObject的一个类,与AnyObject相同,代表的是任意Class类型
class AnyClassDog {
    @objc static var whatADogSays : String = "woof"
    func start() {
        // AnyClass所有类型的泛型[XXX.Type]
        let c : AnyClass = AnyClassDog.self // 获取到self,类类型
        let _ = c.whatADogSays // 直接调用AnyClass里面的成员[成员的检索和AnyObject 可以直接访问的成员 一致]
        // === 操作符也一致
        let any : AnyClass = AnyClassDog.self
        let dogType : AnyClassDog.Type = AnyClassDog.self
        if any === dogType {
            // 同一引用对象::AnyClass
        }
        let dog = AnyClassDog()
        if dog.dynamicType == dogType {
            // 同一应用对象::AnyClass
        }
    }
}
// ::Any 所有类型的泛型,实际上可以理解为就是一个空类型的借款协议
class AnyGenerics {
    
    func start() {
        anyExpecter("Howdy") // a struct instance
        anyExpecter(String) // a struct
        anyExpecter(Dog()) // a class Instance
        anyExpecter(Dog) // a class
        anyExpecter(anyExpecter) // a function
        flockTowTogether(AnyBird(), Bird.self)
    }
    // Any Type 所有的对象都可以:absolutely any object can be passed
    func anyExpecter(a:Any) {}
    func flockTowTogether<T:AnyFlier>(flier:T, _ other:Any) {
        if other is T.Other {
            print("they can flock together")
        }
    }
}
protocol AnyFlier {
    typealias Other
}
struct AnyBird : AnyFlier {
    typealias Other = Insect
}
struct AnyInsect : AnyFlier {
    typealias Other = Bird
}
// :: 集合类型 Collection Type,内置集合类型:Array,Dictionary[第三方集合 Set],Object-C里面的NSArray,NSDictionary,Set都会通过桥接到Swift中
class CollectionClass {
    // 集合只能包含同一种类型,当然可以包含它的所有子类型作为Element
    // 集合为AnyObject,那么这个集合可以包含所有的类对象类型
    func start() {
        // :: Array :: 数组
        var _ : Array<Int> // 声明整形数组 Int Array
        var _ = [1,2] // 参数为整形数组
        var _ = [] // 空数组 Empty Array
        var _ = [Int]() // 整形空数组 Array init 构造器
        var _ : [Int] = [] // 整数空数组 定义类型
        // 如果初始化Array包含不同类型,那么Swift会自动识别他们的supper class
        var _ = [1,"Howday",0.4] // swift自动识别他们的父类为NSObject,实际上是Array<NSObject>
        //var _ : [AnyFlier] = [AnyBird(), AnyInsect()] // 
        // 数组顺序初始化
        let _ = Array(1...3) // Array构造器 [1,2,3],范围初始化
        let _ = Array("Hello".characters) // Array构造器 ["H","e","l","l","o"],数组初始化
        //let _ = Array(Dictionary) // Array构造器
        let _ : [String?] = Array(count: 100, repeatedValue: nil) // 初始化容量为100,填充内容为nil的数组
        let _ : [Int?] = [1,2,3] // 数组类型自动转换,Int -> Option<Int>
        let arr : [Dog] = [NoisyDog(), NoisyDog()] // Array<Dog>
        let _ = arr as! [NoisyDog] // 数组转型 Array<NoisyDog>
        if arr is [NoisyDog] {
            // Array数组的 is 类型判断,如果Array的类型为[NoisyDog]则返回true
        }
        let _ = arr as? [NoisyDog] // 转换为Option类型的Array,或者返回nil,安全类型转换[整个Array类型转换,当然你可以逐个元素转换]
        // 数组对比
        let arr2 = [1,2,3]
        if [1,2,3] == arr2 {
            // 两个数组的每个元素同相同则为true
        }
        let dog1 = NoisyDog()
        let dog2 = NoisyDog()
        if [NoisyDog(),NoisyDog()] == [dog1,dog2] {
            // 如果Array的是对象实体,那么这个对比是比较数组的每个元素的引用地址是否为同一个对象
        }
        // Array数组是一个struct,值类型,不是引用类型,所以在函数传递中是传copied副本,所以一般不要通过传递Array,因为拷贝副本代价大,当然如果声明为常量Array则传递的是同一个引用
        // 数组下标
        let _ = arr[0] // 获取第一个元素
        let _ = arr[1...2] // 获取第一,二个元素 得到的为ArraySlice[数组队列]类型,Array的简单类型,当然你可以大概认为ArraySlice 就是一个Array
        var arr3 = [1,2,3]
        arr3[1] = 4 // 对var变量Array数组进行赋值[下标越界会crash]
        arr3[1...2] = [5,6] // 通过下标范围方式对数组批量赋值,个数相同的情况一对一赋值
        arr3[1..<2] = [7,8,9] // 下标范围小于赋值数组范围,相当于扩展数组
        arr3[1..<2] = [] // 下标范围大于赋值数组范围,相当于移除数组元素
        arr3[1..<1] = [10] // 下标范围值无效,在下标起始位插入数组,不会移除元素的方式插入元素
        // 数组嵌套
        let _ = [[1,2,3],[4,5,6],[7,8,9]] // Array<Array<Int>> 嵌套数组
        let _ : [[Int]] = [[1,2],[3,4]] // 数组的数组集合
        var arr4 = [[4,5],[6,7]]
        arr4[1][0] = 8 // 对数组的数组集合变量中的某个值进行赋值,当然可以通过范围操作添加,移除,修改数组
        // Array 的基本属性与方法[Array实现的接口协议方法:SequenceType序列类型]
        let _ = arr4.isEmpty // 空数组
        let _ = arr4.first // 第一个元素,当数组为空时,返回nil
        let _ = arr4.last // 最后一个元素,当数组为空时,返回nil
        let _ = arr4.count // 元素总数
        let _ = arr4.suffix(2) // 批量获取后缀元素数组,获取最后两个元素
        let _ = arr4.suffix(10) // 获取后10个元素,但是元素总数为3个,系统不会报错,而是直接返回3个元素的数组
        let _ = arr4.suffixFrom(1) // 从下标为1的元素开始获取后面的所有后缀元素
        let _ = arr4.prefix(1) // 批量获取前缀元素数组,获取最前一个元素
        let _ = arr4.prefixThrough(1) // 获取前缀元素,直到下标为1,即获取最前的两个元素
        let _ = arr4.prefixUpTo(1) // 获取前缀元素,递增到1,不包含1,即获取最前一个元素
        var indices = arr4.indices // 获取数组的下标范围
        indices.startIndex = indices.endIndex - 2 // 修改下标范围
        let _ = arr4[indices] // 获取指定范围的数组
        let arr5 = [1,4,7,9,0]
        let _ = arr5.indexOf(9) // 获取指定元素的下标,返回Option<Int>封包类型,找不到该元素返回nil
        let aviary = [NoisyDog("noisy"),LoatDog("loating")]
        let _ = aviary.indexOf {
            // 自定义下标方法判断 Element 元素作为输入变量的比较方法,方法返回true则返回对应的元素的下标
            $0.name!.characters.count < 5 // 获取name属性字符数小于5的元素的下标,如果有多个,则返回第一个
        }
        let arr6 = [1,2,3]
        let _ = arr6.contains(2)
        let _ = arr6.contains {
            // 自定义包含方法判断函数
            $0 > 3 // Element元素比较,是否包含大于3的元素
        }
        let _ = arr6.startsWith([1,-2]) // 开始元素数匹配方法
        let _ = arr6.startsWith([1,-2]){
            // 自定义数组开始比较方法判断
            abs($0) == abs($1) // 数组已两个数据形式传入进行比较,传入两个变量数组
        }
        let _ = arr6.minElement() // 获取最小值
        let _ = arr6.minElement(){
            // 自定义最小值比较方法判断,Element实现了Comparables方法的话,可以用小于,大于,等于号
            abs($0) < abs($1)
        }
        var arr7 = [1,2,3]
        arr7.append(10) // 对于定义为变量的数组可以通过append(Element)方法在数组尾添加元素
        arr7.appendContentsOf([4,5,6,7]) // 添加数组到数组尾
        arr7.appendContentsOf(8...20) // 添加范围值到数组尾
        arr7 = arr6 + [5,6] // Array 数组 + 操作符,数组并接成为一个新数组
        arr7 += [33,34,35] // 赋值和并接组合符号 += 并接数组到数组尾
        arr7.insert(80, atIndex: 4) // 插入单个值指定位置
        arr7.insertContentsOf(90...100, at: 5) // 插入范围值到指定位置
        arr7.removeAtIndex(0) // 移除指定位置值
        arr7.removeRange(0...2) // 移除指定范围位置值
        arr7.removeFirst()
        arr7.removeLast() // 移除最后值,空数组crash
        arr7.popLast() // 安全方式移除最后值,空数组不会crash
        let arr8 = [[1,2,3],[4,5,6]] // 数组的数组集合中插入数组间隔[必须是数组的数组]
        let _ = Array(arr8.joinWithSeparator([10,11])) // 对数组元素插入间隔值,得到的为一元数组Array[1,2,3,10,11,4,5,6]
        let _ = Array(arr8.joinWithSeparator([])) // 插入空数组元素,相当于没插入,转换为一元数组
        let _ = Array(arr8.flatten()) // 整理转换二维数组为一维数组,得到一元数组Array[1,2,3,4,5,6]
        let _ = arr8.reverse() // 数组倒序
        var arr9 = [4,5,1,9,3,0,1,7,2]
        arr9.sortInPlace() // 根据位置来排序,必须要是变量
        arr9.sortInPlace { // 匿名拖尾函数
            // 自定义排序比较方法,系统传入两个值:minElement,maxElement
            $0 > $1
        }
        arr9.sortInPlace(>) // Swift中>比较符号就是函数名称,直接传>相当于传入>名称的方法[系统识别为Int类型的>方法]
        let arr10 = [1,2,3,4,5,6]
        let _ = arr10.split { // 数组分组,当数组元素满足表达式时进行分组 Array [[1],[3],[5]]
            $0 % 2 == 0
        }
        // 数组枚举,转换 Array enumeration and transformation
        let pepboys = ["Manny", "Moe", "Jack"]
        for pepboy in pepboys {
            // 数组 for in 枚举
            print(pepboy)
        }
        pepboys.forEach {
            // 数组forEach枚举,相当于for..in枚举
            print($0)
        }
        for (ix,pepboy) in pepboys.enumerate() {
            // 包含下标,和数据值的枚举
            print("\(ix) is \(pepboy)")
        }
        pepboys.enumerate().forEach {
            // 包含下标枚举,和for (index,value) in 枚举相同
            print("\($0.0) is \($0.1)") // $0 = (index,value) [$0.0 = index, $0.1 = value]
        }
        // map 枚举匹配构造方法[ CollectionType instance method ]
        let arr11 = [1,2,3,4,5,6,7,8]
        let _ = arr11.map { // 匹配构造函数 Array[2,4,6,8,10,12,14,16]
            // 自定义匹配构造元素方法,枚举传入Element,返回Element 类型
            $0 * 2
        }
        let _ = arr11.map { // 匹配构造Array<Double>的类型数组
            Double($0) // Element元素转换为Double类型
        }
        let _ = (0...100).map { // 范围类型Range是实现了 CollectionType,所以范围可以map枚举构造
            $0 % 2
        }
        // filter 枚举过滤方法
        let _ = arr11.filter { // 过滤大于5的数组 Array[6,7,8LISP]
            // 自定义枚举过滤方法,返回True则放入新Array,返回false,则被过滤掉
            $0 > 5
        }
        // reduce 枚举移除元素
        let _ /*sum*/  = arr11.reduce (0) { // 从值0初始化,开始枚举递减元素,1+2+3+4+5+6+7+8
            // 指定递减枚举方法,返回两个的和传递到下一个枚举的第一个参数reduce(initValue,complete{})
            $0 + $1
        }
        let _ /*sum*/ = arr11.reduce(0, combine: +) // 可比较接口协议中的+加号方法,实际+加号代表一个function
        let options = NSStringCompareOptions.CaseInsensitiveSearch // 大小写不敏感搜索器
        let _ = "Hello My Builty World".rangeOfString("hello", options: options) // 搜索所在范围
        let arr12 = [["Manny","Moe","Jack"],["Harpo","Chico","Groucho"]]
        let target = "m"
        let _ = arr12.map { // 枚举匹配构造数组[[]]
            $0.filter { // 元素[]进行枚举过滤
                let options = NSStringCompareOptions.CaseInsensitiveSearch
                let found = $0.rangeOfString(target, options:options)
                return found != nil // 匹配字母m的Range范围,没有则返回nil
            }
        }.filter { // 匹配构造的数组Element进行枚举过滤
            $0.count > 0 // 元素大于0的
        }
        // Swift Array 与 Object-C NSArray 转换[根类 : Swift AnyObject,Object-C Object],Objct-C的NSArray可以全部转换为Swift的Array,Swift的Array不能全部转换为Objct-C的NSArray[Object-C的所有Objct都可以转换为AnyObjec]
        // Object-C NSArray -> Swift Array 自动转换为Object-C桥接类进行转换
        let arr13 = ["Manny","Moe","Jack"]
        let _ = (arr13 as NSArray).componentsJoinedByString(",") // Swift Array -> 强制转换为 NSArray [元素通过,进行并接成字符串]
        // Swift 中用var声明的为可变数组,对应于NSMutableArray,let 声明为不可变数组,对应于NSArray
        var arr14 = ["Hello","Lisa","Anny"]
        let arr14A = NSMutableArray(array: arr14)
        arr14A.removeObject("Lisa") // NSMutableArray的实例方法
        arr14 = arr14A as NSArray as! [String] // NSMutableArray 转换为NSArray,转换为Swift Option<Array>
        // 如果Swift中的Array的Element不能转型为AnyObject,那么该Element就没有Objct-C的桥接头,那么就不能自动强制转换为NSArray,NSMutableArray,当然可以手动转型,例如struct的Array[基本类型除外]
        // 注意 Swift中的Option类型为nil,在Objct-C中没有对应类型的桥接NSArray不能包含nil类型,所以Array<Option>不能转型为Objct的NSArray,可以先把nil转换为Object-C中的NSNll
        let arr15 :Array<String?> = ["Manny","Moe","Jack"] // Option<String>的Array数组
        let arr15A : [AnyObject] = arr15.map { // Option<String> 先转换为ArrayObject数组,然后就可以转换为Objct-C的NSArray数组了
            if $0 == nil { // nil 不是AnyObject类型,所以返回Objct-C里面的NSNull占位符
                return NSNull()
            } else {
              return $0! // 返回解包的String-> 系统自动转换为对象类型的 NSString
            }
        }
        let _ = arr15A as NSArray
        let _ : [[String]] = UIFont.familyNames().map { // 获取所有UIFont类型::UIFont->All Font Family Name->Font Name
            UIFont.fontNamesForFamilyName($0) // NSString-> String
        }
        // :: Dictionary :: 字典 struct 类型,值类型
        let _ : Dictionary<String,String> // 定义字典Dictionary
        let _ = [String:String]() // 定义空字典
        let _ : [String:String] = [:] // 定义空字典
        var name = ["name":"Salia", "nickName":"Luka", "firstName":"LA"] // 定义,并实例化一个字典Dictionary<String,String> [key:value]
        let _ = name["nickName"] // 通过下标key的方法检索字典value ,如果没有该key则返回nil
        name["nickName"] = "Lusi" // 对已有的key进行赋值
        name["lastName"] = "Sala" // 对没有的key进行赋值,系统会自动添加不存在的key,然后赋值[添加属性key,value]
        let _ = name.updateValue("Ming", forKey: "firstName") // 更新指定key的值,会返回原来key对应的值,如果原来不存在则返回nil
        name["lastName"] = nil //对key赋值为nil,系统会删除该key对[移除属性key,value]
        let _ = name.removeValueForKey("firstName") // 移除该key对,同时返回该key的值Options<Element>,如果有,如果没有则返回nil
        let dog3 = NoisyDog()
        let dog4 = NoisyDog()
        let arr16 = ["fido":dog3, "rover":dog4]
        let _ = arr16 as! [String: NoisyDog] // Dictionary强制转型,转换为Dictionary<String:NoisyDog>类型
        // Dictionary基本属性和迭代
        let dic = ["CA": "California", "NY": "New York"]
        let _ = dic.keys // 所有的key[a LazyForwardCollection] extend CollectionType,SequenceType
        let _ = dic.values // 所有的values[a LazyForwardCollection]
        for key in dic.keys {// Dictionary是无序的,只能通过keys,values进行迭代出key或value
            // 迭代所有key
            let _ = dic[key]
        }
        let _ = Array(dic.keys) // Dictionary的keys值转换为Array数组
        let _ = Array(dic.values) // Dictionary的values值转换为Array数组
        let _ = Array(dic) // Dictionary直接转换为Array结果为[(key,value),(key,value)] 健值对的Array数组
        for (key, value) in dic {
            // 迭代Dictionary的Key,Value值对
            let _ = key
            let _ = value
        }
        let dic2 = ["score1": 89,"score2": 69, "score3": 98, "score4": 82, "score5": 78]
        let _ = dic2.values.reduce(0, combine: +) // 累计求和[递减->组合 (累计初始值,组合方法func)]
        let _ = dic2.values.minElement() // 求最小值[SequenceType方法]
        let _ = Array(dic2.values.filter { // 过滤所有小于2的Value数组[Filter过滤后的结果是一个LazyFilterCollection值,是lazy值,我们必须要用集合Collection或者枚举Enumerate来收集lazy值,lazy对象可能没有实体值,可能有值]
            $0 < 2
        })
        // NSDictionary,Swift中的Dictionary由系统的桥接头自动桥接到NSDictionary,但是必须保证Key,Value都是[NSObject:AnyObject]对象类型,用对应于NSDictionary [Dictionary通过hashable来存蓄key值对,由于NSObject实现hashable接口协议,所以key有限制为NSObject]
        let dic3 : [NSObject : AnyObject] = ["progress":24]
        var userInfo : [NSObject : AnyObject]? { // Option<Dictionary> getter[computed attribute can't store]
            get {
                return dic3
            }
        }
        let _ = (userInfo?["progress"] as? NSNumber)?.doubleValue
        // 通过Dictionary集合设置组件的属性
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName : UIFont(name: "ChalkboardSE", size: 20)!,
            NSForegroundColorAttributeName : UIColor.darkTextColor(),
            NSShadowAttributeName : { // 自执行函数
                let shad = NSShadow()
                shad.shadowOffset = CGSizeMake(1.5, 1.5)
                return shad // 返回 NSShadow
        }()]
        // NSMutableDictionary,动态添加多个Dictionary集合
        var dic4 = ["NY":"New York", "CA":"California"]
        let dic5 = ["MD":"Maryland"]
        let mutableDic = NSMutableDictionary(dictionary: dic4) // Object-C NSMutableDictionary
        mutableDic.addEntriesFromDictionary(dic5) // 添加一个Dictionary到Dictionary中
        dic4 = mutableDic as NSDictionary as! [String:String] // MutableDictionary强制转型
        // Dictionary中没有直接添加一个Dictionary的方法,当然你可以扩展系统内置的Dictionary,来添加一个添加方法
        //extension Dictionary {
        //    mutating func addEntriesFromDictionary(d : [key:Value]) {
        //        for (k:v) in d {
        //            self[k] = v
        //        }
        //    }
        //}
        // :: Set :: Set无序集合[有hashcode进行索引],Set, a struct,Set实现CollectionType,SequenceType接口协议
        let set1 : Set<Int> = [1,2,3,4,5,6,7] // Set没有字面转换识别接口,所以要声明Set必须要声明变量类型
        let _ = set1.first // Option<Int> 如果Set为空,则返回nil
        var set2 = Set(arr9) // Array 作为初始化参数,构造一个Set集合
        let _ = Array(set2) // Set 作为初始化参数,构造一个Array集合
        let _ = Set(set2.map {$0+1}) // Set Map 映射构造器
        set2.insert(8) //
        let _ = set2.remove(7) // Option<Element>
        let _ = set2.removeFirst() // 集合为空,则崩溃
        let _ = set2.popFirst() // 出栈,集合为空则不返回nill
        let _ = Set(1...9) // 通过范围初始化Set集合
        // Set基本文氏图代数相交函数:intersect[交集], intersectInPlace,union[唯一], unionInPlace,exclusiveOr[互斥], exclusiveOrInPlace,subtract[集合相减], subtractInPlace,isSubsetOf[包含], isStrictSubsetOf isSupersetOf[被包含], isStrictSupersetOf,isDisjointWith[恒等]
        let ud = NSUserDefaults.standardUserDefaults()
        var recents = ud.objectForKey("RECENTS") as? [Int]
        if recents == nil {
            recents = []
        }
        var forbiddenNumber = Set(recents!) // 通过Array集合初始化Set集合
        let legalNumbers = Set(1...1000).subtract(forbiddenNumber) // subtract:不想交子集,获取不包含在指定集合里的子集合
        let newNumber = Array(legalNumbers) [ // Set转换为Array,随机获取一个0...count的下标整数
            Int(arc4random_uniform(UInt32(legalNumbers.count)))
        ]
        forbiddenNumber.insert(newNumber)
        ud.setObject(Array(forbiddenNumber), forKey: "RECENTS")
        // Option Set Type ::可选集合类型 [UIViewAnimationOptions 枚举类,继承于OptionSetType接口协议,拥有OptionSetType接口协议的方法]
        // OptionSetType子类枚举用于二进制类别声明,子二进制枚举类可以进行位操作,同时包含接口协议方法
        let val = UIViewAnimationOptions.Autoreverse.rawValue | UIViewAnimationOptions.Repeat.rawValue
        let _ = UIViewAnimationOptions(rawValue: val)
        var opts = UIViewAnimationOptions.Autoreverse
        opts.insert(.Repeat) // OptionSetType 可选集合类插入方法
        let _ : UIViewAnimationOptions = [.Autoreverse, .Repeat] // OptionSetType集合类型通过Array集合进行初始化
        let _ : UIViewAnimationOptions = [] // 初始化一个空的OptionSetType集合类型,在1.2语法后OptionSetType不再是Optional类型,空值不能用nil,所以Option不是Optional
        // Set and NSSet ,Swift系统会自动将Set桥接转换为NSSet集合
        let types : UIUserNotificationType = [.Alert, .Sound] // a bitmask
        let category = UIMutableUserNotificationCategory()
        category.identifier = "coffee"
        let _ = UIUserNotificationSettings(forTypes: types, categories: [category]) // second parameter is an NSSet,系统自动桥接转换
        //
        
    }
    class Dog {
        var name : String?
    }
    class NoisyDog : Dog {
        override init() {}
        init(_ name:String) {
            super.init()
            self.name = name
        }
    }
    class  LoatDog : Dog {
        override init() {}
        init(_ name:String) {
            super.init()
            self.name = name
        }
    }
}
// :: 程序执行流控制,和程序其他控制 ::
class FlowControlAndMore {
    func start() {
        // 默认程序按照代码流顺序执行,只有执行成功才继续执行
        // Branching :分支[if,switch]
        // Looping :循环[Each repetition is called an iteration,每一次循环就是一个迭代]
        do { // 利用do执行范围代码
            // 声明do范围内执行
            print("do范围内执行的命令")
        }
        // Conditional binding 条件绑定执行函数块
        // 1.正常模式
        let prog = Optional<String>("this is not nil optional string")
        if prog != nil {
            print(prog)
        }
        // 2.条件绑定模式
        if let prog = Optional<String>("this is not nil optional string") {
            // 绑定prog变量为if条件代码块中的变量,并且该Optional不为nil时执行代码块
            print("Condition Binding if value=\(prog)")
            // 当然可以多个条件绑定同时使用[金字塔,条件绑定模式,变量容易模糊]
            if let prog1 = Optional<Int>(20) {
                if let prog2 = Optional<String>("second prog") {
                    if let prog3 = Optional<Double>(0.2) {
                        print("多条件绑定执行:prog1=\(prog1),prog2=\(prog2),prog3=\(prog3)")
                    }
                }
            }
        }
        // 3.条件绑定多个变量模式
        if let prog1 = Optional<String>("Hello First"), prog2 = Optional<String>("Hello Second") {
            print("条件绑定多个变量:prog1=\(prog1),prog2=\(prog2)")
        }
        // 4.条件绑定多个变量可以跟随where判断表达式,用于判断Bool值变量
        let keyPath = Optional<String>("readyForDisplay")
        let object : AnyObject = "StringValue"
        let boolValue : AnyObject = true
        // 正常普通模式
        if keyPath == "readyForDisplay" {
            if let obj = object as? String {
                if let ok = boolValue as? Bool {
                    if ok {
                        // This is the operation
                        print("普通模式绑定多变量")
                    }
                }
            }
        }
        // 条件绑定多变量跟随where表达试
        if keyPath == "readyForDisplay", let obj = object as? String, let ok = boolValue as? Bool where ok {
            print("普通模式绑定多变量合并一个if表达式并且跟随where表达式")
        }
        // swift 2.0的guard[守护,监控]表达式 [守护函数片段,直到return时结束该守护模块]
        guard keyPath == "readyForDisplay" else {return}
        guard let obj = object as? String else {return}
        guard let ok = boolValue as? Bool else {return}
        guard ok else {return}
        // switch 表达式,Swift中的swift优化和强化了Objcet-C的switch表达式
        let i = 2
        switch i { // swift的switch表达式的case必须至少包含一个语句,break 也是语句
        case 2: break
        case 3: break
        case 3: break // 1.case 的匹配值可以包含多次,完全按照if else,if else语法,当然没有意义
        case _: break // 2._下划线,模式匹配所有其他值[case的匹配值可以是模式匹配语法]
        case let n: print("Switch Match \(n)") // 3.case的匹配所有其他值,并且定义本地变量转移匹配目标值
        case 2...10: break // 3.匹配范围Rang值类型,如果匹配则执行
        default: break
        }
        switch Optional<Int>(3) { // switch 匹配Targer为Option类型
        case nil: break // 匹配Option类型为nil
        case let i:
            switch i! { // Option类型解包同时作为switch匹配的Targer
            case 1: break
            default: break
            }
        default: break
        }
        switch Optional<Int>(9) {
        case 1?: break // 匹配Option类型的1 相当于Option<Int>(1)
        case let n?: break // 匹配其他非nil值的Option类型
        case nil: break // 匹配nil值类型
        }
        switch true { // 匹配的Targer为Bool值,这样的switch相当于if...else表达式,里面的case可以是任意表达式,不一定与targer相关,但是只要返回true就执行
        case 1 == 2: break
        case 1 == 1: break
        default: break
        }
        switch 2 {
        case let j where j < 0:// where 匹配表达式 :: let j = targer where j < 0 ::这个模式并没有什么作用,可以用来合成targer为变量而已
            print("i is negative")
        case let j where j > 0:
            print("i is positive")
        case 0:
            print("i is 0")
        default: break
        }
        switch Dog() {
        case is Dog: break // is 类型判断表达式
        case _: break // 其他
        }
        switch 4 {
        case Optional<Int>(0)! as Int: break // as 类型转换判断表达式放在case里 :: 等同于case Int(0)
        default:break
        }
        switch (Optional<Int>(2), Optional<String>("xiaotian")) { // 多条件匹配表达式
        case let (size as Int, desc as String): break // 条件匹配(第一个变量匹配式 size为局部变量名,第二个变量匹配式 desc为局部变量名)
        default: break
        }
        // Enum 枚举匹配 [枚举类.枚举值 / .枚举值]不在枚举类内部, 如果在枚举类内部可以省略点.
        // 包含枚举初始化的枚举类
        enum Error {
            case Number(Int)
            case Message(String)
            case Fatal
        }
        switch Error.Fatal {
        case .Number(let theNumber): break // 包含初始化参数值得枚举,声明let theNumber来接受枚举匹配目标的Int类型值
        case let .Message(theMessage): break// 声明 let .Mesage(theMessage) 的theMessage来接受匹配目标的String了类型值
        case .Fatal: break
        }
        switch Error.Fatal {
        case let .Number(n) where n > 0: break // 枚举参数where范围匹配表达式
        case let .Number(n) where n < 0: break
        case let .Number(0): break
        default: break
        }
        switch Error.Fatal {
        case .Number(1..<Int.max): break // 枚举参数范围匹配表达式 [大于0]
        case .Number(Int.min...(-1)): break // [小于0]
        case .Number(0): break // 0
        if case let .Number(n) = Error.Fatal { // swift2.0的 if case 匹配表达式
            
            }
        if case let .Number(n) = Error.Fatal where n < 0 { // if case 匹配表达式可以跟随where限定表达式
            
            }
        default: break
        }
        switch Optional<Int>(1) { // Optional类型实际上也是一个枚举类型 .None,.Some(value)
        case .None: break // nil值
        case .Some(1): break // value == 1
        case .Some(let n): break // let n = value
        }
        switch Optional<Int>(1)! {
        case 1,3,5,7,9: break // 多值匹配表达式
        case 2,4,6,8,10: break
        default: break
        }
        let anyObjectSwitch : AnyObject = 1
        switch anyObjectSwitch {
        case is Int, is Double: break // 多条件匹配表达式[注意,逗号不能用来分隔匹配绑定变量值的形式]
        default: break
        }
        switch "pep" {
        case "Manny": fallthrough // fallthrough:继续下一步case,相当于没有语句的语法表达式[fallthrough表达式不能绑定目标参数的形式]
        case "Meo": fallthrough
        case "Jack": break // Manny,Meo,Jack 匹配三个值得情况的表达式
        default: break
        }
        let _ : String = { // 匿名自执行函数 配合Switch表达式,可以获取函数返回指定条件匹配值
            switch Optional<String>("Type")! {
            case "Number": return "0"
            case "String": return "S"
            default : return "N"
            }
        }() // 匿名自执行函数
        let _ = Optional<String>("lisa")! == "lisay" ? "Lisay" : "is no lisay" // swift的三目函数
        let array : [String?] = ["String",nil,"Array","Lisay","78.0"]
        let _ = array.map { // NSObject Array
            $0 == nil ? NSNull() : $0!
        }
        // nil聚合表达式 nil-coalescing
        let _ = array.map { // NSObject Array
            $0 ?? NSNull() // $0 如果为nil空,则返回NSNull()[第二个参数],否则返回$0本身[第一个参数]
        }
        // 第一个参数强制转换为Option<Int>成功则返回,如果失败,第二个参数强制转换为Optional<Int>成功返回,如果失败 则返回0
        let _ = Optional<String>("Something")! as? Int ?? Optional<Int>(10)! as? Int ?? 0 // 空值聚合表达式
        // 循环语法 Loops
        var loops = 10
        while true {
            loops += 1 ;
            if loops > 100 {
                break
            }
        }
        repeat { // 重复的代码段
            loops += 10
        } while loops < 1000
        while let p = Optional<String>("lisya") { // Optional作为条件判断式的时候,默认为 target 不为nil则执行,这里用到绑定变量值得形式
            break
        }
        var v : UIView = UITextView()
        while let vv = v.superview where !(vv is UITableViewCell) { // while where 条件判断迭代
            v = vv // 获取父类视图为UITableViewCell的类
        }
        if let c = v.superview as? UITableViewCell {
            // 转换为UITableViewCell
        }
        var errIndex = 0
        let errArray : [Error] = [Error.Fatal, Error.Message("Message"), Error.Number(12), Error.Message("Pritice")]
        while case let .Message(message) = errArray[errIndex++] {
            // while case 循环迭代errArray数组里面的元素Item,绑定枚举类的value值
        }
        // for 迭代 ,1.for in ,2. for ; ;
        for var i = 1; i < 6; i++ {
            // for ; ;
        }
        var forI : Int;
        for forI in 1...5 {
            // for in 范围Range值
        }
        var g = (1...5).generate() // Range范围值生成器, RangeGenerate
        while let i = g.next() { // RangeGenerate范围生成器,用来生成一个范围对象值
            // 迭代范围对象的Item元素
        }
        let objectArray : [AnyObject] = ["Hello","Style","flower"]
        for string in objectArray as! [String] {
            // 在for表达式中使用强制转型,并且绑定变量接收迭代值
        }
        for (index,value) in (objectArray as! [String]).enumerate(){
            // 序列的枚举器,可以用来迭代索引和值 (索引,值) in 枚举器
        }
        for i in 0...10 where i % 2 == 0 {
            // for 迭代嵌套where条件筛选
        }
        for case let .Number(i) in errArray {
            // for 迭代枚举,并筛选指定类型的枚举类[筛选.Number类型,并绑定变量i接收枚举值]
        }
        let range = (0...10).reverse().filter { $0 % 2 == 0 } // 获取2的倍数数组
        for i in range {
            //
        }
        // stride : 步进
        for i in 10.stride(through: 0, by: -2) { // 步进,直到
            // for 迭代用于步进,直到并执行xx为止
            print("stride through \(i)") // 10,8,6,4,2,0
        }
        for i in 10.stride(to: 0, by: -2){
            // for 迭代用于步进,直到不执行xx为止
        }
        let arr1 = ["CA","MD","NY","AZ"]
        let arr2 = ["California","Maryland","NewYork"]
        var dic1 = [String:String]() // Dictionary<String,String>
        for (s1,s2) in zip(arr1, arr2) { // for 迭代用于zip合成序列 zip(sequence,sequence)两个序列合成返回Zip2Sequence对象
            dic1[s1] = s2
        } // 序列数组合成
        for var i = 1; i < 6; i++ { // for中绑定变量
            //
        }
        var values = [0.0]
        for (var i = 20, direction = 1.0; i < 60; i += 5, direction *= -1) { // for中绑定多个
            values.append(direction * M_PI / Double(i))
        }
        // 迭代关键字
        // fallthrough :case条件的中使用,终止当前case执行语句,继续执行下一个case条件判断执行
        // continue :loop迭代中使用,终止当前迭代Item,执行下一次迭代
        // break :loop迭代中/switch中使用,结束整个迭代
        outer : for i in 1...5 { // 声明label,break 到指定的label外
            for j in 1...5 {
                print("\(i), \(j)")
                break outer // 跳出outer指定语句外,Swift2.0的label可以用于if,do 关键字前的语法跳转
            }
        }
        // 异常
        // do {} catch errorType {} catch xxx {} ... 多catch块
        enum MyFirstError : ErrorType {
            case FirstMinorMistake
            case FirstMajorMistake
            case FirstFatalMistake
        }
        enum MySecondError : ErrorType {
            case FirstMinorMistake(i:Int) // 绑定枚举输入变量
            case FirstMajorMistake(s:String)
            case FirstFatalMistake
        }
        do {
            print("Catch Exception do")
        } catch MyFirstError.FirstFatalMistake {
            // 扑捉指定类型的异常
        } catch let err as MyFirstError {
            // 扑捉一类类型的异常绑定局部异常变量参数
        } catch MySecondError.FirstMinorMistake(let i) where i < 0 {
            // 扑捉绑定变量的枚举类型,同时匹配where表达式变量值
        } catch {
            // 扑捉其他所有抛出的异常
        }
        func throwableFunction() throws { // 声明throws抛异常函数
            throw MyFirstError.FirstFatalMistake // throw抛出异常
        }
        do {
            try throwableFunction() // 调用声明为throws的函数必须通过try声明抛出异常::
        } catch {
            // try执行抛出函数的扑捉
        }
        func tryunCatchException() {
            try! throwableFunction() // 声明为try!执行throws的函数,并且不扑捉异常,如果抛异常则崩溃
            try? throwableFunction() // 声明为try!执行throws的函数,并且不扑捉异常,如果抛异常不崩溃,返回nil值
        }
        func tryRethrowsCatchException(f:(String) throws -> ()) rethrows {
            try f("ok") // 被包含在rethrows内部的函数,用try执行,不用catch扑捉异常,如果有抛出异常则被rethrows
        }
        do {
            // String字符串强制转码为文件Path类型
            let _ = try String(contentsOfFile: "hollow World", encoding: NSUTF8StringEncoding)
            let _ = try! String(contentsOfFile: "/content/user/", encoding: NSUTF8StringEncoding) // try! 不抛异常的模式调用抛异常类型
            let _ = try? String(contentsOfFile: "/content/user/", encoding: NSUTF8StringEncoding)
        } catch {
            // 如果转换失败,则扑捉异常[和Object-C最大的不同,不用用NSError接收异常,正常扑捉模式]
        }
        do {
            let _ = try String(contentsOfFile: "hollow World", encoding: NSUTF8StringEncoding)
        } catch NSCocoaError.FileNoSuchFileError {
            // NSCocoaError 异常,NS异常类型自动转换
        } catch {
            //
        }
        // Defer 延迟处理
        {
            UIApplication.sharedApplication().beginIgnoringInteractionEvents() // 开始忽略交互事件
            if true {
                // Do Stuff 忽略App的Touch事件,执行
            }
            UIApplication.sharedApplication().endIgnoringInteractionEvents() // 结束忽略交互事件
        }()
        // 程序中断 Aborting
        func aborting() {
            fatalError("Aborting Application")
        }
        func assertAborting() { // assert中断只用于developing开始中,如果发布或者公开发行,系统会自动忽略assert中断
            assert(true, "") // assert 程序中断,(中断条件[true,正确不中断,false,错误执行中断],中断提示文本)
        }
        // Guard 监护,防护变量无效为空[guard只是声明判断值有效,但是值还是和普通值声明初始化一样属于该上下文变量属性]
        guard let s = Optional<String>("Hello") else { return } // 如果s的值无效[为nil]则执行return
        //guard case let .Number(n) == Error else { return}
        // Operators 操作符号[+,-,>,<...]魔法的符号,代表一个function和其他function一样,但是写法不同param1+param2
        // + 加号系统定义,魔法定义
        //infix operator + {
        //    associativity left
        //    precedence 140
        //}
        //infix     :This operator takes two parameters and appears between them.
        //prefix    :This operator takes one parameter and appears before it.
        //postfix   :This operator takes one parameter and appears after it.
        // + 加号使用声明定义,+为function函数名
        //func +(lhs: Int, rhs: Int) -> Int
        Vial(2) + Vial(3)
        let toAddVial = Vial(4)
        let _ = Vial(3) + toAddVial // 第二个被加数必须是let常量
        let _ = Vial(5) == Vial(5)
        let equatableProtocol = [Vial(3), Vial(3)]
        let _ = equatableProtocol.indexOf(Vial(3)) // 扩展的接口协议的方法
        let _ = 7^^2 // 自定义魔法符号函数
        // :: Privacy私有性[隐私性] internal,private,public
        // internal :内部的, 默认的属性都是这个内部的[在整个module中的所有file中都可以访问],Swift和Objct-C/C不同的地方就这个,在一个module中,所有内部类都只能唯一一个,所以同一个module不需要引入相同module下的文件(Objct-C/C要显式引入同项目下的文件),Swift会自动引入同Module下的所有文件
        // private :私有的,声明为私有的属性,类,方法只能在当前文件的范围内可以访问,文件外部不能访问[这个私有和其他语言的私有不同,同一个swift下的多个类可以相互访问]
        // public :公开的,声明为公开的属性,类,方法可以跨module进行访问,当然在访问时要引入module
        class DogPrivate {
            var name = ""
            private var say = "woof" // 私有属性,只在当然默认的范围可以访问
            func bark() {
                print(say)
            }
        }
        // Introspection 自描述接口,常用于调试程序使用,正式发布时不能使用,当然这些调试的自描述接口只能打印到XCode的Debug窗口上
        struct DogStringConvertible : CustomStringConvertible { // 自定义字符串转换器/转换式
            var name = "Fido"
            var license = 1
            var description : String { // 接口协议里面必须继承的属性
                return "name=\(name),license=\(license)"
            }
        }
        print(DogStringConvertible()) // 系统自动调用里面的自描述属性,description
        struct DogStringDebugConvertible : CustomDebugStringConvertible { // 自定义调试字符串转换器/转换式
            var name = "LiSay"
            var license = 2
            var debugDescription : String { // 接口协议里面必须继承的属性debugDescription,用于Debug自描述
                return "name=\(name),license=\(license)"
            }
        }
        print(DogStringDebugConvertible()) // 系统自动调用里面的自描述属性,debugDescription
        struct DogReflectable : CustomLeafReflectable { // 自定义叶子(子成员)更新函数
            var name = "Polo"
            var license = 3
            func customMirror() -> Mirror { // 覆盖更新子成员函数,在XCode的Debug中查看实体对象是,格式化显式子成员值
                let children : [Mirror.Child] = [("ineffable name", self.name),("license to kill", self.license)] // 组织key-value健值对
                let m = Mirror(self, children:children)
                return m
            }
        }
        let _ = DogReflectable()
        print(DogReflectable());
        // Memory Management 内存管理[swift是内存自动管理的,自动管理只针对Object对象引用类型,对于值Value类型的管理很复杂所以值类型没有自动管理,相对于其他语言用GC:garbage collection 定期调用垃圾回收系统来清除,Swift没有该方式]
        // 1.防止环形相互引用
        {
            class Dog {
                var cat : Cat? // persisting references,strong references 持久引用,强引用[只要Dog存在,Cat就一定不会被销毁]
                deinit {
                    // 销毁方法
                    print("Dog 被销毁")
                }
            }
            class Cat {
                var dog : Dog?
                deinit {
                    print("Cat 被销毁")
                }
            }
            let d = Dog()
            let c = Cat()
            d.cat = c // 构成相互引用环,两个对象不会被销毁,永远存在
            c.dog = d
        }();
        // 2.使用weak弱引用声明class类型引用
        {
            class Dog {
                weak var cat : Cat?
                deinit {
                    print("weak reference deinit Dog")
                }
            }
            class Cat {
                weak var dog : Dog?
                deinit {
                    print("weak reference deinit Cat")
                }
            }
            let d = Dog()
            let c = Cat()
            d.cat = c
            c.dog = d
            // weak 弱引用会被销毁,不会造成死锁
            class HelpViewController : UIViewController {
                weak var wv : UIWebView? // UI对象,由于UI对象会被加入到View的SubView中,实际上加入时已经是强引用/持久引用,所以防止类内部的强引用造成死锁,所有的View都用弱引用
                override func viewWillAppear(animated: Bool) {
                    super.viewWillAppear(animated)
                    let wv = UIWebView(frame: self.view.bounds)// 加入实际为强引用
                    //...
                    self.view.addSubview(wv)
                    self.wv = wv
                }
            }
        }();
        // 3.Unowned 不持久性声明class类引用
        {
            class Boy {
                var dog : Dog?
                deinit {
                    print("farewell from Boy")
                }
            }
            class Dog {
                unowned let boy : Boy // 不持久性属性,不产生强引用,如果传入对象被销毁,该对象同时被销毁
                init(boy:Boy) {
                    self.boy = boy
                }
                deinit {
                    print("farewell from Dog")
                }
            }
            let b = Boy()
            let d = Dog(boy: b)
            b.dog = d
            //
            var ob = Optional(Boy())
            let d1 = Dog(boy: ob!) // 弱引用
            ob = nil // 弱引用对象被置空,该弱引用同时被置空
            // print(d1.boy) // 运行时Crash
        }();
        // 4.匿名函数的weak,unowned引用
        class FunctionHolder : CustomStringConvertible {
            var function : (Void -> Void)? // Optional<Method>
            deinit {
                print("farewell from FunctionHolder")
            }
            var description : String {
                return "FunctionHolder description"
            }
        }
        {
            let f = FunctionHolder()
            f.function = { // 自己内部匿名函数引用自己
                [weak f] in // 匿名函数内部引用外部变量f,类内部函数引用类自己,用weak弱引用取消死锁
                // 传入的变量f为 Optional<FunctionHolder>类型变量,可能为nil,系统自动转换
                guard let f = f else { return } // guard 守护弱引用转换为强引用,重写声明let新常量f[1.解包,2.强引用为f]
                print(f) // 强引用
            }
            // f.function!()
        }();
        class MyDropBounceAndRollBehavior : UIDynamicBehavior {
            let v : UIView
            init(view v: UIView) {
                self.v = v
                super.init()
            }
            override func willMoveToAnimator(dynamicAnimator: UIDynamicAnimator?) {
                if dynamicAnimator == nil { return }
                let sup = self.v.superview!
                let grav = UIGravityBehavior()
                grav.action = {
                    [unowned self] in // 声明unowned不持久化传入参数[自引用]消除死锁
                    let items = dynamicAnimator?.itemsInRect(sup.bounds) as! [UIView]
                    if items.indexOf(self.v) == nil {
                        dynamicAnimator?.removeBehavior(self)
                        self.v.removeFromSuperview()
                    }
                }
                self.addChildBehavior(grav)
                grav.addItem(self.v)
            }
        }
        // weak,unowned弱引用只能使用与class对象,不能适用于值value类型[struct,enum]值类型有值类型的内存管理方式,和class的内存管理方式不一样[class类型包含 class类,子类,@objc类]
        // 接口协议如果要使用弱引用,那么接口协议必须要继承与class,如果接口协议继承于struct,enum那么该接口协议不能使用弱引用
        // protocol ClassProtocol : class { }
    }
}
// :: Operators
struct Vial {
    var numberOfBacteria : Int
    init(_ n:Int) {
        self.numberOfBacteria = n
    }
}
// 定义+操作符函数,连个输入参数,返回参数
func +(lhs:Vial, rhs:Vial) -> Vial {
    let total = lhs.numberOfBacteria + rhs.numberOfBacteria
    return Vial(total)
}
// 定义+=操作符函数,第一个是输入/输出参数,第二个是输入参数,无返回参数
func +=(inout lhs:Vial, rhs:Vial) {
    let total = lhs.numberOfBacteria + rhs.numberOfBacteria
    lhs.numberOfBacteria = total
}
// 定义==操作符号
func ==(lhs:Vial, rhs:Vial) -> Bool {
    return lhs.numberOfBacteria == rhs.numberOfBacteria
}
// 扩展接口到指定的类
extension Vial : Equatable {} // 扩展Equatable接口协议到Vial类中
// 自定义符号操作[自定义魔法符号,系统定义的除外[系统定义: /=-+!*%<>&|^?~ ]]
infix operator ^^ { // 两输入参数,一个输出参数
}
// 定义符号函数
func ^^(lhs: Int, rhs:Int) -> Int {
    var result = lhs
    for _ in 1..<rhs { // [1到rhs]的范围值
        result *= rhs
    }
    return result
}

