package eventos

class BarcodeTagLib {
  def barcode = { attrs ->
    def code = attrs.code
    out << "<img src='"
    out << g.createLink(action: "barcode", controller: "barCode", id: code)
    out << "' alt='${code}'/>"
  }
}
