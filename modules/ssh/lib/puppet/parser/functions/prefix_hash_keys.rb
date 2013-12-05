module Puppet::Parser::Functions
  newfunction(:prefix_hash_keys, :type => :rvalue) do |arguments|
    if arguments.size < 1
      raise Puppet::ParseError,
        "prefix_hash_keys(): Wrong number of arguments given (#{arguments.size} for 1)"
    end

    hash = arguments[0]

    unless hash.is_a?(Hash)
      raise Puppet::ParseError,
        "prefix_hash_keys(): expected first argument to be an Hash, got #{hash.inspect}"
    end

    prefix = arguments[1] if arguments[1]

    if prefix
      unless prefix.is_a?(String)
        raise Puppet::ParseError,
          "prefix_hash_keys(): expected second argument to be a String, got #{prefix.inspect}"
      end
    end

    result = {}

    hash.each { |k, v| result["#{prefix}#{k}"] = v }

    return result
  end
end
