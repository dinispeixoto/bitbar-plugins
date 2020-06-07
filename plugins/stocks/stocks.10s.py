#!/usr/local/bin/python3

from yahoo_fin import stock_info

USD = "$"


def display_stock_price(name: str, price: int, coin: str) -> None:
    print(f"{name} - {price} {coin} | font=UbuntuMono-Bold")


# FTCH
ftch_live_price = round(stock_info.get_live_price("ftch"), 2)
display_stock_price("FTCH", ftch_live_price, USD)

# BTC
btc_live_price = round(stock_info.get_live_price("btc-usd"), 2)
display_stock_price("BTC", btc_live_price, USD)
