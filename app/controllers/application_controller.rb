class ApplicationController < ActionController::Base
include SessionsHelper

before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
    mies_show_path
end

protect_from_forgery with: :exception
before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
    added_attrs = [ :name, :email, :password ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
end


def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
end

end
