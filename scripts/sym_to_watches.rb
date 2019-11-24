symbol_file_name = "test.sym"
watchdef_file_name = "watchdef.txt"
watches_output_file = "watches.txt"

symbols = {}

File.open( symbol_file_name ).each do |line|
  _, address, label = line.split(" ")
  clean_label = label.gsub(".", "")
  symbols[clean_label] = {
    address: address.to_i(16),
    byteCount: 0
  }
end

File.open( watchdef_file_name).each do |line|
  label, size = line.split(" ")
  size ||= 1
  clean_label = label.gsub(".", "")

  symbols[clean_label][:byteCount] = size.to_i
end

filtered_hash = {}

symbols.each_pair do |key, value|
  if value[:byteCount] > 0
    filtered_hash[key]  = value
  end
end

expanded_hash = {}

filtered_hash.each_pair do |key, value|
  address, byte_count = value.values
  expanded_hash[key] = address
  idx = 1
  idx.upto(byte_count-1) do |offset|
    new_key = key+"-#{offset}"
    expanded_hash[new_key] = address+offset
  end
end

File.open(watches_output_file, "w") do |file|
  expanded_hash.each do |key, value|
    file.write "#{sprintf("%04X", value)} #{key}\n"
  end
end
