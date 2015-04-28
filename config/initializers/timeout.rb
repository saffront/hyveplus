Rack::Timeout.timeout = 20
Rack::Timeout.unregister_state_change_observer(:logger)
