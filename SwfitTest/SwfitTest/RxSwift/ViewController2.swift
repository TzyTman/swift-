//
//  ViewController2.swift
//  SwfitTest
//
//  Created by tuzhengyao on 2020/4/26.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

import UIKit
//import RxSwift
//import RxCocoa

enum ErrorKind: Error {
    case invalidCharacter
    case mismatchedTag
    case internalError
}

//enum apI {
//    //通过用密码获取一个token
//
//    static func token(username:String,password:String,success:(String)-> Void,failure:(ErrorKind) -> Void){
//
//        if username == "tuzhengyao", password == "123456" {
//            success("token")
//        }else {
//
//            failure(ErrorKind.invalidCharacter)
//        }
//    }
//
//    //通过token获取用户信息
//    static func userinfo(token:String,success:(String)-> Void,failure:(ErrorKind)-> Void){
//        if token == "token" {
//            success("获取用户信息成功")
//        }else {
//            failure(ErrorKind.invalidCharacter)
//        }
//    }
//}
//
//enum usertoken {
//
////    static func token(username:String , password: String) -> Observable<String>{
////        return Observable.of("成功")
////    }
////
////    static func userinfo(token:String) -> Observable<String> {
////        //        return Observable.of("涂政要的信息获取成功")
////        return Observable.error(ErrorKind.internalError)
////    }
////
////    static func teacher(tid: Int) -> Observable<String> {
////        return Observable.of("老师id")
////    }
////
////    static func teacherComments(tid: Int) -> Observable<String> {
////        return Observable.of("老师id")
////    }
//}
//
//typealias JSON = Any
//
//
//
//struct Parent { //家长
//    func receiveAprize() {
//        print("家长上台领奖")
//    }
//}
//
//struct Student {
//
//    var name: String = ""
//    var className: String = ""
//    var grade: String = ""
//    var sex: String = ""
//    var score: Int = 0
//    var parent: Parent = Parent()
//
//    func singAsong(name:String) {
//        print("一起唱\(name)")
//    }
//}
//
//class ViewController2: UIViewController {
//
////    let disposebag = DisposeBag()
//
//    lazy var scrollview: UIScrollView = UIScrollView.init(frame:  CGRect.zero)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view
//        view.backgroundColor = UIColor.white
//        //过滤器
//        let allStudents: [Student] = getSchoolStudents()
//
//        let graeThreeClassTwoStudents:[Student] = allStudents.filter{
//            Student in Student.grade == "3" && Student.className == "2"
//        }
//        print(graeThreeClassTwoStudents)
//
//        //过滤条件满足执行对象方法
//        graeThreeClassTwoStudents.filter { Student in Student.sex == "male"
//        }.forEach{ boy in
//            boy.singAsong(name: "\(boy.name)一剪梅")
//        }
//
//        //执行对象里面对象的方法
//        graeThreeClassTwoStudents.filter{Student in Student.score>=90
//        }.map{ Student in Student.parent
//        }.forEach{ parent in
//            parent.receiveAprize()
//        }
//
//    }
//
//    func getSchoolStudents() -> [Student] {
//
//        var studentArray: [Student] = [Student]()
//        let student1 = Student(name: "张三", className: "2", grade: "3",sex: "male",score: 90 ,parent: Parent())
//        let student2 = Student(name: "李四", className: "2", grade: "3",sex: "male",score: 80 ,parent: Parent())
//        let student3 = Student(name: "王五", className: "1", grade: "3",sex: "woman",score: 82 ,parent: Parent())
//
//        studentArray.append(student1)
//        studentArray.append(student2)
//        studentArray.append(student3)
//
//        return studentArray
//    }
//
//    deinit {
//        print("game Over")
//        print(self.disposebag)
//
//        /// 移除通知
//        NotificationCenter.default.removeObserver(self)
//    }
//
//
//    //序列
//       func rxObservable() {
//           /**
//            “创建序列最直接的方法就是调用 Observable.create，然后在构建函数里面描述元素的产生过程。 observer.onNext(0) 就代表产生了一个元素，他的值是 0。后面又产生了 9 个元素分别是 1, 2, ... 8, 9 。最后，用 observer.onCompleted() 表示元素已经全部产生，没有更多元素了。”
//            */
//           let number: Observable<Int> = Observable.create { (observer) -> Disposable in
//               observer.onNext(0)
//               observer.onNext(1)
//               observer.onNext(2)
//               observer.onNext(3)
//               observer.onNext(4)
//               observer.onCompleted()
//
//               return Disposables.create()
//           }
//
//           number.subscribe(onNext: { (number) in
//               print(number)
//           }, onError: { (error) in
//               print(error)
//           }, onCompleted: {
//               print("结束")
//               }).disposed(by: disposebag)
//       }
//
//       func RxSwiftTest() {
//
//           //1.给按钮添加事件
//           let btn = UIButton.init(type: .custom)
//           btn.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
//           btn.backgroundColor = UIColor.red
//           self.view.addSubview(btn)
//           btn.rx.tap.subscribe(onNext: { [weak self] in
//               guard let strongSelf = self else {
//                   return
//               }
//               let vc2 = ViewController2.init()
//               strongSelf.navigationController?.pushViewController(vc2, animated: true)
//               //            let userlogin = UserLoginVC.init(nibName: "UserLoginVC", bundle: nil)
//               //            strongSelf.navigationController?.pushViewController(userlogin, animated: true)
//
//               //         NotificationCenter.default.post(name: NSNotification.Name("isTest"), object: self, userInfo: ["post":"NewTest"])
//
//
//           }).disposed(by: disposebag)
//
//           //2.Rx实现代理方法
//           scrollview = UIScrollView.init(frame: CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-60))
//           scrollview.backgroundColor = UIColor.blue
//           scrollview.contentSize = CGSize.init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//           //        scrollview.delegate = self
//           view.addSubview(scrollview)
//           //rx监听UIscrollview 偏移量
//           scrollview.rx.contentOffset.subscribe(onNext:{ contentOffset in
//
//               print("contentoffset:\(contentOffset)")
//
//           }).disposed(by: disposebag)
//
//
//           //3 闭包回调
//
//           //4.通知
//           NotificationCenter.default.addObserver(self, selector: #selector(test), name: NSNotification.Name(rawValue: "isTest"), object: nil)
//
//           NotificationCenter.default.rx.notification(Notification.Name(rawValue: "isTest")).subscribe(onNext:{
//               (notification) in
//
//               print("Application Will Enter Foreground")
//
//           }).disposed(by: disposebag)
//
//           // 5.多任务之间有依赖关系
//
//           apI.token(username: "tuzhengyao", password: "123456", success: { token in
//
//               apI.userinfo(token: token, success: { userinfo in
//
//                   print("获取用户信息成功")
//
//               }) { ErrorKind in
//
//                   print("获取用户信息失败")
//
//               }
//
//           }) { ErrorKind in
//
//               print("登录失败")
//           }
//
//           //使用Rx 实现
//           usertoken.token(username: "涂政要", password: "123456").flatMapLatest(usertoken.userinfo).subscribe(onNext:{ userinfo in
//
//               print("获取用户信息成功")
//
//           }, onError: { error in
//
//               print("获取用户信息失败:\(error)")
//
//           }).disposed(by: disposebag)
//
//
//           //      MARK:6 --- 等待多个并发任务完成后处理结果
//
//           Observable.zip(usertoken.teacher(tid: 12),
//                          usertoken.teacherComments(tid: 12))
//               .subscribe(onNext:{
//                   (thacher , comments) in
//                   print("获取老师信息成功:\(thacher)")
//                   print("获取老师评论:\(comments)")
//               },onError:{ error in
//                   print("获取老师信息或评论失败\(error)")
//               }).disposed(by: disposebag)
//       }
//
//       @objc func test(nofi: Notification) {
//
//           let str = nofi.userInfo!["post"]
//           print(String(describing: str!) + "this notifi")
//       }
//
//}
//
//extension ViewController2: UIScrollViewDelegate {
//
//    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    //        let offset = scrollView.contentOffset
//    //        print(offset.x , offset.y)
//    //    }
//    //通过Rx实现
//}
