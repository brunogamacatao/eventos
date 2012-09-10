package util.barcode

import org.krysalis.barcode4j.impl.int2of5.Interleaved2Of5Bean

class BarCodeController {
  def barcode4jService
  
  def barcode = {
    def contentType = 'image/png'
    def generator = new Interleaved2Of5Bean()
    
    generator.height = 15
    generator.doQuietZone(true)
    generator.setFontSize(0.0)
    
    response.contentType = contentType
    barcode4jService.render(generator, params.id, response, contentType)
    response.outputStream.flush()
  }
}
