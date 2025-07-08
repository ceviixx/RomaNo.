//
//  RomanNumber.swift
//  RomaNo.
//
//  Created by ceviixx on 19.04.22.
//

import Foundation

extension ContentView {
    
    func getRome(_ value:Int) -> String {
        var arabValue = value
        
        var arabString = ""
        
        while arabValue > 0 {
            
            if arabValue >= 1000 {
                arabValue = arabValue - 1000
                arabString.append("M")
            } else if arabValue >= 500 && arabValue < 1000 {
                if arabValue >= 900 {
                    arabValue = arabValue - 900
                    arabString.append("CM")
                } else {
                    arabValue = arabValue - 500
                    arabString.append("D")
                }
            } else if arabValue >= 100 && arabValue < 500 {
                if arabValue >= 400 {
                    arabValue = arabValue - 400
                    arabString.append("CD")
                } else {
                    arabValue = arabValue - 100
                    arabString.append("C")
                }
            } else if arabValue >= 50 && arabValue < 100 {
                if arabValue >= 90 {
                    arabValue = arabValue - 90
                    arabString.append("XC")
                } else {
                    arabValue = arabValue - 50
                    arabString.append("L")
                }
            } else if arabValue >= 10 && arabValue < 50 {
                if arabValue >= 40 {
                    arabValue = arabValue - 40
                    arabString.append("XL")
                } else {
                    arabValue = arabValue - 10
                    arabString.append("X")
                }
            } else if arabValue >= 5 && arabValue < 10 {
                if arabValue >= 9 {
                    arabValue = arabValue - 9
                    arabString.append("IX")
                } else {
                    arabValue = arabValue - 5
                    arabString.append("V")
                }
            } else if arabValue >= 1 && arabValue < 5 {
                if arabValue >= 4 {
                    arabValue = arabValue - 4
                    arabString.append("IV")
                } else {
                    arabValue = arabValue - 1
                    arabString.append("I")
                }
            }
            
        }
        
        return arabString
    }
    
}



let dateFormatterDay: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "d"
    return formatter
}()

let dateFormatterMonth: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "M"
    return formatter
}()

let dateFormatterYear: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    return formatter
}()

func convertDateToHowRow(date: Date) -> [howContStruct] {
    let day = Int(dateFormatterDay.string(from: date))!
    let month = Int(dateFormatterMonth.string(from: date))!
    let year = Int(dateFormatterYear.string(from: date))!
    
    var data = [howContStruct]()
    data.append(howContStruct(title: "Day", content: getHowRow(day)))
    data.append(howContStruct(title: "Month", content: getHowRow(month)))
    data.append(howContStruct(title: "Year", content: getHowRow(year)))
    return data
}


func getHowRow(_ value:Int) -> [HowToStruct] {
    var arabValue = value
    
    var romeString = ""
    
    var content = [HowToStruct]()
    content.append(
        HowToStruct(column_1: "", column_2: "", column_3: "\(arabValue)", newChars: "")
    )
    
    while arabValue > 0 {
        
        if arabValue >= 1000 {
            arabValue = arabValue - 1000
            romeString.append("M")
            content.append(
                HowToStruct(column_1: "-1000", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "M")
            )
        } else if arabValue >= 500 && arabValue < 1000 {
            if arabValue >= 900 {
                arabValue = arabValue - 900
                romeString.append("CM")
                content.append(
                    HowToStruct(column_1: "-900", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "CM")
                )
            } else {
                arabValue = arabValue - 500
                romeString.append("D")
                content.append(
                    HowToStruct(column_1: "-500", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "D")
                )
            }
        } else if arabValue >= 100 && arabValue < 500 {
            if arabValue >= 400 {
                arabValue = arabValue - 400
                romeString.append("CD")
                content.append(
                    HowToStruct(column_1: "-400", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "CD")
                )
            } else {
                arabValue = arabValue - 100
                romeString.append("C")
                content.append(
                    HowToStruct(column_1: "-100", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "C")
                )
            }
        } else if arabValue >= 50 && arabValue < 100 {
            if arabValue >= 90 {
                arabValue = arabValue - 90
                romeString.append("XC")
                content.append(
                    HowToStruct(column_1: "-90", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "XC")
                )
            } else {
                arabValue = arabValue - 50
                romeString.append("L")
                content.append(
                    HowToStruct(column_1: "-50", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "L")
                )
            }
        } else if arabValue >= 10 && arabValue < 50 {
            if arabValue >= 40 {
                arabValue = arabValue - 40
                romeString.append("XL")
                content.append(
                    HowToStruct(column_1: "-40", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "XL")
                )
            } else {
                arabValue = arabValue - 10
                romeString.append("X")
                content.append(
                    HowToStruct(column_1: "-10", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "X")
                )
            }
        } else if arabValue >= 5 && arabValue < 10 {
            if arabValue == 9 {
                arabValue = arabValue - 9
                romeString.append("IX")
                content.append(
                    HowToStruct(column_1: "-9", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "IX")
                )
            } else {
                arabValue = arabValue - 5
                romeString.append("V")
                content.append(
                    HowToStruct(column_1: "-5", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "V")
                )
            }
        } else if arabValue >= 1 && arabValue < 5 {
            if arabValue == 4 {
                arabValue = arabValue - 4
                romeString.append("IV")
                content.append(
                    HowToStruct(column_1: "-4", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "IV")
                )
            } else {
                arabValue = arabValue - 1
                romeString.append("I")
                content.append(
                    HowToStruct(column_1: "-1", column_2: "\(romeString)", column_3: "\(arabValue)", newChars: "I")
                )
            }
        }
        
    }
    return content
}
