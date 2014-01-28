def stock_picker stock_prices

   max = 0
   days = []

   (0...stock_prices.length).each do |buy_day|

      (buy_day...stock_prices.length).each do |sell_day|

         profit = stock_prices[sell_day] - stock_prices[buy_day]

         if profit > max
            max = profit
            days = [buy_day, sell_day]
         end

      end

   end
   puts "Most profitable days are: #{days}, with a profit of: #{max}"
end