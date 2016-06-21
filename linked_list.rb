class Node
	attr_accessor :value, :next_node

	def initialize(value)
		@value = value
		@next_node = nil
	end
end

class LinkedList

	def initialize
		@head = nil
		@tail = nil
	end

	def append(data)
		node = Node.new(data)
		if @head.nil?
			@head = node
			@tail = node
		else
			pos = @head
			until pos.next_node.nil?
				pos = pos.next_node
			end
			pos.next_node = node
			@tail = node
		end
	end

	def prepend(data)
		node = Node.new(data)
		if @head.nil?
			@head = node
			@tail = node
		else
			node.next_node = @head
			@head = node
		end
	end

	def size
		if @head.nil?
			return 0
		else
			c = 1
			pos = @head
			until pos.next_node.nil?
				pos = pos.next_node
				c += 1
			end
			return c
		end
	end

	def head
		@head.nil? ? nil : @head.value
	end

	def tail
		@tail.nil? ? nil : @tail.value
	end

	def at(index)
		c = 0
		pos = @head
		until c == index
			c += 1
			pos = pos.next_node
		end		
		return pos.value
	end

	def pop
		pos = @head
		until pos.next_node.next_node.nil?
			pos = pos.next_node
		end
		@tail = pos
		@tail.next_node = nil

	end

	def contains?(data)
		pos = @head
		until pos.nil?
			return true if pos.value == data
			pos = pos.next_node
		end
		return false
	end

	def find(data)
		pos = @head
		c = 0
		until pos.nil?
			return c if pos.value == data
			pos = pos.next_node
			c += 1
		end
		return nil
	end

	def to_s
		str = ""
		pos = @head
		until pos.nil?
			str << "(#{pos.value}) -> "
			pos = pos.next_node
		end
		str << "nil"
	end

	def insert_at(index, data)
		node = Node.new(data)
		pos = @head
		c = 0
		until c == index-1
			return "Out of Range" if pos.next_node.nil?
			pos = pos.next_node
			c += 1
		end
		pos.next_node, node.next_node = node, pos.next_node
	end

	def remove_at(index)
		pos = @head
		c = 0
		until c == index-1
			return "Out of Range" if pos.next_node.nil?
			pos = pos.next_node
			c += 1
		end
		pos.next_node = pos.next_node.next_node
	end
end

list = LinkedList.new

#list.append("holola")
#list.append("yolola")
#list.prepend("kolola")
#puts list.size
#puts list.head
#puts list.tail
#puts list.at(1)
#list.insert_at(1, "polola")
#list.insert_at(1, "cholola")
#puts list.contains?("holola")
#puts list.contains?("lolola")
#p list.find("polola")
#puts list.to_s
#list.remove_at(2)
#puts list.to_s