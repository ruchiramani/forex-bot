require 'yaml'
require 'pry'

class ForexIO

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def read
    file = File.read(path)
    YAML.load(file)
  end

  def write(content)
    content = YAML.dump(content)
    File.write(path,content)
  end

end

params = ForexIO.new("params.yml")
p = params.read
p[:flag] = :stop
params.write(p)
#binding.pry
