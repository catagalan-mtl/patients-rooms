require_relative "./patient.rb"
require_relative "./room.rb"
require_relative "./patient_repository.rb"

# john = Patient.new(name: "John", blood_type: "A-")
# sarah = Patient.new(name: "Sarah")
# peter = Patient.new(name: "Peter")
# room = Room.new(capacity: 2)
# # p room
# room.add(john)
# # p room
# # p room.full?

# room.add(sarah)
# # p room
# # p room.full?

# room.add(peter)
# # p room
room_repo = RoomRepository.new('./rooms.csv')
repo = PatientRepository.new("./patients.csv", room_repo)
# p repo
anne = Patient.new(name: "Anne")
repo.add(anne)
cata = Patient.new(name: "Cata")
repo.add(cata)
p repo
