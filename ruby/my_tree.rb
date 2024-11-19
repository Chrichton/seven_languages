# https://upstackhq.com/blog/software-development/ruby-pattern-matching

class Tree
  attr_accessor :children, :node_name

  def initialize(hash, name = 'root')
    @node_name = name 
    @children = hash.keys.map do 
      |child_name| 
      puts "childname: #{child_name}, children: #{hash[child_name]}"
      Tree.new(hash[child_name], child_name)
    end

    # hash.keys => [String => root_key] # pattern matching
   
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block) 
    block.call self
  end 
end

ruby_tree = Tree.new(
  {'grandpa' => 
    { 'dad' => {'child 1' => {}, 'child 2' => {} }, 
      'uncle' => {'child 3' => {}, 'child 4' => {} } 
    }    
  })

puts "ruby_tree.node_name: #{ruby_tree.node_name}"
puts "ruby_tree.children: #{ruby_tree.children}"

puts "Visiting a node"
  ruby_tree.visit {|node| puts "root: #{node.node_name}"}

  ruby_tree.visit do
    |node| puts "root children:";
    node.children.each{|child| puts child.node_name}
  end

  ruby_tree.visit do |node| puts "root children children:";
    node.children.each do
      |child| child.children.each {|child_child| puts child_child.node_name}
    end
  end
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
