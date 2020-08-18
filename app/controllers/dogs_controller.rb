require_relative './base_controller.rb'
require 'ostruct'

class DogsController < BaseController

  # GET /dogs
  #
  def index
    @title = "So many dogs"
    @dogs = (1..5).map do |i|
      OpenStruct.new(id: i, name: "Dog-#{i}")
    end
    build_response render_template
  end

  # GET /dogs/:id?name=Optional%20Custom%20Name
  #
  def show
    dog_name = params["name"] || "Dog-#{params[:id]}"
    @title = "#{dog_name}'s page"
    @dog = OpenStruct.new(id: params[:id], name: dog_name)
    build_response render_template
  end

  # GET /dogs/new
  #
  def new
    @title = "More dogs please"
    build_response render_template
  end

  # POST /dogs
  #
  def create
    redirect_to "/dogs"
  end
end