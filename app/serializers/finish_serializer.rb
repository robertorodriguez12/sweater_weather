class FinishSerializer
  include FastJsonapi::ObjectSerializer
  # attributes :summary, :temperature, :current, 
  attributes :id, :trails, :forecast
end
