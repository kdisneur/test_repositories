class String
  def camelize
    return self if self !~ /_/ && self =~ /[A-Z]+.*/
    split('_').map(&:capitalize).join
  end
end
