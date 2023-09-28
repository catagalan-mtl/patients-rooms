require_relative './room_repository.rb'

class Patient
  attr_reader :name, :cured, :blood_type
  attr_accessor :room, :id, :room_id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @blood_type = attributes[:blood_type]
    @room_id = attributes[:room_id]
    @room = @rooms.find(@room_id)
  end

  def cure
    @cured = true
  end

end
