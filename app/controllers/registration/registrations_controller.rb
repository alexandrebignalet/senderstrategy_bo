# frozen_string_literal: true

class Registration::RegistrationsController < Devise::RegistrationsController
  before_action ->{ authenticate_user!(force: true) }
end
