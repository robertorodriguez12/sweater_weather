class FinishSerializer
  include FastJsonapi::ObjectSerializer
  # attributes :summary, :temperature, :current, 
  attributes :id, :forecast, :trails
end
