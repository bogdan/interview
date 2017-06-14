
class Node
  attr_accessor :children
  attr_accessor :text
  attr_accessor :parent
  attr_accessor :depth

  def initialize(attributes)
    attributes.each do |k,v|
      send("#{k}=", v)
    end
    self.children = []
  end
end
class RootNode < Node

end



class TextNode < Node


end

class HtmlNode < Node

end


def parse(source)
  tree = build_tree(source)
  format(tree)
end

def format(tree)
  case tree
  when RootNode
    format_children(tree)
  when TextNode
    tree.text
  when HtmlNode
    "<#{tree.text}>\n#{format_children(tree)}\n</#{tree.text}>"
  end
end

def format_children(tree)
  tree.children.map{|c| format(c)}.join("\n")
end

def build_tree(source)
  lines = source.split("\n").reject(&:empty?)
  root_node = tree = RootNode.new(:parent => nil, :depth => -1, :text => nil)
  lines.each do |current_line|
    current_line_depth = get_line_depth(current_line)
    current_line = current_line.strip
    while (tree.depth > current_line_depth - 1) # 0 
      tree = tree.parent
    end
    
    node = if current_line.lstrip[0] == "%"
             HtmlNode.new(:parent => tree, :text => current_line[1..current_line.size-1], :depth => current_line_depth)
           else
             TextNode.new(:parent => tree, :text => current_line, :depth => current_line_depth)
           end
    tree.children << node
    tree = node
  end
  root_node
end

def get_line_depth(line)
  (line.size - line.lstrip.size) / 2
end


html = <<H
Hello world
%strong    
  zz       
%table     
  %tr      
    %th    
      Hello
  %tr      
    %td    
      ZZ   
H

puts parse(html)



# 0   Hello world
# 0   %strong
# 1     zz
# 0   %table
# 1     %tr
# 2       %th
# 3         Hello
# 1     %tr
# 2       %td
# 3         ZZ
