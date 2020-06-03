# frozen_string_literal: true

require 'test_helper'

class PrometheusExporterTest < Minitest::Test
  def teardown
    ::PrometheusExporter.logger = nil
  end

  def test_that_it_has_a_version_number
    refute_nil ::PrometheusExporter::VERSION
  end

  def test_it_can_get_hostname
    assert_equal `hostname`.strip, ::PrometheusExporter.hostname
  end

  def test_it_can_set_logger
    fake_logger = 'foo'

    ::PrometheusExporter.logger = fake_logger

    assert_equal fake_logger, ::PrometheusExporter.logger
  end

  def test_it_gets_default_logger
    assert_equal PrometheusExporter::DefaultLogger.instance, ::PrometheusExporter.logger
  end
end
