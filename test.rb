Dir[File.dirname(__FILE__).concat('/**/*.rb')].sort.each do |f|
  require f unless f == __FILE__
end
