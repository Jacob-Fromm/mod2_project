require "pry"

module NPS
    class Base
        attr_accessor :errors

        def initialize(args = {})
            args.each do |name, value|
                attr_name = name.to_s.underscore
                if respond_to?("#{attr_name}")
                    send ("#{attr_name}=, #{value}")
                end
            end
        end
    end
end
