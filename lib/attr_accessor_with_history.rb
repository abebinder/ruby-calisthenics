class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      @#{attr_name}_history_array = []
      def #{attr_name}=(new_val)
        @#{attr_name} = new_val
      end
    }
  end
end
