import Foundation

func loadFile(_ file: String)->[String]?{
    guard let path = Bundle.main.path(forResource: file, ofType: ".txt") else{
        return nil
    }
    return try? String(contentsOfFile: path, encoding: .ascii).components(separatedBy: "\n")
}

let letters: Set<String.Element> = ["t","u","x","e","a","l","n","\r"]

let words = loadFile("words_alpha")!.filter { (word) in
    let set = Set(word)
    if set.count > 4 && set.contains("n"){
        for c in set{
            if !letters.contains(c){ return false }
        }
        return true
    }
    return false
}

print(words.count)
words.forEach{ print($0) }
