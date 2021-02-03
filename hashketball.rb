require 'pry' 
require_relative '../game_hash.rb'

def num_points_scored(player_name)
  game_hash.each do |key, value|
    value[:players].each do |inner_key|
      if inner_key[:player_name] == player_name
        return inner_key[:points]
      end 
    end 
  end 
end

def shoe_size(player_name)
  game_hash.each do |key, value|
    value[:players].each do |inner_key|
      if inner_key[:player_name] == player_name
        return inner_key[:shoe]
      end 
    end 
  end 
end

def team_colors(team_name)
  game_hash.each do |key, value|
      if value[:team_name] == team_name
        return value[:colors]
    end
  end 
end

def team_names
  [
  game_hash[:home][:team_name],
  game_hash[:away][:team_name]
]
end 

def player_numbers(team_name)
  game_hash.each do |key, value|
    if value[:team_name] == team_name
      return value[:players].map {|jersey_numbers| jersey_numbers[:number]}
    end 
  end 
end 

def player_stats(player_name)
  game_hash.each do |key, value|
    value[:players].each do |inner_key|
      if inner_key[:player_name] == player_name
        return inner_key
      end 
    end 
  end 
end 

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0 
  game_hash.each do |key, value|
    value[:players].each do |inner_key|
      if inner_key[:shoe] > shoe_size
        shoe_size = inner_key[:shoe]
        rebounds = inner_key[:rebounds]
      end 
    end 
  end 
  rebounds
end 
