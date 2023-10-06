import SwiftSyntax
import SwiftParser
import ArgumentParser
import Foundation

@main
struct Verifytool: ParsableCommand {
    
    static let configuration = CommandConfiguration(commandName: "Verify Tool",
            abstract: "Welcome to the Zuhlke Swift Verification Tool. To help up hold our high development quality and assurance for our customers, we have designed this tool to check the compliance of your code")
    
    @Option(name: .shortAndLong, help: "The file you want reviewed")
    var inputFile: String
    
    @Flag(name: .shortAndLong)
    var verbose = false

    func run() throws {
        
        let contents = try String(contentsOfFile: inputFile, encoding: .utf8)
        print(contents)
        
        let rootNode: SourceFileSyntax = Parser.parse(source: contents)
        recursiveCheck(node: Syntax(rootNode), indent: 0)
    }
    
    func recursiveCheck(node: Syntax,  indent: Int) {

        for child in node.children(viewMode: .all) {
            
            if UnresolvedTernaryExprSyntax(child) != nil {
                print("!!!WARNING - Use of ternary operator!!!")
            }
            
            if let token = TokenSyntax(child),  token.tokenKind == .exclamationMark {
                print("!!!WARNING - Use of force unwrapping!!!")
            }
            
            if let token = TokenSyntax(child),  token.tokenKind == .binaryOperator("??") {
                print("!!!WARNING - Use of nil coalescing operator!!!")
            }
            
            recursiveCheck(node: child, indent: indent + 1)
        }
        
    }

}
