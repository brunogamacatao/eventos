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
      resource url:'js/jquery/jquery.validationEngine-pt.js', bundle: 'wizard'
      resource url:'js/jquery/jquery.validationEngine.js', bundle: 'wizard'
      resource url:'js/jquery/validationEngine.jquery.css', bundle: 'wizard'
      resource url:'js/jquery/jquery.maskedinput-1.2.2.min.js', bundle: 'wizard'
      resource url:'js/jquery/jquery.smartWizard-2.0.min.js', bundle: 'wizard'
      resource url:'js/bootstrap/bootstrap.min.js', bundle: 'wizard'
      resource url:'js/inscricoes/index.js', bundle: 'wizard'
      resource url:'css/wizard/smart_wizard.css', bundle: 'wizard'
      resource url:'css/bootstrap/bootstrap.min.css', bundle: 'wizard'
    }
    
    overrides {
      jquery {
        defaultBundle 'wizard'
      }
      fileuploader {
        defaultBundle 'wizard'
      }
    }
}