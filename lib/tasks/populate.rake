def venue(name)
  Venue.create(:name => name)
end

def talks(venue, starts_at, ends_at, length=30.minutes)
  while starts_at < ends_at do
    venue.talks.create(:starts_at => starts_at, :ends_at => starts_at + length)
    starts_at = starts_at + length
  end
end

def topic(name, starts_at)
  Talk.find_all_by_starts_at(starts_at).each do |venue|
    venue.update_attributes(:topic => name)
  end
end

namespace :populate do
  desc "Populate the database with venues"
  task '2009' => :environment do
    date = Date.new(2009, 4, 18)

    slingapours = venue("Slingapour's")
    one_eyed_jacks = venue("One Eyed Jacks")
    gibson_showroom = venue("Gibson Showroom")

    talks(slingapours, date + 9.hours, date + 13.hours)
    talks(slingapours, date + 13.hours, date + 14.hours, 1.hour)
    talks(slingapours, date + 14.hours, date + 16.hours)
    talks(slingapours, date + 16.hours, date + 18.hours, 10.minutes)

    [one_eyed_jacks, gibson_showroom].each do |venue|
      talks(venue, date + 9.hours + 30.minutes, date + 13.hours)
      talks(venue, date + 13.hours, date + 14.hours, 1.hour)
      talks(venue, date + 14.hours, date + 18.hours)
    end

    topic("Registration", date + 9.hours)
    topic("Lunch at The Globe", date + 13.hours)
  end
end

__END__
April 18, 2009
--------------

Slingapour's
  09:00	Registration
  09:30
  10:00
  10:30
  11:00
  11:30
  12:00
  12:30
  13:00	Lunch at The Globe
  14:00
  14:30
  15:00
  15:30
  16:00
  16:05
  16:10
  16:15
  16:20
  16:25
  16:30
  16:35
  16:40
  16:45
  16:50
  16:55
  17:00
  17:05
  17:10
  17:15
  17:20
  17:25
  17:30
  17:35
  17:40
  17:45
  17:50
  17:55

One Eyes Jack's
  09:30
  10:00
  10:30
  11:00
  11:30
  12:00
  12:30
  13:00	Lunch at The Globe
  14:00
  14:30
  15:00
  15:30
  16:00
  16:30
  17:00
  17:30

Gibson Showroom
  09:30
  10:00
  10:30
  11:00
  11:30
  12:00
  12:30
  13:00	Lunch at The Globe
  14:00
  14:30
  15:00
  15:30
  16:00
  16:30
  17:00
  17:30
