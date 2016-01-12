'''Challenge was to look at a set of given stock prices throughout a day and determine
what would have been the optimal buy and sale point to maximize profit'''

test_stock_prices = [310, 315, 275, 295, 260, 270, 290, 230, 255, 250]


def compare_price(buy_price, sell_price):
    profit = sell_price - buy_price
    return profit


def optimal_exchange(stock_prices):

    possible_profits = []
    iterator = 0
    last_index = len(stock_prices)
    result = {'Buy Price': 0, 'Sell Price': 0, 'Profit': 0}

    for x in stock_prices:
        # Shrink the loop to only compare stocks that come later chronologically
        for i in range(iterator, last_index):
            profit = compare_price(x, stock_prices[i])
            possible_profits.append(profit)
            if profit >= max(possible_profits):
                result['Buy Price'] = x
                result['Sell Price'] = stock_prices[i]
                result['Profit'] = profit
        iterator += 1
    if result['Profit'] > 0:
        print(result)


optimal_exchange(test_stock_prices)
