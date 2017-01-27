//
//  JSONReader.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Foundation
import ObjectMapper

enum JSONReaderError: Error {
    case readingFile(String)
    case mappingJSON
}

struct JSONReader {

    static func readJSONArrayFrom<T: Mappable>(file: String) throws -> [T] {
        guard let jsonString = try JSONReader.readJSONStringFrom(file: file) else {
            throw JSONReaderError.readingFile(file)
        }

        guard let jsonObject = Mapper<T>().mapArray(JSONString: jsonString) else {
            throw JSONReaderError.mappingJSON
        }

        return jsonObject
    }

    static func readJSONObjectFrom<T: Mappable>(file: String) throws -> T {
        guard let jsonString = try JSONReader.readJSONStringFrom(file: file) else {
            throw JSONReaderError.readingFile(file)
        }

        guard let jsonObject = Mapper<T>().map(JSONString: jsonString) else {
            throw JSONReaderError.mappingJSON
        }

        return jsonObject
    }

    static func readJSONStringFrom(file: String) throws -> String? {
        let jsonData = try readJSONDataFrom(file: file)

        return String(data: jsonData, encoding: String.Encoding.utf8)
    }

    static func readJSONDataFrom(file: String) throws -> Data {
        return try FileReader.readDataFrom(file: file, extension: "json")
    }
    
}
