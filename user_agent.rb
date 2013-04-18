class UserAgent

  def initialize(user_agent)
    @user_agent = user_agent.downcase
  end

  # defines methods such as webkit?, iphone?, etc.
  def method_missing(method_name, *args)
    agent_match = method_name.to_s.match(/^(\w+)\?$/)
    if agent_match
      self.class.class_eval do
        define_method(method_name, *args) do
          !!@user_agent.match(agent_match[1]) if @user_agent
        end
      end
      send method_name
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    !!method_name.to_s.match(/^\w+\?$/) || super
  end

  def to_s
    @user_agent
  end
end
