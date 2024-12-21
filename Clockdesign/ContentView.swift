//
//  ContentView.swift
//  Clockdesign
//
//  Created by 牟禮優汰 on 2024/12/21.
//

import SwiftUI

struct ContentView: View {
     @State private var currentTime: String = ""
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter() //DateFormatter()は型の名前？？
            formatter.dateFormat = "HH:mm:ss"
            return formatter
    }()
    
    var body: some View {
            ZStack {
                let SelectColor = Color.blue
                SelectColor.ignoresSafeArea()
                HStack{
                    let timeComponents = currentTime.split(separator: ":")//:のあるところでフォーマットを分割
                    if timeComponents.count == 3 {//Listみたいにして，HH,mm,ssを0,1,2にするssだけfontsizeを変更
                        HStack(alignment: .lastTextBaseline){
                            Text("\(timeComponents[0]):\(timeComponents[1])")
                                .font(.custom("Menlo", size: 220))
                            Text("\(timeComponents[2])")
                                .font(.custom("Menlo", size: 110)) // 秒だけ小さくする
                        }
                    }
                }
                    }
            .onAppear {//時間の更新
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    currentTime = timeFormatter.string(from: Date())
                }
            }
        
    }
    
}

