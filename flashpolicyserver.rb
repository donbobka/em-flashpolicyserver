#!/usr/bin/env ruby

require 'bundler/setup'
Bundler.require(:default)

module FlashPolicy
  def cross_domain_xml
    @cross_domain_xml ||= open('./crossdomain.xml').read
  end

  def post_init
    send_data cross_domain_xml
    close_connection_after_writing
  end
end

EM.run {
  EventMachine::start_server '0.0.0.0', 843, FlashPolicy
}
