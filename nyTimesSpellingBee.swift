import Foundation

func loadFile(_ file: String)->[String]?{
    guard let path = Bundle.main.path(forResource: file, ofType: ".txt") else{
        return nil
    }
    return try? String(contentsOfFile: path, encoding: .ascii).components(separatedBy: "\n")
}

let chars: Set<String.Element> = ["t","u","x","e","a","l","n","\r"]
func valid(_ set: Set<String.Element>)->Bool{
    return set.contains("n") && set.subtracting(chars).isEmpty
}
let words = loadFile("words_alpha")!.filter{ $0.count > 4 ? valid(Set($0)) : false }

print(words.count)
words.forEach{ print($0) }
