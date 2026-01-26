# Platform.os

# 2010.05.02
# 0.1.0

require 'Module/module_functions'

module Platform
  
  def os
    RUBY_PLATFORM.split('-')[1]
  end
  
  module_functions
  
end
