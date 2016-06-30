module Intercooler
  if ENV["GEM_VERSION"].nil?
     VERSION = "0.1.0"
  else
     VERSION = ENV["GEM_VERSION"]
  end
end
