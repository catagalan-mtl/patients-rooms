require 'csv'
require_relative './room.rb'

class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    load_csv
  end

  def find(index)
    @rooms[index - 1]
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      # p row[:id]
      row[:capacity] = row[:capacity].to_i
      room = Room.new(row)
      @rooms << room
    end
    # p @rooms
  end

end
