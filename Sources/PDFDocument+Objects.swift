//
//  PDFDocument+Commands.swift
//  TPPDF
//
//  Created by Philip Niedertscheider on 12/08/2017.
//
//

public extension PDFDocument {
    
    // MARK: - Layout
    
    public func addSpace(_ container: PDFContainer = PDFContainer.contentLeft, space: CGFloat) {
        objects += [(container, PDFSpaceObject(space: space))]
    }
    
    // MARK: - Lines
    
    public func addLineSeparator(_ container: PDFContainer = PDFContainer.contentLeft, style: PDFLineStyle) {
        objects += [(container, PDFLineSeparatorObject(style: style))]
    }
    
    // MARK: - Image

    public func addImage(_ container: PDFContainer = PDFContainer.contentLeft, image: PDFImage) {
        objects += [(container, PDFImageObject(image: image))]
    }
    
    public func addImagesInRow(_ container: PDFContainer = PDFContainer.contentLeft, images: [PDFImage], spacing: CGFloat = 5.0) {
        objects += [(container, PDFImageRowObject(images: images, spacing: spacing))]
    }
    
    // MARK: - Text

    public func addText(_ container: PDFContainer = PDFContainer.contentLeft, text: String, lineSpacing: CGFloat = 1.0) {
        objects += [(container, PDFTextObject(text: text, lineSpacing: lineSpacing))]
    }

    public func addAttributedText(_ container: PDFContainer = PDFContainer.contentLeft, text: NSAttributedString) {
        objects += [(container, PDFAttributedTextObject(text: text))]
    }
    

    public func setFont(_ container: PDFContainer = PDFContainer.contentLeft, font: UIFont) {
        objects += [(container, PDFFontObject(font: font))]
    }
    
    public func resetFont(_ container: PDFContainer = PDFContainer.contentLeft) {
        objects += [(container, PDFFontObject(font: UIFont.systemFont(ofSize: UIFont.systemFontSize)))]
    }
    
    public func setTextColor(_ container: PDFContainer = PDFContainer.contentLeft, color: UIColor) {
        objects += [(container, PDFTextColorObject(color: color))]
    }
    
    public func resetTextColor(_ container: PDFContainer = PDFContainer.contentLeft) {
        objects += [(container, PDFTextColorObject(color: UIColor.black))]
    }
    
    // MARK: - Table
    
    open func addTable(_ container: PDFContainer = PDFContainer.contentLeft, table: PDFTable) {
        objects += [(container, PDFTableObject(table: table))]
    }
    
    // MARK: - List
    
    public func addList(_ container: PDFContainer = PDFContainer.contentLeft, list: PDFList) {
        objects += [(container, PDFListObject(list: list))]
    }
    
    open func setIndentation(_ container: PDFContainer = PDFContainer.contentLeft, indent: CGFloat) {
        objects += [(container, PDFIndentationObject(indentation: indent))]
    }
    
    open func setAbsoluteOffset(_ container: PDFContainer = PDFContainer.contentLeft, offset: CGFloat) {
        objects += [(container, PDFOffsetObject(offset: offset))]
    }
    
    open func createNewPage() {
        objects += [(.contentLeft, PDFPageBreakObject())]
    }
}
