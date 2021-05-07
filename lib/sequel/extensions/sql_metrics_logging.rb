# frozen-string-literal: true

module Sequel::SqlMetricsLogging
  # Include SQL metrics when logging query.
  def log_connection_yield(sql, conn, args=nil)
    unless @loggers.empty?
      sql = "(#{sql.length}) #{sql}"
    end
    super
  end
end

Sequel::Database.register_extension(:sql_metrics_logging, Sequel::SqlMetricsLogging)
