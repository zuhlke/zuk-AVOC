import SwiftSyntax
import SwiftParser
import ArgumentParser
import Foundation

@main
struct Verifytool: ParsableCommand {
    
    static let configuration = CommandConfiguration(commandName: "Verify Tool",
            abstract: "Welcome to the Zuhlke Swift Verification Tool. To help up hold our high development quality and assurance for our customers, we have designed this tool to check the compliance of your code")
    
    @Option(name: .shortAndLong, help: "The file you want reviewed")
    var input: String
    
    @Flag(name: .shortAndLong)
    var verbose = false

    func run() throws {
        
        do {
            let code = try ArgumentDecoder.process(argument: input)
            print(code)
        } catch {
            print("FAIL")
        }
    }
}


