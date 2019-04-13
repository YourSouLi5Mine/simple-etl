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
      row[2] = states[row[0][11..12].to_sym]
    end
  end

  def upload
    @rows.map { |row| User.create(curp: row[0], gender: row[1], state: row[2]) }
  end

  def states
    state = {
      'AS': 'AGUASCALIENTES',
      'BC': 'BAJA CALIFORNIA',
      'BS': 'BAJA CALIFORNIA SUR',
      'CC': 'CAMPECHE',
      'CL': 'COAHUILA',
      'CM': 'COLIMA',
      'CS': 'CHIAPAS',
      'CH': 'CHIHUAHUA',
      'DF': 'DISTRITO FEDERAL',
      'DG': 'DURANGO',
      'GT': 'GUANAJUATO',
      'GR': 'GUERRERO',
      'HG': 'HIDALGO',
      'JC': 'JALISCO',
      'MC': 'MEXICO',
      'MN': 'MICHOACAN',
      'MS': 'MORELOS',
      'NT': 'NAYARIT',
      'NL': 'NUEVO LEON',
      'OC': 'OAXACA',
      'PL': 'PUEBLA',
      'QT': 'QUERETARO',
      'QR': 'QUINTANA ROO',
      'SP': 'SAN LUIS POTOSI',
      'SL': 'SINALOA',
      'SR': 'SONORA',
      'TC': 'TABASCO',
      'TS': 'TAMAULIPAS',
      'TL': 'TLAXCALA',
      'VZ': 'VERACRUZ',
      'YN': 'YUCATAN',
      'ZS': 'ZACATECAS',
      'NE': 'NACIDO EN EL EXTRANJERO'
    }
  end
end
