//
//  TelegramDisplayLogger.swift
//  Display#shared
//
//  Created by Bo Hu on 2020/4/23.
//

private var telegramDisplayLogger: (String, String, String, Int) -> Void = { _,_,_,_  in }

public func setTelegramDisplayLogger(_ f: @escaping (String, String, String, Int) -> Void) {
    telegramDisplayLogger = f
}

func telegramDisplayLog(_ what: @autoclosure () -> String, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
  telegramDisplayLogger(what(), fileName, functionName, lineNumber)
}
