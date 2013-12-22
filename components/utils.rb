require 'json'

class DataContract
  def initialize(params)    
    params.each do |k,v|
      setter = "#{k.to_s}=".to_sym
      getter = "#{k.to_s}".to_sym
      if self.respond_to? setter
        self.send(setter, v)
      elsif self.respond_to? getter
        var = "@#{k.to_s}".to_sym
        instance_variable_set(var, v)
      end
    end
  end

  def to_json(*args)
    JSON.generate(to_hash, *args)
  end

  def to_hash
    hsh = {}
    self.instance_variables.each do |field|
      value = instance_variable_get(field)
      hsh[field.to_s.sub("@", "")] = value if value
    end
    hsh
  end
end