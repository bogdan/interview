

#%html
  #%h1
    #Hello
  #%p
    #%strong
      #lorem ipsum
    #%br
    #dolor et

class Generator

  class Node
    attr_accessor :level

    def shift
      "  " * level
    end

    def line_break
      "\n"
    end
  end

  class Tag < Node

    attr_accessor :name, :children, :level

    def initialize(name, level = 0, &block)
      @name = name
      @level = level
      @children = []
      instance_eval(&block) if block
    end

    def to_html
      if children.any?
        [
          shift + open_tag + line_break,
          children.map(&:to_html),
          shift + close_tag + line_break,
        ].join
      else
        shift + open_tag + close_tag + line_break
      end
    end

    def open_tag
      "<#{name}>"
    end

    def close_tag
      "</#{name}>"
    end

    def tag(name, &block)
      @children << Tag.new(name, level + 1, &block)
    end

    def text(string)
      @children << Text.new(string, level + 1)
    end

    def change(*names, &block)
      if names.empty?
        @children = []
        instance_eval(&block)
        return true
      else
        return @children.any? do |child|
          if child.is_a?(Tag) && child.name == names.first
            child.change(*names[1..-1], &block)
          end
        end
      end
    end
  end

  class Text < Node
    attr_accessor :string

    def initialize(string, level = 0)
      @string = string
      @level = level
    end

    def to_html
      shift + string + line_break
    end
  end

  def self.html(&block)
    run(&block).to_html
  end

  def self.run(&block)
    Tag.new('html', &block)
  end

end

require 'test/unit'

class GeneratorTest < Test::Unit::TestCase
  def test_generate_single_tag

    result =  Generator.html do
      tag(:h1) do
        text("hello")
      end
    end
    assert_equal <<HTML, result
<html>
  <h1>
    hello
  </h1>
</html>
HTML
  end

  def test_change
    result = Generator.run do
      tag(:h1) { text "hello1" }
      tag(:h2) { text "hello2" }
    end
    result.change(:h1) do
      tag(:strong) do
        text("zz")
      end
    end
    assert_equal <<HTML, result.to_html
<html>
  <h1>
    <strong>
      zz
    </strong>
  </h1>
  <h2>
    hello2
  </h2>
</html>
HTML
  end

  def test_generate
    result =  Generator.html do
      tag(:h1) do
        text("hello")
      end
      tag(:p) do
        tag(:strong) do
          text("lorem ipsum")
        end
        tag(:br)
        text("dolor et")
      end
    end
    assert_equal <<HTML, result
<html>
  <h1>
    hello
  </h1>
  <p>
    <strong>
      lorem ipsum
    </strong>
    <br></br>
    dolor et
  </p>
</html>
HTML
  end
end
