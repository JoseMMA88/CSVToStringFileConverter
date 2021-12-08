//
//  CSVFileHelper.swift
//  CSVtoStringFileConverter
//
//  Created by Jose Manuel Malagón Alba on 8/12/21.
//

import Foundation

class CSVFileHelper {
    
    // MARK: - CSV
    static func loadCSV(_ fileName: String) -> Array<String>{
        
        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let bundleURL = URL(fileURLWithPath: "CSVFiles.bundle", relativeTo: currentDirectoryURL)
        let bundle = Bundle(url: bundleURL)
        
        guard let path = bundle?.path(forResource: fileName, ofType: "csv") else { return [] }
        do {
            let content = try String(contentsOfFile: path)
            let parsedCSV: [String] = content.components(separatedBy: "\n").map{ $0.components(separatedBy: "")[0] }
            return parsedCSV
        }
        catch {
            return []
        }
    }
    
}
