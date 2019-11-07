class CustomFormatter < ActiveSupport::Logger::Formatter
  def call(severity, time, progname, msg)
    "[SL]:#{severity} " +  " [MSG]: #{msg}"
  end
end
