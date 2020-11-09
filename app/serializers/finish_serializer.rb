class FinishSerializer
  include FastJsonapi::ObjectSerializer
  # attributes :summary, :temperature, :current, 
  attributes :id, :start_point, :forecast, :trails
end
