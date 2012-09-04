modules = {
    application {
        resource url:'js/application.js'
    }
    
    formulario {
         dependsOn 'jquery'
         resource url:'js/jquery/jquery.validationEngine-pt.js'
         resource url:'js/jquery/jquery.validationEngine.js'
         resource url:'js/jquery/validationEngine.jquery.css'
         resource url:'js/jquery/jquery.maskedinput-1.2.2.min.js'
         resource url:'js/jquery/jquery.maskMoney.js'
    }
    
    wizard {
      dependsOn 'jquery'
      dependsOn 'fileuploader'
      resource url:'js/jquery/jquery.validationEngine-pt.js'
      resource url:'js/jquery/jquery.validationEngine.js'
      resource url:'js/jquery/validationEngine.jquery.css'
      resource url:'js/jquery/jquery.maskedinput-1.2.2.min.js'
      resource url:'js/jquery/jquery.smartWizard-2.0.min.js'
      resource url:'js/bootstrap/bootstrap.min.js'
      resource url:'js/inscricoes/index.js'
      resource url:'css/wizard/smart_wizard.css'
      resource url:'css/bootstrap/bootstrap.min.css'
    }
}