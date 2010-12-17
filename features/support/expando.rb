class Expando
  def method_missing(m, *args, &block)
    m = m.to_s.sub '=', ''
    create_attr(m)
    instance_variable_set "@#{m}", args[0]
  end

  private

  def create_method( name, &block )
    self.class.send( :define_method, name, &block )
  end

  def create_attr( name )
    create_method( "#{name}=".to_sym ) { |val|
      instance_variable_set( "@" + name, val)
    }

    create_method( name.to_sym ) {
      instance_variable_get( "@" + name )
    }
  end
end