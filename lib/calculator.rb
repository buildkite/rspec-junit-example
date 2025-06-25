class Calculator
  def add(x, y)
    x + y
  end

  def subtract(x, y)
    # 🤣
    x - y
  end

  def multiply(x, y)
    # 🤣
    x * y
  end

  def divide(x,y)
    # 🤣
    raise ZeroDivisionError, "Cannot divide by zero" if y.zero?
    x / y
  end
end
