# frozen_string_literal: true

require 'stringio'

require 'test_helper'

class PrometheusExporterDefaultLogger < Minitest::Test
  def test_logs_error_to_stderr
    error_msg = 'error!'
    log_stream = StringIO.new

    PrometheusExporter::DefaultLogger.stub_const(:STDERR, log_stream) do
      logger = PrometheusExporter::DefaultLogger.instance

      logger.error(error_msg)
    end

    assert_match error_msg, log_stream.string
  end
end
