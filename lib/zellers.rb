
class Zellers
  def self.calc(month_in, day_in, year_in)
    day_of_week = ""
    year_breakdown = year_in.to_s.split(//)
    day_of_month = day_in.to_i
    month = month_in.to_i
    year_of_cent = (year_breakdown[2] + year_breakdown[3]).to_i
    century = (year_breakdown[0] + year_breakdown[1]).to_i

    if (month === 1) or (month == 2)
      month += 12
      if year_of_cent > 0
        year_of_cent -= 1
      else
        year_of_cent = 99
        century -= 1
      end
    end

    day_of_week = ( (day_of_month + ( (13 * (month + 1) ) / 5 ) + year_of_cent + (year_of_cent / 4) + (century / 4) - (2 * century)) % 7)

    return day_of_week
  end
end
