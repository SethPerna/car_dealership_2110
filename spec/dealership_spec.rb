require './lib/car'
require './lib/dealership'

RSpec.describe do
  it "exists" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")

    expect(dealership).to be_a Dealership
    expect(dealership.inventory).to eq([])
    expect(dealership.inventory_count).to eq(0)
  end

  it "adds cars to invenotry and counts them" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford", "Mustang", 1500, 36)
    car_2 = Car.new("Toyota", "Prius", 1000, 48)
    dealership.add_car(car_1)
    dealership.add_car(car_2)

    expect(dealership.inventory).to eq([car_1, car_2])
    expect(dealership.inventory_count).to eq(2)
  end

  it "shows cars by make" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford", "Mustang", 1500, 36)
    car_2 = Car.new("Toyota", "Prius", 1000, 48)
    car_3 = Car.new("Toyota", "Tercel", 500, 48)
    car_4 = Car.new("Chevrolet", "Bronco", 1250, 24)
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
    expect(dealership.cars_by_make("Toyota")).to eq([car_2, car_3])
    expect(dealership.cars_by_make("Ford")).to eq([car_1])
  end
end
