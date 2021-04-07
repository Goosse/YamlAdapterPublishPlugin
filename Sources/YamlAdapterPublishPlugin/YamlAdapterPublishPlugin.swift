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
        
            let removedSingleQuotes = html.trimmingCharacters(in: CharacterSet(charactersIn: "\'"))
            print(removedSingleQuotes.trimmingCharacters(in: CharacterSet(charactersIn: "\"")));
            return removedSingleQuotes.trimmingCharacters(in: CharacterSet(charactersIn: "\""))

        }
    }
}
