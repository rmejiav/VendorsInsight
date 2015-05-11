class UserMailer < ApplicationMailer
    default from: 'from@example.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirmar_solicitud.subject
  #
    def solicitud_creada(usuario_correo, solicitud)
    @solicitud = solicitud
    @greeting = "Hola"
    mail(to: usuario_correo, subject: 'solicitud creada')
  end
end
