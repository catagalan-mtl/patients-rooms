require 'csv'
require_relative './patient'
require_relative './room_repository.rb'

# Service to parse csv files from database
class PatientRepository
  def initialize(csv_file, room_repository)
    @csv_file = csv_file
    @patients = []
    @next_id = 1
    @room_repository = room_repository
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == 'true'
      patient = Patient.new(row)
      room = @room_repository.find(row[:room_id].to_i)
      patient.room = room
      # p patient.room
      @patients << patient
    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id', 'name', 'cured', 'blood_type', 'room_id']
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured, patient.blood_type, patient.room_id]
      end
    end
  end

end

# repo = PatientRepository.new("./patients.csv")
# p repo
