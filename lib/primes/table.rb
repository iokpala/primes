module Primes
  class Table

    def initialize(multiplier)
      @factors = multiplier.factors
      @products = multiplier.products
    end

    def print
       puts build
    end

  protected

    def row(cells)
      cells.map{|cell| "%-#{padding}s " % cell }
    end

    def dashes
      "#{"-"*(padding+1)}+­#{"-"*(factor_cells_x.join.size-padding)}"
    end

    def head_row
      " "*(padding+1) + factor_cells_x.join
    end

    def factor_cells_x
      @factor_cells_x ||= row(["|"]+@factors)
    end

    def factor_cells_y
      @factor_cells_y ||= @factors.zip(["|"]*@factors.size)
    end

  private

    def padding
      @padding ||= @products.flatten.max.to_s.split(//).count + 1
    end

    def build
      [].tap do |rows|
        rows << head_row
        rows << dashes
        @products.each_with_index do |product_cells, index|
          rows << row(factor_cells_y[index]+product_cells).join
        end
      end
    end
  end
end
