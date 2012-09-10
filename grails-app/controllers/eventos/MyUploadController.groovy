package eventos

import uk.co.desirableobjects.ajaxuploader.AjaxUploaderService

import grails.converters.JSON
import static org.codehaus.groovy.grails.commons.ConfigurationHolder.config as Config
import org.springframework.http.HttpStatus
import uk.co.desirableobjects.ajaxuploader.exception.FileUploadException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import org.springframework.web.multipart.MultipartFile
import javax.servlet.http.HttpServletRequest

class MyUploadController {
  AjaxUploaderService ajaxUploaderService

  def upload = {
    session.arquivos = session.arquivos ?: [:]
    
    try {
      File uploaded = createTemporaryFile()
      InputStream inputStream = selectInputStream(request)

      ajaxUploaderService.upload(inputStream, uploaded)
      
      session.arquivos[params.tipo_arquivo] = uploaded.getCanonicalPath() 

      return render(text: [success:true] as JSON, contentType:'text/json')
    } catch (FileUploadException e) {
      log.error("Failed to upload file.", e)
      return render(text: [success:false] as JSON, contentType:'text/json')
    }
  }

  private InputStream selectInputStream(HttpServletRequest request) {
    if (request instanceof MultipartHttpServletRequest) {
      MultipartFile uploadedFile = ((MultipartHttpServletRequest) request).getFile('qqfile')
      return uploadedFile.inputStream
    }
    return request.inputStream
  }

  private File createTemporaryFile() {
    return File.createTempFile('grails', 'ajaxupload')
  }
}