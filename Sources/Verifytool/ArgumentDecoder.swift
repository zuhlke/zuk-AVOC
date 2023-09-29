//
//  ArgumentDecoder.swift
//  
//
//  Created by Ross Viviani on 29/09/2023.
//

import Foundation

enum VerifyError: Error {
    case argumentDecodingError
}

struct ArgumentDecoder {

    static func process(argument: String) throws -> [String] {

        var isDir: ObjCBool = false
        
        do {
            
            if FileManager().fileExists(atPath: argument, isDirectory: &isDir) {
                
                if isDir.boolValue {
                    
                    let items = try FileManager.default.contentsOfDirectory(atPath: argument)
                    let files = items.map({"\(argument)/" + "\($0)"})
       
                    return try files.map({ try String(contentsOfFile: $0, encoding: .utf8)})
                } else {
                    return [try String(contentsOfFile: argument, encoding: .utf8)]
                }
            }
            
            throw VerifyError.argumentDecodingError
        } catch {
            throw error
        }
    }
}
