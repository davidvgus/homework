#repeat.rb

require "optparse"

options = {}

opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage:  repeat -i TIME_IN_SECONDS_BETWEEN_REPS -c COMMAND [-d DURATION] [-r NUM_OF_REPETITIONS]"
  opt.separator ""
  opt.separator "    -r and -d are mutually exclusive."
  opt.separator ""


  opt.on("-c","--command COMMAND","What command to run?") do |command|
    options[:command] = command
  end

  opt.on("-d","--duration [DURATION]", Integer, "How long to repeat the command in seconds.") do  |duration|
    options[:duration] = duration
  end

  opt.on("-r","--repetitions [REPETITIONS]", Integer, "Number of times to repeat COMMAND") do  |repetitions|
    options[:repetitions] = repetitions
  end

  opt.on("-i","--interval  SECONDS", Integer, "COMMAND will repeat every -s INTEGER seconds.") do |interval|
    options[:interval] = interval
  end

  opt.on("-h","--help","help") do
    puts opt_parser
  end
end

def execute_command_n_times(command, interval = 1, repetitions = 1)
  repetitions.times do
    puts `#{command}`
    sleep interval
  end
end

def execute_command_for(command, interval = 1, duration = 5)
  countdown = duration
  while countdown > 0
    puts `#{command}`
    sleep interval
    countdown -= interval
  end
end


if __FILE__ == $0 then
  opt_parser.parse!

  puts options

  begin
    raise StandardError, "Options -r and -d are mutually exclusive." if options[:duration] && options[:repetitions]
    raise StandardError, "Either -r or -d are required." unless options[:duration] || options[:repetitions]

    # Is the program running in repetition or duration mode?
    mode = options[:duration] ? :duration : :repetitions


    case mode
      when :repetitions
        execute_command_n_times(options[:command], options[:interval], options[:repetitions])
      when :duration
        execute_command_for(options[:command], options[:interval], options[:duration])
      else
        raise StandardError, "Either -r or -d are required." unless options[:duration] || options[:repetitions]
    end
  rescue StandardError => e
    puts e
    puts e.backtrace
  end
end