class Api::V1::PhoneNumbersController < ApplicationController
  # Take all phone numbers
  # GET index
  def index
    @numbers = PhoneNumber.all
    render json: @numbers
  end

  # Finds the phone number in db, returns json {found: 1} if it found
  # GET find/:number
  def find
    number = PhoneNumber.find_by(number: params[:number])
    if number
      render json: { found: 1 }, status: :ok
    else
      render json: { found: 0 }, status: :not_found
    end
  end

  # Creates phone numbers from xlsx file
  # POST
  def create
    if params[:file].present?
      PhoneNumber.import numbers_from(params[:file].path), ignore: true
    end
  end

  private

  def numbers_from(path)
    sheet = RubyXL::Parser.parse(path)[0]
    sheet.map do |row|
      PhoneNumber.new number: row[0].value
    end
  end
end
