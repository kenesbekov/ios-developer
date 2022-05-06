//: [Previous](@previous)
// 2. (40) Реализовать протокол Machine для класса NewIphone и для класса FaxMachine согласно приницпам SOLID. Исправить ошибки.
import SwiftUI

protocol AnimalProtocol {
    var name: String { get }
    
    func printAnimalName()
}

class Animal: AnimalProtocol {
    var name: String = ""
    
    func printAnimalName() {
        print(name)
    }
}

class Formatter {}

class Document {
    var name: String
    var content: String
    var url: URL?
    var animal: Animal?

    init(name: String, content: String, url: URL) {
        self.name = name
        self.content = content
        self.url = url
    }
}

class PDF {
    let document: Document
    let service: Formatter
    var pdfCreater: Creater
    var pdfParser: Parser

    init(document: Document, service: Formatter, pdfCreater: Creater, pdfParser: Parser) {
        self.document = document
        self.service = service
        self.pdfCreater = pdfCreater
        self.pdfParser = pdfParser
    }
}

class FileManager {
    var service: Formatter?
    var fileManagerSender: Sender
    var fileManagerSaver: Saver
    
    init(service: Formatter, fileManagerSender: Sender, fileManagerSaver: Saver) {
        self.service = service
        self.fileManagerSender = fileManagerSender
        self.fileManagerSaver = fileManagerSaver
    }
}

class Creater {
    func create() -> Data {
        // Тут мы можем создавать из документа Data
        return Data()
    }
}

class Parser {
    func parsingPDFtoPhone() {
        // Тут парсим PDF для показа на разные устройства
    }
    
    func parsingPDFtoComputer() {
        // Тут парсим PDF для показа на разные устройства
    }
    
    func parsingPDFtoPaper() {
        // Тут парсим PDF для показа на разные устройства
    }
}

class Sender {
    var url: URL?
    var service: Formatter?
    
    func sendURL() -> Bool {
        guard let url = url else {
            return false
        }
        print(url)
        // Отправка документа на сервер
        return false
    }
    
    func sendPDF(_ pdf: PDF) {
        service = pdf.service
        // отправялем PDF
    }
    
    func sendDocument(_ doc: Document) {
        // отправялем Doc
    }
}

class Saver {
    func savePDF(_ pdf: PDF) {
        // сохраняем PDF
    }
    
    func saveDocument(_ doc: Document) {
        // сохраняем Doc
    }
}

protocol Faxoble {
    func sendFax(document: Document)
}

protocol Convertable {
    func convert(document: Document) -> PDF?
    func convert(document: Document) -> Image?
}

protocol Machine: Faxoble & Convertable {}

class NewIphone: Convertable {
    func convert(document: Document) -> PDF? {
        // do converting to pdf
        return nil
    }
    
    func convert(document: Document) -> Image? {
        // do converting to image
        return nil
    }
}
class FaxMachine: Faxoble {
    func sendFax(document: Document) {
        // do sending
    }
}

//: [Next](@next)
