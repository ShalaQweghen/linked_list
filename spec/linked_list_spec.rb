require_relative "../linked_list.rb"

describe Node do

	before do
		@node = Node.new(23)
	end

	describe "#initialize" do
		it "responds to #value" do
			expect(@node.value).to eql(23)
		end

		it "responds to #next_node" do
			expect(@node.next_node).to eql(nil)
		end
	end
end

describe LinkedList do

	context "list without data" do
		before do
			@list = LinkedList.new
		end

		describe "#head" do
			it "gives the value of the head of the list" do
				expect(@list.head).to eql(nil)
			end
		end

		describe "#tail" do
			it "gives the value of the tail of the list" do
				expect(@list.tail).to eql(nil)
			end
		end

		describe "#append" do
			it "adds a new data at the end of the list" do
				@list.append("house")
				expect(@list.tail).to eql("house")
			end
		end

		describe "#prepend" do
			it "adds a new data at the beginning of the list" do
				@list.prepend("room")
				expect(@list.head).to eql("room")
			end
		end

		describe "#size" do
			it "returns 0" do
				expect(@list.size).to eql(0)
			end
		end
	end

	context "list with data" do

		before do
			@list = LinkedList.new
			@list.append("house")
			@list.append("room")
			@list.append("door")
		end

		describe "#head" do
			it "gives the value of the head of the list" do
				expect(@list.head).to eql("house")
			end
		end

		describe "#tail" do
			it "gives the value of the tail of the list" do
				expect(@list.tail).to eql("door")
			end
		end

		describe "#size" do
			it "gives how many data there is in the list" do
				expect(@list.size).to eql(3)
			end
		end

		describe "#at" do
			it "gives the value at a specific index" do
				expect(@list.at(1)).to eql("room")
			end
		end

		describe "#pop" do
			it "deletes the data at the end of the list" do
				@list.pop
				expect(@list.tail).to eql("room")
			end
		end

		describe "#contains?" do
			context "with an existing item in the list" do
				it "returns true" do
					expect(@list.contains?("room")).to be true
				end
			end

			context "with a non-existing item" do
				it "returns false" do
					expect(@list.contains?("roof")).to be false
				end
			end
		end

		describe "#find" do
			context "with an existing item in the list" do
				it "returns the index of the item" do
					expect(@list.find("room")).to eql(1)
				end
			end

			context "with a non-existing item" do
				it "returns nil" do
					expect(@list.find("roof")).to eql(nil)
				end
			end
		end

		describe "#to_s" do
			it "returns a string of the items in the list" do
				expect(@list.to_s).to eql("(house) -> (room) -> (door) -> nil")
			end
		end

		describe "#insert_at" do
			context "within the range" do
				it "inserts the item into the specified index" do
					@list.insert_at(1, "roof")
					expect(@list.at(1)).to eql("roof")
				end
			end

			context "outside the range" do
				it "returns a string warning" do
					expect(@list.insert_at(4, "roof")).to eql("Out of Range")
				end
			end
		end

		describe "#remove_at" do
			context "within the range" do
				it "deletes the item at the specified index" do
					@list.remove_at(1)
					expect(@list.at(1)).to eql("door")
				end
			end

			context "outside the range" do
				it "gives a string warning" do
					expect(@list.remove_at(4)).to eql("Out of Range")
				end
			end
		end
	end
end