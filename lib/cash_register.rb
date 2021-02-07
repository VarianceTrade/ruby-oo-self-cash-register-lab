require 'pry'


# cash_register_1 = CashRegister.new() # 
# cash_register_1.total => 400

class CashRegister
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        # [["eggs", 3.45], ["tomatos", 4.5], ["tomoatos", 4.5], ["tomoatos", 4.5]]
        #
        # [{title: "eggs", price: 3.45, quantity: 1}, {title: "tomatos", price: 4.5, quanity: 3}]
        # @apply_discount
    end

    def discount
        @discount
    end

    def total
        @total
    end

    def total=(total)
        @total = total
    end


    def add_item(title, price, quantity=1)
        self.total = self.total + (price*quantity)
        @items.push({title: title, price: price, quantity: quantity})
    end

    def apply_discount
        # @apply_discount = apply_discount
        discount_amount = self.total * self.discount / 100
        new_total = self.total - discount_amount
        self.total = new_total
        if self.discount == 0
            return "There is no discount to apply."
        else
            return "After the discount, the total comes to $#{self.total}."
        end

    end

    def items
        item_names = []
        @items.each do |item|
            item[:quantity].times do 
                item_names.push(item[:title])
            end
        end
        return item_names
    end

    def void_last_transaction
        voided_last = @items.pop # [{mac, 1000}, {snickers, 1}]
        self.total = self.total - voided_last[:price] # 1001 - 1
        if items.length == 0
            self.total = 0.0
        end
    end


end



# "optional" discount?    apply_discount or discount
# discount 20 = 20%
# working with an integer vs working with a float
# void_last will remove last from the total/which method of the class?