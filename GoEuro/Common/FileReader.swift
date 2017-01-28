//
//  FileReader.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Foundation
import Rswift

enum FileReaderError: Error {
    case fileNotFound(String)
    case unknownError(NSError)
    case encodingData(Data)
}

struct FileReader {

    static func readStringFrom(file: String, extension: String) throws -> String {
        let data = try readDataFrom(file: file, extension: `extension`)
        if let string = String(data: data, encoding: String.Encoding.utf8) {
            return string
        }
        else {
            throw FileReaderError.encodingData(data)
        }
    }

    static func readStringFrom(resource: FileResource) throws -> String {
        let data = try readDataFrom(resource: resource)
        if let string = String(data: data, encoding: String.Encoding.utf8) {
            return string
        }
        else {
            throw FileReaderError.encodingData(data)
        }
    }

    static func readDataFrom(resource: FileResource) throws -> Data {
        guard let url = resource.url() else { throw FileReaderError.fileNotFound(resource.name) }

        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            return data
        }
        catch let error as NSError {
            throw FileReaderError.unknownError(error)
        }
    }

    static func readDataFrom(file: String, extension: String) throws -> Data {
        if let path = Bundle.main.path(forResource: file, ofType: `extension`) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            }
            catch let error as NSError {
                throw FileReaderError.unknownError(error)
            }
        }
        else {
            throw FileReaderError.fileNotFound("\(file).\(`extension`)")
        }
    }

}
