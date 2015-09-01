# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mode = :production

if mode == :test
  5.times do |c_i|
    c = BuildingComplex.new
    c.name = FFaker::Lorem.words(rand(3))
    c.status =  [:building_in_process, :built, :project].sample
    mi = c.build_main_info
    mi.house_class = [:delux, :club, :elite, :business, :comfort, :standard, :econom].sample
    mi.availability = [:available_apartments_or_square, :no_available_apartments].sample
    mi.start_date = FFaker::Time.date
    mi.end_date = mi.start_date + [6,12,18,24].sample.months
    mi.price_from = rand(1000.0..100000.0)
    mi.phone = FFaker::PhoneNumber.short_phone_number

    ti = c.build_technical_info
    ti.building_type = FFaker::Lorem.sentence
    ti.earth_area_square = rand(50.0..300.0)
    ti.sections_count = rand(1..10)

    ati = c.build_apartment_technical_info
    ati.level = rand(1..10)
    ati.world_sides = (arr = []; rand(1..8).times {|i| s = ([:south_west, :south_east, :north_west, :north_east, :west_north, :west_south, :east_north, :east_south] - arr).sample; arr << s }; arr).join(",")
    %w(exterior_walls apartment_separator_walls apartment_inner_separator_walls telephony internet tv sanitary_equipment wiring heating ventilation water_supply internal_sewer_system internal_finishing_work).each do |p|
      ati.send "#{p}=", FFaker::Lorem.sentence
    end

    ati.additional_info = FFaker::Lorem.sentences(rand(5))
    ati.turnkey_apartment = FFaker::Lorem.sentence
    ati.height = rand(2.5..4.0)
    ati.filling_openings_in_walls = FFaker::Lorem.words(rand(3))

    5.times do |h_i|
      h = ApartmentHouse.new
      #h.status = [:building_in_process, :built, :project].sample

      c.apartment_houses << h

      [8, 12, 16, 20, 32].sample.times do |a_i|
        a = Apartment.new
        h.apartments << a
      end
    end

    c.save
  end
end

if mode == :production

end