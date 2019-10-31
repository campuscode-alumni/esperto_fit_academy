class CustomFormatter < ActiveSupport::Logger::Formatter
  def call(severity, time, progname, msg)
    info =  msg.split(" ")
    request_id = info.slice!(0)
    "[REQUEST_ID]  : #{request_id}\n" +
    "[LEVEL] :  #{severity}\n" +
    "[DATA]  : #{time}\n" +
    "[MENSAGEM]  : #{info}\n\n\n"
  end
end