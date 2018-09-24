//
//  ViewController.swift
//  iBrainPredictor
//
//  Created by Namikare Gikoha on 2018/09/24.
//  Copyright © 2018年 gikoha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let risk_stroke : [Int]  = [0, 2, 0, 0, 0, 1, 1, 1, -1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0]
    let risk_LVO : [Int]  = [0, 0, 0, 1, 0, 0, -3, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 1, 3, 0]
    let risk_ICH : [Int]  = [0, 0, -2, 0, -2, 1, 1, 0, 0, 2, 0, 0, 1, 1, -2, 1, 1, 0, 0, 2, 0]
    let risk_SAH : [Int] = [-2, 2, 0, 0, 0, 0, 4, 0, 0, -2, -2, 1, 0, 0, 0, 2, 0, 0, 0, 0, -2]

    var cbarray : [Checkbox] = []
    let titles : [String] = ["年齢≧75", "喫煙", "脳梗塞の既往", "急激な発症", "症状が改善した",
                             "症状が悪化傾向", "頭痛", "言葉が出ない", "けいれん", "構音障害",
                             "めまい", "嘔吐・はきけ", "収縮期血圧≧165", "拡張期血圧≧95", "不整脈",
                             "意識障害", "共同偏視", "半側空間無視", "顔面神経麻痺", "上肢の麻痺",
                             "下肢の麻痺" ]
    
    @IBOutlet var strokeField: UILabel!
    @IBOutlet var LVOField: UILabel!
    @IBOutlet var ICHField: UILabel!
    @IBOutlet var SAHField: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var i=0
        for title in titles
        {
            let x = 10+(i%2)*140
            let y = 70+(i/2)*30
            let btn: Checkbox = Checkbox(frame: CGRect(x: x, y:y, width:20, height:20))
            btn.checkmarkStyle = Checkbox.CheckmarkStyle.tick
            self.view.addSubview(btn)
            
            let lbl: UILabel = UILabel(frame: CGRect(x: x+30, y:y, width:100, height:20))
            lbl.text = title
            lbl.font = UIFont.systemFont(ofSize: 9)
            self.view.addSubview(lbl)

            cbarray.append(btn)
            i+=1
        }
        
        
    }
    @IBAction func calcButton(_ sender : Any) {

        var s_stroke = 0
        var s_LVO = 0
        var s_ICH = 0
        var s_SAH = 0
    }

}

