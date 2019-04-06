require 'csv'

class UserController < ApplicationController
  def index
    extract
    transform
    upload
  end

  private

  def extract
    *@rows = CSV.read('app/assets/csv/Datos_RFC.csv').to_a
  end

  def transform
    @rows.map do |row|
      if row[1] === 'X'
        row[1] = row[0][10]
      end
    end
  end

  def upload
    @rows.map { |row| User.create(curp: row[0], gender: row[1]) }
  end
end
