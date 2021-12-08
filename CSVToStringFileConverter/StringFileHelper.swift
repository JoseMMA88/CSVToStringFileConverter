//
//  StringFileHelper.swift
//  CSVtoStringFileConverter
//
//  Created by Jose Manuel Malagón Alba on 8/12/21.
//

import Foundation

class StringFileHelper {
    
    //MARK: - String File

    static func generateStringsFile(_ data: Array<String>) {
        
        var dataString = ""
        
        for (_, translation) in data.enumerated() {
            let currentTranslation = translation.components(separatedBy: ";")
            
            if(currentTranslation[0] != "" && currentTranslation[1] != ""){
                dataString = dataString + generateStringFileLine(baseTranslation: currentTranslation[0], newTranslation: currentTranslation[1])
            }
            
        }
        
        
        let filename = getDocumentsDirectory().appendingPathComponent("Localizable.strings")
        
        do {
            try dataString.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        }
        catch {
            print(error)
        }
        
        print(dataString)
        
    }

    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    static func generateStringFileLine(baseTranslation: String, newTranslation: String) -> String {
        
        let title = "/* \(baseTranslation) */\n"
        let translationStrings = "\"\(baseTranslation)\" = \"\(newTranslation.replacingOccurrences(of: "\r", with: ""))\"; \n\n"
        
        return title + translationStrings
    }

}
