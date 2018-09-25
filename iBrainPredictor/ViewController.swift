//
//  ViewController.swift
//  iBrainPredictor
//
//  Created by Namikare Gikoha on 2018/09/24.
//  Copyright © 2018年 gikoha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let risk_stroke: [Int] = [0, 2, 0, 0, 0, 1, 1, 1, -1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0]
    let risk_LVO: [Int] = [0, 0, 0, 1, 0, 0, -3, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 1, 3, 0]
    let risk_ICH: [Int] = [0, 0, -2, 0, -2, 1, 1, 0, 0, 2, 0, 0, 1, 1, -2, 1, 1, 0, 0, 2, 0]
    let risk_SAH: [Int] = [-2, 2, 0, 0, 0, 0, 4, 0, 0, -2, -2, 1, 0, 0, 0, 2, 0, 0, 0, 0, -2]

    var cbarray: [Checkbox] = []
    let titles: [String] = ["年齢≧75", "喫煙", "脳梗塞の既往", "急激な発症", "症状が改善した",
        "症状が悪化傾向", "頭痛", "言葉が出ない", "けいれん", "構音障害",
        "めまい", "嘔吐・はきけ", "収縮期血圧≧165", "拡張期血圧≧95", "不整脈",
        "意識障害", "共同偏視", "半側空間無視", "顔面神経麻痺", "上肢の麻痺",
        "下肢の麻痺"]

    @IBOutlet var strokeField: UILabel!
    @IBOutlet var LVOField: UILabel!
    @IBOutlet var ICHField: UILabel!
    @IBOutlet var SAHField: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var i = 0
        for title in titles
        {
            let x = 10 + (i % 2) * 140
            let y = 70 + (i / 2) * 30
            let btn: Checkbox = Checkbox(frame: CGRect(x: x, y: y, width: 20, height: 20))
            btn.checkmarkStyle = Checkbox.CheckmarkStyle.tick
            btn.checkmarkSize = 0.7
            self.view.addSubview(btn)

            let lbl: UILabel = UILabel(frame: CGRect(x: x + 30, y: y, width: 100, height: 20))
            lbl.text = title
            lbl.font = UIFont.systemFont(ofSize: 12)
            self.view.addSubview(lbl)

            cbarray.append(btn)
            i += 1
        }


    }
    @IBAction func calcButton(_ sender: Any)
    {

        var s_stroke = 0
        var s_LVO = 0
        var s_ICH = 0
        var s_SAH = 0
        var i = 0
        for cb in cbarray
        {
            if(cb.isChecked)
            {
                s_stroke += risk_stroke[i]
                s_LVO += risk_LVO[i]
                s_ICH += risk_ICH[i]
                s_SAH += risk_SAH[i]
            }
            i += 1
        }
        var str: String = ""
        switch(s_stroke)
        {
        case 1: str = "36%"
        case 2: str = "61%"
        case 3: str = "71%"
        default: if(s_stroke <= 0) { str = "14%" }
            else { str = "88%" }
        }
        strokeField.text = str

        str = ""
        switch(s_LVO)
        {
        case 0...3: str = "4%"
        case 4...6: str = "18%"
        case 7: str = "49%"
        default: if(s_LVO <= -1) { str = "0%" }
            else { str = "79%" }
        }
        LVOField.text = str

        str = ""
        switch(s_ICH)
        {
        case -1...2: str = "8%"
        case 3...4: str = "23%"
        case 5...6: str = "42%"
        default: if(s_ICH <= -2) { str = "3%" }
            else { str = "65%" }
        }
        ICHField.text = str

        str = ""
        switch(s_SAH)
        {
        case -2...2: str = "1%"
        case 3...4: str = "10%"
        case 5...6: str = "30%"
        default: if(s_SAH <= -3) { str = "0%" }
            else { str = "89%" }
        }
        SAHField.text = str
    }

}

