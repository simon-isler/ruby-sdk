=begin
The wallee API allows an easy interaction with the wallee web service.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

require 'date'

module Wallee
  # 
  class LineItemReductionCreate
    # The unique id identifies the line item on which the reduction is applied on.
    attr_accessor :line_item_unique_id

    # 
    attr_accessor :quantity_reduction

    # 
    attr_accessor :unit_price_reduction

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'line_item_unique_id' => :'lineItemUniqueId',
        :'quantity_reduction' => :'quantityReduction',
        :'unit_price_reduction' => :'unitPriceReduction'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'line_item_unique_id' => :'String',
        :'quantity_reduction' => :'Float',
        :'unit_price_reduction' => :'Float'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'lineItemUniqueId')
        self.line_item_unique_id = attributes[:'lineItemUniqueId']
      end

      if attributes.has_key?(:'quantityReduction')
        self.quantity_reduction = attributes[:'quantityReduction']
      end

      if attributes.has_key?(:'unitPriceReduction')
        self.unit_price_reduction = attributes[:'unitPriceReduction']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @line_item_unique_id.nil?
        invalid_properties.push('invalid value for "line_item_unique_id", line_item_unique_id cannot be nil.')
      end

      if @line_item_unique_id.to_s.length > 200
        invalid_properties.push('invalid value for "line_item_unique_id", the character length must be smaller than or equal to 200.')
      end

      if @quantity_reduction.nil?
        invalid_properties.push('invalid value for "quantity_reduction", quantity_reduction cannot be nil.')
      end

      if @unit_price_reduction.nil?
        invalid_properties.push('invalid value for "unit_price_reduction", unit_price_reduction cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @line_item_unique_id.nil?
      return false if @line_item_unique_id.to_s.length > 200
      return false if @quantity_reduction.nil?
      return false if @unit_price_reduction.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] line_item_unique_id Value to be assigned
    def line_item_unique_id=(line_item_unique_id)
      if line_item_unique_id.nil?
        fail ArgumentError, 'line_item_unique_id cannot be nil'
      end

      if line_item_unique_id.to_s.length > 200
        fail ArgumentError, 'invalid value for "line_item_unique_id", the character length must be smaller than or equal to 200.'
      end

      @line_item_unique_id = line_item_unique_id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          line_item_unique_id == o.line_item_unique_id &&
          quantity_reduction == o.quantity_reduction &&
          unit_price_reduction == o.unit_price_reduction
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [line_item_unique_id, quantity_reduction, unit_price_reduction].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = Wallee.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end
end
