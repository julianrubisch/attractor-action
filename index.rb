command = "attractor report --ci"
command += " --file-prefix #{ENV['INPUT_FILE_PREFIX']}" unless ENV['INPUT_FILE_PREFIX']&.empty?
command += " -t js" if ENV['INPUT_JAVASCRIPT'] == 'true'

puts ENV['INPUT_FILE_PREFIX']
puts command

system("#{command}")
