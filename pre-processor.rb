require "csv"

puts "DispatchTime,IncidentNo,IncidentType,AlarmLevel,Area,DispatchedUnits,IncidentLoadTime,MAX(FireDispatchUpdate),Type,SubType,NumberOfTrucks"

CSV.foreach("incidents.csv", :headers => true){|row|
  types = row["IncidentType"].split("-")

  if(types)
    row << types.first.strip

    if(types.size > 1)
      row << types.last.strip
    else
      row << ""
    end
  end

  row << row['DispatchedUnits'].count(',')

  puts row.to_csv
}