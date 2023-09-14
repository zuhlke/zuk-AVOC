import SwiftSyntax
import SwiftParser

@main
public struct Verifytool {
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
