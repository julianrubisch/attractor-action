command = "attractor report --ci"
command += " --file_prefix #{ENV['INPUT_FILE_PREFIX']}" unless ENV['INPUT_FILE_PREFIX']&.empty?
command += " -t js" unless ENV['INPUT_JAVASCRIPT']&.empty?

system("git log")
system("#{command}")
