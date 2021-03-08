class AddressesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def create
  end
end
