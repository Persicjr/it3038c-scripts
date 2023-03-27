import requests
from bs4 import BeautifulSoup

#Goes to requested site to scrape
url = "https://www.wunderground.com/weather/us/oh/cincinnati"
response = requests.get(url)
#Starting up BeautifulSoup
soup = BeautifulSoup(response.content, "html.parser")
conditions = soup.find_all("div", class_="condition-icon")
#Setting conditiopns to look for and storing values in order
values = soup.find_all("span", class_="wu-value wu-value-to")
temperature = values[0]
feels_like = values[1]
Low = values[2]

#Printing all of the values
print("Current Weather Conditions in Cincinnati:")
print(f"Temperature: {temperature.text.strip()}°F")
print(f"Feels Like: {feels_like.text.strip()}°F")
print(f"Low of: {Low.text.strip()} °F")

