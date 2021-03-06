module AttributeHashHelper
  def to_hash
    hash = {}; 
    self.instance_variables.each { |k|
      hash[k.to_s.delete "@"] = instance_variable_get(k)
    }
    return hash
  end
end
