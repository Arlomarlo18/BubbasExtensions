//
//  CSVManager.swift
//
//  Created by Bubba Hall on 9/23/23.
//

import Foundation

@available(iOS 15.0, *)
public struct CSVManager {
    
    public init() {}
    
    ///  This function takes the entire file that is a string and replaces the \r and the \n\n with \n
    ///
    /// - Parameter file: This is the enitre CSV file as a string
    /// - Returns: Another String that is the cleaned version of the file for the correct format.
    private func cleanRows(file: String) -> String {
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        return cleanFile
    }
    
    /// This function takes a CSV file that is apart of your project and Loads the CSV file as an array of whatever type.
    ///
    /// Using this function will take any CSV file that is apart of your project and turn it into an array of objects as long as that object conforms to CSVConvertible.
    ///
    /// - Parameter fileName: This is the name of CSV file that is in your project.
    /// - Returns: This returns an Array of whatever type you want the object to be.
    /// - Warning: This has to be a CSV File, and It has to be in the project.
    public func loadCSVDataFromProject<T: CSVConvertible>(fileName: String) -> [T] {
        var csvToStructure = [T]()
        
        // Locate the CSV FILE
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "csv") else {
            print("Error file not found")
            return []
        }
        
        // Convert the contents of the file into one very long string.\
        var data = ""
        do {
            data = try String(contentsOfFile: filePath)
        } catch {
            print("Error converting file: \(error.localizedDescription)")
            return []
        }
        
        // Clean up the \r and \n occurances
        data = cleanRows(file: data)
        
        // Split the long string into an array of 'rows' of data. Each row is a string.
        // When we detect the \n
        var rows = data.components(separatedBy: "\n")
        
        // Remove the header
        rows.removeFirst()
        
        // Now loop around and split each row into columns
        rows.forEach { row in
            let csvColumns = row.components(separatedBy: ",")
            if csvColumns.count == rows.first?.components(separatedBy: ",").count {
                if let lineStructure = T(raw: csvColumns) {
                    csvToStructure.append(lineStructure)
                }
            }
        }
        return csvToStructure
    }
}



