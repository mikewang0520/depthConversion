//
//  ViewController.swift
//  test001
//
//  Created by apple on 2022/2/9.
//

import UIKit
import  Vision
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readFloat32(fileName: "303806.286542916depth_array.data")
        readInt8(fileName: "303806.286542916depth_array.data")
    }
    
    func readFloat32(fileName:String)  {
        let path = Bundle.main.path(forResource: fileName, ofType: nil)!
        //获取data数据
        let rData = try! Data(contentsOf: URL(fileURLWithPath: path))
        //let rData = try! Data.init(contentsOf: URL(fileURLWithPath: path), options: Data.ReadingOptions.alwaysMapped)
        var rArray: [Float32]!
        // 一个Float32系统分配占用多少字节内存(4字节)
        let stride = MemoryLayout<Float32>.stride
        // 获取rData的内存数据
        rData.withUnsafeBytes { (bytes: UnsafePointer<Float32>) in
            // 生成数组
            //start:bytes的首地址开始,  count:  rData的总字节数除以一个float32占用的字节数, 就是数组个数
            // 也就是按照每四个字节截取一次,生成数组  .
            rArray = Array(UnsafeBufferPointer(start: bytes, count: rData.count / stride))
        }
        
        let array = rData.withUnsafeBytes { (bytes: UnsafePointer<Float32>) in
            // 生成数组
            //start:bytes的首地址开始,  count:  rData的总字节数除以一个float32占用的字节数, 就是数组个数
            // 也就是按照每四个字节截取一次,生成数组  .
            rArray = Array(UnsafeBufferPointer(start: bytes, count: rData.count / stride))
        }
        
        //打印 where index
//        for (index,item) in rArray.enumerated()  {
//            print("\(index):\(item)")
//        }
        let stringArray = rArray.map{String($0)}
        let text = stringArray.joined(separator: " ")
        print(text)
        let data = text.data(using: .utf8)!
        //保存到电脑桌面, 注意"用户名"要写成自己的
        //获取电脑桌面路径
        let url = URL(fileURLWithPath: "/Users/mike/Desktop/SwiftUI/array/array_float32.txt", isDirectory: false)
        do {
            //
            try data.write(to: url, options: Data.WritingOptions.fileProtectionMask)
        } catch  {
            print("save text error:\(error.localizedDescription)")
        }
        print("count:\(rArray.count)")//49152  12288
    }
    
    func readInt8(fileName:String)  {
        let path = Bundle.main.path(forResource: fileName, ofType: nil)!
        //获取data数据
        let rData = try! Data(contentsOf: URL(fileURLWithPath: path))
        //let rData = try! Data.init(contentsOf: URL(fileURLWithPath: path), options: Data.ReadingOptions.alwaysMapped)
        var rArray: [Int8]!
        // 一个int8系统分配占用多少字节内存(4字节)
        let stride = MemoryLayout<Int8>.stride
        // 获取rData的内存数据
        rData.withUnsafeBytes { (bytes: UnsafePointer<Int8>) in
            // 生成数组
            //start:bytes的首地址开始,  count:  rData的总字节数除以一个int8占用的字节数, 就是数组个数
            // 也就是按照每1个字节截取一次,生成数组  .
            rArray = Array(UnsafeBufferPointer(start: bytes, count: rData.count / stride))
        }
        
        let stringArray = rArray.map{String($0)}
        let text = stringArray.joined(separator: " ")
        print(text)
        let data = text.data(using: .utf8)!
        //保存到电脑桌面, 注意"用户名"要写成自己的
        // "/Users/mike/Desktop/array_int8.txt"
        let url = URL(fileURLWithPath: "/Users/mike/Desktop/SwiftUI/array/array_int8.txt", isDirectory: false)
        do {
            //
            try data.write(to: url, options: Data.WritingOptions.fileProtectionMask)
        } catch  {
            print("save text error:\(error.localizedDescription)")
        }
           
        //打印 where index
//        for (index,item) in rArray.enumerated() {
//            print("\(index):\(item)")
//        }
        print("count:\(rArray.count)")
    }
}

