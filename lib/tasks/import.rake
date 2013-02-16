require 'csv'
include ActionView::Helpers::TextHelper #Because of pluralize
$stdout.sync = true #For progress bar...

desc "Upload database from csv"
task :import => [:environment] do


# This method import a csv file from db folder.
# First parameter is your database model name
# and after your database rows as symbols.
# The sort of symbols equal with rows in csv file.
# The first row in csv file will be ignored. It is the unique id row.
# Example: You have a Host model, with :name and :address symbol
# import_in_model(Host, :name, :address)
# If you have a row with _id, then this function use only integer value from this cells.

  def import_in_model(model, *symbols)
    file = "db/#{model.to_s}s-2000.csv"
    print "Importing #{file}"
    counter = 0

    CSV.foreach(file, headers: true) do |row|
      data = {}
      i = 1
      symbols.each do |symbol|
        # Checking symbol is an id row, if yes, then take only integer from the cell
        symbol.to_s.include?("_id") ? data[symbol] = row[i].gsub(/[^0-9]/,'').to_i : data[symbol] = row[i]
        i += 1
      end
      model.create(data)
      counter += 1
      print "." if counter%100 == 0
    end

    puts pluralize(counter, "record") + " imported in #{model.to_s}"

  end

  import_in_model(Host, :name, :address)
  import_in_model(Room, :host_id, :capacity)
  import_in_model(Booking, :room_id, :start_date, :end_date, :number_of_guests)

end