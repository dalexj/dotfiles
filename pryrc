if defined?(Devise) && defined?(Devise::Models) && defined?(Devise::Models::Authenticatable)
  module Devise::Models::Authenticatable
    def pretty_print(pp)
      pp.object_address_group(self) do
        if defined?(@attributes) && @attributes
          columns = serializable_hash.select { |column_name, column_value| has_attribute?(column_name) || new_record? }
          pp.seplist(columns, proc { pp.text ',' }) do |column_name, column_value|
            column_value = read_attribute(column_name)
            pp.breakable ' '
            pp.group(1) do
              pp.text column_name
              pp.text ':'
              pp.breakable
              pp.pp column_value
            end
          end
        else
          pp.breakable ' '
          pp.text 'not initialized'
        end
      end
    end
  end
end
