#lastmodified.rb

SECONDS_PER_DAY = 60 * 60 * 24

=begin
doctest: Test seconds_to_days with string
>> seconds_to_days("string")
=> #<ArgumentError: seconds_to_days requires Numeric.>
doctest: Test seconds_to_days with 10_000
>> seconds_to_days(87_000)
=> 1.0069444444444444
=end

def seconds_to_days(seconds)
  begin
    raise ArgumentError, "seconds_to_days requires Numeric." unless seconds.is_a?(Numeric)
    seconds / SECONDS_PER_DAY.to_f
  rescue ArgumentError => exception
    exception
  end
end

=begin
doctest: Test last_modified with fake input for "fake_current"
>> last_modified("README", Time.new(2012, 1, 25, 12,00,00))
=> "file was last modified 52.460013178206445 days ago."
doctest: Test last_modified with bad filename
>> last_modified("READMEDOESNTEXIST")
=> #<IOError: READMEDOESNTEXIST doesn't exist.>
=end

def last_modified(file_name = nil, fake_current_time_for_testing = false)
  time_now = fake_current_time_for_testing || Time.now
  begin
    if File.exists?(file_name) && File.file?(file_name)
      days = seconds_to_days(time_now - File.mtime(file_name))
      output = "file was last modified %0.15f days ago." % days

      # For testing purposes I need a return value rather than nil
      ## If I'm  not testing I need to output to the console
      fake_current_time_for_testing ? output : (puts output)
    else
      raise IOError, "#{file_name} doesn't exist."
    end
  rescue IOError => exception
    exception
  end
end

