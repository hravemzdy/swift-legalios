//
// Created by Ladislav Lisy on 30.06.2021.
//

import Foundation
import Quick
import Nimble

@testable import legalios

let EXAMPLE_FOLDER_NAME = "test_expected"
let PARENT_EXAMPLE_FOLDER_NAME = "legalios"

func createLoggerFile(fileName : String) throws -> FileHandle {
    let fm = FileManager.default
    var currPath = URL(string: fm.currentDirectoryPath)!
    while (currPath.lastPathComponent != PARENT_EXAMPLE_FOLDER_NAME && currPath.pathComponents.count != 1) {
        currPath = currPath.deletingLastPathComponent()
    }
    let basePath = currPath.appendingPathComponent(EXAMPLE_FOLDER_NAME)
    let fileURLs = basePath.appendingPathComponent(fileName).absoluteURL

    if !fm.fileExists(atPath: fileURLs.path) {
        fm.createFile(atPath: fileURLs.path, contents: Data("".utf8), attributes: nil)
    }

    let fileHandle = try FileHandle(forWritingTo: fileURLs)
    fileHandle.truncateFile(atOffset: 0)

    return fileHandle
}

func logTestStart(protokol: FileHandle) {
    let emptyText = ""
    protokol.write(Data(emptyText.utf8))

    protokol.write(Data("YEAR".utf8))
    for testMonth in 1...12 {
        protokol.write(Data("\t\(testMonth)".utf8))
    }
    protokol.write(Data("\n".utf8))
}

func logTestYear(protokol: FileHandle, value: String) {
    protokol.write(Data("\(value)".utf8))
}

func logTestEnd(protokol: FileHandle) {
    protokol.write(Data("\n".utf8))
}


func logExampleIntValue(protokol: FileHandle, value: Int32) {
    protokol.write(Data("\t\(value)".utf8))
}

func logTestIntExamples(fileName : String, tx: [(title: String, tests: [(title: String, year: Int16, month: Int16, expYear: Int16, expMonth: Int16, expected: Int32)])]) {
#if __PROTOKOL_TEST_FILE__
    do {
        let testLogger = try createLoggerFile(fileName: fileName)

        logTestStart(protokol: testLogger)
        tx.forEach { (title: String, tests: [(title: String, year: Int16, month: Int16, expYear: Int16, expMonth: Int16, expected: Int32)]) in
            logTestYear(protokol: testLogger, value: title)
            tests.forEach { (title: String, year: Int16, month: Int16, expYear: Int16, expMonth: Int16, expected: Int32) in
                logExampleIntValue(protokol: testLogger, value: expected)
            }
            logTestEnd(protokol: testLogger)
        }
        testLogger.closeFile()
    } catch let loggerError {
        print("Error: \(loggerError)".utf8)
    }
#endif
}

func logExampleDecValue(protokol: FileHandle, value: Double) {
    let intValue: Int32 = Int32(value*100)
    protokol.write(Data("\t\(intValue)".utf8))
}

func logTestDecExamples(fileName : String, tx: [(title: String, tests: [(title: String, year: Int16, month: Int16, expYear: Int16, expMonth: Int16, expected: Double)])]) {
#if __PROTOKOL_TEST_FILE__
    do {
        let testLogger = try createLoggerFile(fileName: fileName)

        logTestStart(protokol: testLogger)
        tx.forEach { (title: String, tests: [(title: String, year: Int16, month: Int16, expYear: Int16, expMonth: Int16, expected: Double)]) in
            logTestYear(protokol: testLogger, value: title)
            tests.forEach { (title: String, year: Int16, month: Int16, expYear: Int16, expMonth: Int16, expected: Double) in
                logExampleDecValue(protokol: testLogger, value: expected)
            }
            logTestEnd(protokol: testLogger)
        }
        testLogger.closeFile()
    } catch  let loggerError {
        print("Error: \(loggerError)".utf8)
    }
#endif
}

