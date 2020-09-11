class ProcessorConfig
    TRUTHY_VALUES = %w(t true yes y 1).freeze
    FALSEY_VALUES = %w(f false n no 0).freeze

    attr_accessor :organisation
    attr_accessor :credentials
    attr_accessor :projects
    attr_accessor :repos
    attr_accessor :createBugsIfMissing

    def initialize()
        @organisation = ENV['organisation']
        @credentials = [
            {
                "type" => "git_source",
                "host" => "dev.azure.com",
                "username" => "x-access-token",
                "password" => ENV['credentials']
            }
        ]
        @projects = (ENV['projects'] || "").split(",")
        @repos = (ENV['repos'] || "").split(",")
        @createBugsIfMissing = to_boolean(ENV['createBugsIfMissing']) || false
    end

    def to_boolean(arg)
        return true if TRUTHY_VALUES.include?(arg.to_s)
        return false if FALSEY_VALUES.include?(arg.to_s)
        # You can even raise an exception if there's an invalid value
        raise "Invalid value '#{arg}' for boolean casting"
    end
end