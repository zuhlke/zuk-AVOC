import SwiftSyntax
import SwiftParser
import ArgumentParser

@main
struct Verifytool: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "Verify Tool",
            abstract: "Welcome to the Zuhlke Swift Verification Tool. To help up hold our high development quality and assurance for our customers, we have designed this tool to check the compliance of your code")
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(Verifytool().text)

        let swiftSource = """
        import Foundation

        func test() {
            true ? print("hello world") : print("hello moon")
        }

        test()
        """

        let rootNode: SourceFileSyntax = Parser.parse(source: swiftSource)

        // We will replace this in the next step.
        print(rootNode.children(viewMode: .all))

    }
}
