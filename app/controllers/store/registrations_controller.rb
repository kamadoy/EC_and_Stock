# frozen_string_literal: true

class Store::RegistrationsController < Devise::RegistrationsController
 prepend_before_action :require_no_authentication, only: [:cancel]
 # prepend_before_action :authenticate_scope!, only: [:update, :destroy]
 #prepend_before_action :set_minimum_password_length, only: [:new, :edit]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
 # before_action :creatable?, only: [:new, :create]
#  before_action :editable?, only: [:edit, :update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      redirect_to new_admin_store_path
      #redirect_to new_admin_store_path
    end
  end

  # GET /resource/edit
 # def edit
  #  if by_admin_store?(params)
   #   self.resource = resource_class.to_adapter.get!(params[:id])
  #  else
  #    authenticate_scope!
   #   super
 #   end
#  end

  # PUT /resource
 # def update
  #  if by_admin_store?(params)
  #    self.resource = resource_class.to_adapter.get!(params[:id])
  #  else
  #    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
  #  end

  #  prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

   # if by_admin_store?(params)
   #   resource_updated = update_resource_without_password(resource, account_update_params)
 #   else
 #     resource_updated = update_resource(resource, account_update_params)
 #   end


   # if resource_updated
  #    if is_flashing_format?
    #    flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
    #      :update_needs_confirmation : :updated
    #    set_flash_message :notice, flash_key
    #  end
    #  if !by_admin_store?(params)
      #  bypass_sign_in resource, scope: resource_name
    #  end
    #  respond_with resource, location: after_update_path_for(resource)
  #  else
   #   clean_up_passwords resource
   #   set_minimum_password_length
   #   respond_with resource
  #  end
#  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the store wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:address])
  end


  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:address])
  end

 # def by_admin_store?(params)
  #  params[:id].present? && current_store_is_admin?
#  end

 def sign_up(resource_name, resource)
 end
  #def current_store_is_admin?
    #store_signed_in? && current_store.has_role?(:admin)
 # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
      admin_stores_path
  end

  # The path used after update.
  def after_update_path_for(resource)
      admin_stores_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

 # def sign_up(resource_name, resource)
    #if !current_store_is_admin?
    #  sign_in(resource_name, resource)
   # end
  #end

  #def update_resource_without_password(resource, params)
  #  resource.update_without_password(params)
  #end

  #def creatable?
   # raise CanCan::AccessDenied unless store_signed_in?

    #if !current_store_is_admin?
      #raise CanCan::AccessDenied
    #end
  #end

 # def editable?
    #raise CanCan::AccessDenied unless store_signed_in?

   # if params[:id].present? && !current_store_is_admin?
     # raise CanCan::AccessDenied
   # end
 # end
end