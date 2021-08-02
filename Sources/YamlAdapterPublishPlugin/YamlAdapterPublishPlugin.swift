import Ink
import Publish
import Foundation
//import Yams

public extension Plugin {
    static func yamlAdapter() -> Self {
        Plugin(name: "YAML Adapter") { context in
            context.markdownParser.addModifier(
                .removeQuotes()
            )
        }
    }
}

public extension Modifier {
    static func removeQuotes() -> Self {

        return Modifier(target: .metadataValues) { html, metadata in
        
            var ourString = html
            if (html.hasPrefix("\"") && html.hasSuffix("\"")) || (html.hasPrefix("\'") && html.hasSuffix("\'"))
            {
                ourString = ourString.trimmingCharacters(in: CharacterSet(charactersIn: "\""));
            }
            return ourString
        }
    }
}
