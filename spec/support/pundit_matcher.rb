# permit matcher from shoulda-matcher (which should really be limited to controller specs) clashing with permit matcher here 
# Renamed matcher to :authorise
# See https://github.com/elabs/pundit/issues/258
RSpec::Matchers.define :authorise do |action|
  match do |policy|
    policy.public_send("#{action}?")
  end

  failure_message do |policy|
    "#{policy.class} does not permit #{action} on #{policy.record} for #{policy.user.inspect}."
  end

  failure_message_when_negated do |policy|
    "#{policy.class} does not forbid #{action} on #{policy.record} for #{policy.user.inspect}."
  end
end
