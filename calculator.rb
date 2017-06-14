require 'test/unit'

class Calculator

  def run(expression)
    tree = build_expression_tree(expression)
    return tree if tree.is_a?(Fixnum)
    tree.evaluate
  end


  def build_expression_tree(expression)
    left, operator, right = find_lowest_priority_operator(expression)
    if operator
      return TreeNode.new(build_expression_tree(left), operator, build_expression_tree(right))
    else
      return expression.to_i
    end
  end

  class TreeNode
    attr_accessor :left, :operator, :right

    def initialize(left, operator, right)
      @left, @operator, @right = left, operator, right
    end
    
    def evaluate
      evaluate_subnode(left) + operator_sign * evaluate_subnode(right)
    end

    def evaluate_subnode(node)
      case node
      when Fixnum
        node
      when TreeNode
        node.evaluate
      end
    end

    def operator_sign
      operator == '-' ? -1 : 1
    end
  end

  def cleanup_outer_brackets(expression)
    if expression[0] == '(' && expression[expression.size - 1] == ')'
      cleanup_outer_brackets(expression[1..expression.size-2])
    else
      expression
    end
  end

  def find_lowest_priority_operator(expression)
    bracket_count = 0
    expression = cleanup_outer_brackets(expression)
    expression.chars.to_a.reverse.each_with_index do |char, index|
      index = expression.size - 1 - index
      case char
      when '+', '-'
        if bracket_count == 0
          left =  index > 0 ? expression[0..index-1] : "0"
          right = index < expression.size - 1 ? expression[index+1..expression.size - 1] : "0"
          return [left, char, right]
        end
      when '('
        bracket_count += 1
      when ')'
        bracket_count -= 1
      end
    end
    return nil
  end

end


class CalculatorTest < Test::Unit::TestCase
  def test
    c = Calculator.new
    assert_equal ['1', '+', '1'], c.find_lowest_priority_operator('1+1')
    assert_equal ['-1', '+', '2'], c.find_lowest_priority_operator('-1+2')
    assert_equal ['123', '+', '135'], c.find_lowest_priority_operator('123+135')
    assert_equal ['1', '+', '1'], c.find_lowest_priority_operator('(1+1)')
    assert_equal ['0', '-', '1'], c.find_lowest_priority_operator('-1')
    assert_equal ['1', '+', '0'], c.find_lowest_priority_operator('1+')
    assert_equal ['1', '-', '0'], c.find_lowest_priority_operator('1-')
    assert_equal ['(2-(-3+4))', '+', '1'], c.find_lowest_priority_operator('(2-(-3+4))+1')
  end

  def test_run
    assert_run(2, "1+1")
    assert_run(29, "12+17")
    assert_run(-1, "3-4")
    assert_run(1, "-3+4")
    assert_run(2, "(2-(-3+4))+1")
    assert_run(0, "1-7+6")
  end

  def assert_run(r, x)
    assert_equal(r, Calculator.new.run(x))
  end
end
