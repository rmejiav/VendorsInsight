# -*- coding: utf-8 -*-
class LoginController < ApplicationController
  include LoginHelper
  before_filter :authorize, :except => [:autenticar, :create]
  
  def index
    @vendedor = get_usuario(session[:usuario_id])
  end
  
  def autenticar
  end
  
  def create
    sesion = Usuario.autenticar(params[:login][:cedula],params[:login][:clave])
    if sesion
      session[:usuario_id] = sesion.id
      session[:tipo_usuario] = sesion.tipo_usuario
      if sesion.tipo_usuario.eql? "Vendedor"
        @vendedor = sesion
      render 'index'
      end
    else
      flash[:danger] = 'Clave o cédula no coinciden'
      render 'autenticar'      
    end
  end

  def destroy
    $sesion = nil
    render 'autenticar'
  end

end
