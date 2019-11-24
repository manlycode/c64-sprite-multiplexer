symbol_file_name = "test.sym"
breakpointdef_file_name = "breakpointdef.txt"
breakpoints_output_file = "breakpoints.txt"

symbols = {}

File.open( symbol_file_name ).each do |line|
  _, address, label = line.split(" ")
  clean_label = label.gsub(".", "")
  symbols[clean_label] = {
    address: address.to_i(16),
    byteCount: 0
  }
end

brk_defs = []
File.open( breakpointdef_file_name).each do |line|
  command, label = line.split(" ")
  clean_label = label.gsub(".", "")

  brk_defs << [command, symbols[clean_label][:address]]
end

File.open(breakpoints_output_file, "w") do |file|
  brk_defs.each do |cmd, addr|
    file.write "#{cmd} #{sprintf("%04X", addr)}\n"
  end
end
