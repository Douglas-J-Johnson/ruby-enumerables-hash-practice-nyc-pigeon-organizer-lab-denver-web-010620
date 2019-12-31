require 'pp'

def find_name_in_hash_array(hash_array, name)
  hash  = {}

  for i in 0...hash_array.length
    hash = hash_array[i]
    hash.each do |k, v|
      if k == name then
        return i
      end
    end
  end

  return nil
end

def condense_pairs(hash_array)
  pp hash_array

  condensed_hash_array = []
  condensed_index = 0

  name = ""
  value = ""

  hash_array.each do |hash|
    hash.each do |k, v|
      name = k
      value = v
    end

    puts name

    if find_name_in_hash_array(condensed_hash_array,name)
      condensed_index = find_name_in_hash_array(condensed_hash_array,name)
      puts condensed_index
    #  condensed_hash_array[condensed_index][name].push(value)
    else
      puts "new"
      condensed_hash_array.push(hash)
    end
  end

  pp condensed_hash_array
  return condensed_hash_array
end

def break_out_pairs(hash_pairs)
  #INPUT:  hash of {"" => ["", ...]} or {:symbol => ["", ...]}
  #RETURN:
  #pp hash_pairs

  expanded_hash_pairs = []
  expanded_index = 0

  hash_pairs.each do |pair_key, pair_value|
    for i in 0...pair_value.length
      expanded_hash_pairs[expanded_index] = {pair_value[i] => pair_key.to_s}
      expanded_index = expanded_index + 1
    end
  end

  #pp expanded_hash_pairs
  return expanded_hash_pairs
end

def get_names(data)
  names = []

  data[:color]
  data[:gender]
  data[:lives]

  return names
end

def get_colors(data)
  data_colors = data[:color]
  colors = break_out_pairs(data_colors)
  colors = condense_pairs(colors)

  return colors
end

def get_genders(data)
  data_genders = data[:gender]
  genders = break_out_pairs(data_genders)
  genders = condense_pairs(genders)

  return genders
end

def get_lives(data)
  data_lives = data[:lives]
  lives = break_out_pairs(data_lives)
  lives = condense_pairs(lives)

  return lives
end

def nyc_pigeon_organizer(data)
  #pp data
  pigeon_list = {}
  pigeon_names = {}
  pigeon_colors = get_colors(data)
  #pegeon_genders = get_genders(data)
  #pigeon_locations = get_lives(data)

  #pp pigeon_list
  return pigeon_list
end
