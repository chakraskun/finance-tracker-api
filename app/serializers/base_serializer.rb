# frozen_string_literal: true

class BaseSerializer
  include JSONAPI::Serializer
  extend DateHelper

  def attributes
    return @attributes if @attributes.present?

    data = self.serializable_hash
      .dig(:data)

    if data.is_a?(Array)
      return @attributes = data.map{|x|x.dig(:attributes)}
    end

    @attributes = data.dig(:attributes)
  end

  def presence_attributes
    return @presence_attributes if @presence_attributes.present?

    if attributes.is_a?(Array)
      return @presence_attributes = attributes
    end

    @presence_attributes = attributes.filter do |k,v|
      v.present?
    end
  end
end