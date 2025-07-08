//
//  HowToView.swift
//  RomaNo.
//
//  Created by ceviixx on 20.04.22.
//

import SwiftUI

struct HowToView: View {
    
    
    @State var date: Date
    var how: [howContStruct] {
        convertDateToHowRow(date: date)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(how) { section in
                    Section(section.title) {
                        VStack {
                            HowRowView(font: .headline.bold())
                            ForEach(section.content) { row in
                                HowRowView(rowData: row)
                            }
                        }
                        .foregroundColor(.primary)
                    }
                    .foregroundColor(.secondary)
                }
            }
            .navigationTitle("The solution")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}




struct howContStruct: Identifiable {
    var id: UUID = UUID()
    var title: LocalizedStringKey
    var content:[HowToStruct]
}


struct HowToStruct: Identifiable {
    var id: UUID = UUID()
    var column_1: LocalizedStringKey
    var column_2: LocalizedStringKey
    var column_3: LocalizedStringKey
    var newChars: String
}

struct HowRowView: View {
    
    var font: Font = .body
    var rowData: HowToStruct = HowToStruct(column_1: "Change", column_2: "Roman", column_3: "Left", newChars: "-")
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], alignment: .leading, content: {
            Text(rowData.column_1)
                .font(font)
            Text(rowData.column_2)
                .font(font)
            Text(rowData.column_3)
                .font(font)
        })
    }
}

struct HowToView_Previews: PreviewProvider {
    static var previews: some View {
        HowToView(date: .now)
    }
}
