require "arow/version"

module AROW
  class Model
    def initialize(num_features, r = 0.1)
      @num_features = num_features
      @r = r

      @means = Array.new(num_features, 0.0)
      @covariances = Array.new(num_features, 1.0)
    end

    def margin(features)
      result = 0.0

      features.each do |index, value|
        result += @means[index] * value
      end

      return result
    end

    def predict(features)
      return margin(features) > 0
    end

    def update(features, label)
      margin = margin(features)
      label_value = label ? 1 : -1;

      return false if label_value * margin >= 1

      confidence = 0.0
      features.each do |index, value|
        confidence += @covariances[index] * value * value
      end

      beta = 1.0 / (confidence + @r)
      alpha = label_value * (1.0 - label_value * margin) * beta

      features.each do |index, value|
        v = @covariances[index] * value
        @means[index] += alpha * v
        @covariances[index] -= beta * v * v
      end

      return true
    end
  end
end
