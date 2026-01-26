# Module#module_functions

# 20100101
# 0.1.0

# Description: Set multiple module functions at a go.  

# History: Taken from my attempt at an OS-independent groups command called, not surprisingly, groups 0.0.0.  

# Changes since 0.0:
# 1. Removed :all as an argument.  Now instead is nil to make all instance methods for a module a module function.  In that way there's no potential clash for an instance method called #all.  

class Module
  
  def module_functions(*args)
    if args == []
      instance_methods.each{|m| module_function m}
    else
      args.each{|m| module_function m}
    end
  end
  
end

if __FILE__ == $0
  
  module A
    def a; puts 'A::a'; end
    module_functions :a
  end
  
  module B
    def b; puts 'B::b'; end
    module_functions
  end
  
  module C
    def c; puts 'C::c'; end
  end
  
  A.a
  B.b
  C.c
end
