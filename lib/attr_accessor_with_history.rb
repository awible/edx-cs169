class Class
  def attr_accessor_with_history(*attr_names)
	attr_reader *attr_names
    
	attr_names.each do |attr_name|
	  define_method :"#{attr_name}=" do |v|
        if instance_variable_get(:@history) == nil 
		  instance_variable_set(:@history, Array.new() << nil)
		else 
		  #instance_eval(:@history.to_s) << instance_eval("#{attr_name}")
		  instance_eval("#{:@history}") << instance_eval("#{attr_name}")
		end
	    instance_variable_set(:"@#{attr_name}", v)
	  end
	  define_method(:"#{attr_name}_history") { instance_variable_get(:@history)}
	end
  end
end
