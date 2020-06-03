# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "prometheus_exporter"

require "minitest/autorun"

class Minitest::Test
  def before_setup
    super

    PrometheusExporter.logger = nil
  end
end

class TestHelper
  def self.wait_for(time, &blk)
    (time / 0.001).to_i.times do
      return true if blk.call
      sleep 0.001
    end
    false
  end
end
