//
// Created by Ladislav Lisy on 16.07.2021.
//

import Foundation

@testable import legalios

let PROTOKOL_FOLDER_NAME = "test_values"
let PARENT_PROTOKOL_FOLDER_NAME = "legalios"

func createProtokolFile(fileName : String) throws -> FileHandle {
    let fm = FileManager.default
    var currPath = URL(string: fm.currentDirectoryPath)!
    while (currPath.lastPathComponent != PARENT_PROTOKOL_FOLDER_NAME && currPath.pathComponents.count != 1) {
        currPath = currPath.deletingLastPathComponent()
    }
    let basePath = currPath.appendingPathComponent(PROTOKOL_FOLDER_NAME)
    let fileURLs = basePath.appendingPathComponent(fileName).absoluteURL

    if !fm.fileExists(atPath: fileURLs.path) {
        fm.createFile(atPath: fileURLs.path, contents: Data("".utf8), attributes: nil)
    }

    let fileHandle = try FileHandle(forWritingTo: fileURLs)
    fileHandle.truncateFile(atOffset: 0)

    return fileHandle
}

func exportPropsStart(protokol: FileHandle) {
    let emptyText = ""
    protokol.write(Data(emptyText.utf8))

    protokol.write(Data("YEAR".utf8))
    for testMonth in 1...12 {
        protokol.write(Data("\t\(testMonth)".utf8))
    }
    protokol.write(Data("\n".utf8))
}

func closeProtokolFile(protokol: FileHandle) {
    protokol.closeFile()
}

func exportPropsEnd(protokol: FileHandle) {
    protokol.write(Data("\n".utf8))
}

func exportPropsYear(protokol: FileHandle, value: Int16) {
    protokol.write(Data("\(value)".utf8))
}

func exportPropsValue(protokol: FileHandle, value: Int32) {
    protokol.write(Data("\t\(value)".utf8))
}

func exportPropsValue(protokol: FileHandle, value: Decimal) {
    let intValue: Int32 = Int32((value as NSDecimalNumber).doubleValue*100)
    protokol.write(Data("\t\(intValue)".utf8))
}

