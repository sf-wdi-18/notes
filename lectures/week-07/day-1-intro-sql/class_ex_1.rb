require('pg')


class Product

  @@conn = PG.connect(dbname: "practice")

  # A class method
  def self.all
    @@conn.exec("SELECT * FROM products") do |res|
      return res.map do |row|
        Product.new(row)
      end
    end
  end

  def self.find(id)
    @@conn.exec("SELECT * FROM products WHERE products.id=$1", [id]) do |res|
      return Product.new(res[0])
    end
  end
  
  # similar to find
  def self.find_by_name(name)
    # use the name instead
  end
  
  attr_accessor :id, :name, :price, :quantity

  def initialize(args)
    @id = args["id"]
    @name = args["name"]
    @price = args["price"]
    @quantity = args["quantity"]
  end

  def save
    #implement save
  end

  # args is a hash of params
  def update_attrs(args)
    # hint do something like 
    # what's in initialize
    # then call save
  end

  # implement destroy
  def destroy
    # should remove the instance
    # from the database
  end

end

Product.all
p Product.find(5).update_attr("name", "stuff")

