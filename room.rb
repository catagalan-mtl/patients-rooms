require_relative "./patient.rb"

class Room
  attr_reader :patients
  attr_accessor :id

  class RoomFull < Exception; end

  def initialize(attributes = {})
    @id = attributes[:id]
    @patients = []
    @capacity = attributes[:capacity]
  end

  def add(patient)
    if full?
      fail RoomFull, "The room is FULL!!!!"
      # puts "Room is full!!!!!!!!"
    else
      patient.room = self
      @patients << patient
      puts "#{patient.name} adedd to room"
    end
  end

  def full?
    @capacity <= @patients.count
  end
end
