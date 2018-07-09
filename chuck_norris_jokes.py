#!/usr/local/bin/python3

import requests, json, os

os.system('echo 😂')
print("---")
data = requests.get("https://api.chucknorris.io/jokes/random").json()['value'].split()
for x in (data[i:i + 10] for i in range(0, len(data), 10)):
    print(' '.join(x) + ' | font=UbuntuMono-Bold, color=red')
print('Give me a new joke | refresh=true')