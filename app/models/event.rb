class Event
  include Mongoid::Document
  field :o, as: :order, type: Integer
  field :n, as: :name, type: String
  field :d, as: :distance, type: Float
  field :u, as: :units, type: String

  embedded_in :parent, polymorphic: true, touch: true

  validates :order, :name, presence: true

  def meters
  	case units
  	when "meters" || "meter" then distance
  	when "kilometers" || "kilometer" then distance * 1000
  	when "yards" || "yard" then distance * 0.9144
  	when "miles" || "mile" then distance * 1609.344
  	when nil then  nil
  	end
  end

  def miles
  	case units
  	when "meters" || "meter" then distance * 0.000621371
  	when "kilometers" || "kilometer" then distance * 0.621371
  	when "yards" || "yard" then distance * 0.000568182
  	when "miles" || "mile" then distance 
  	when nil then nil
  	end
  end

end
