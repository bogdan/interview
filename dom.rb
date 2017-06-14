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

result.change(:p, :strong) do
  tag(:em) do
    text("change")
  end
end

result.to_html




#Generator.html do
  #tag(:h1)
  #tag(:h2)
  #text("zz")
#end

#tag(:a) do
  #...
#end

=begin
<a>
 ...
</a>
=end

tag(:a) { tag(:strong) }

#tag :p do
  #tag :strong
  #tag :strong
#end
#tag :p do
  #tag :strong
#end
#tag :p do
  #tag :strong
#end

=begin
<p>
  <strong>
    Text
  </strong>
  faksjdfsa
</p>
=end

result.to_html

#
#%html
  #%h1
    #Hello
  #%p
    #%strong
      #lorem ipsum
    #%br
    #dolor et

class Generator
  class Tag
    attr_accessort :name, :children, :level
    def initialize(name, level = 0, &block)
      @name = name
      @level = level
      @children = []
      instance_eval(&block)
    end

    def to_html
      [
        shift + "<#{name}>",
        children.map(&:to_html),
        shift + "</#{name}>",
      ].join("\n")
    end

    def shift
      "  " * level
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
          if child.is_a?(Tag)
            child.change(names[1..-1], &block)
          end
        end
      end
    end
  end

  class Text
    attr_accessort :string

    def to_html
      string
    end
  end

  def html(&block)
    Tag.new('html', &block).to_html
  end

end
