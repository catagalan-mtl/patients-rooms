# require 'csv'
# # require_relative './patient.rb'

# patients = []
# CSV.foreach("./patients.csv", {headers: :first_row, headers_converters: :symbol}) do |row|
#   row[:id] = row[:id].to_i
#   row[:cured] = row[:cured] == 'true'
#   p row
# end
