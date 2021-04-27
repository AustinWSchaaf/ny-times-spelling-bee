import Foundation

func loadFile(_ file: String)->[String]?{
    guard let path = Bundle.main.path(forResource: file, ofType: ".txt") else{
        return nil
    }
    let words = try? String(contentsOfFile: path, encoding: .ascii).components(separatedBy: "\n")
    return words
}

let letters: Set<String> = ["m","t","i","o","p","l"]
let words = loadFile("words_alpha")!.filter{ $0.count > 3 && $0.contains("a") ? letters.intersection(Set($0.map{String($0)})).count > 2 : false }

print(words.count)
words.forEach{ print($0) }

//let words = loadFile("words_alpha")!.filter{ $0.count > 3 && $0.contains("n") }
//
//let ans = words.filter{ letters.intersection(Set($0.map{String($0)})).count > 2 }
