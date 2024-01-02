#!/usr/bin/env python3
from requests import get
from bs4 import BeautifulSoup
from sys import argv

# URL to currency list
url = "https://www.nykredit.dk/dit-liv/valutakurser/noteringskurser/"

# List for currency scrape
curr_list = []
# String to contain currency arg; default empty
curr = ""
# Currencies to scrape
curr_enable = ["EUR", "SEK", "NOK", "GBP", "USD"]

# Check if argv is set and isnumeric
# If argv is not set then return currency of 1 dkr for all.
if len(argv) > 1:
    if argv[1].isnumeric():
        dkk = round(float(argv[1]), 2)
        # Check if second arg is set and in curr_enable list
        if len(argv) > 2:
            if argv[2].upper() in curr_enable:
                curr = argv[2]
    else:
        print(
            "DK currency converter:\n",
            f"Enabled currencies: {curr_enable}\n",
            f"Source: {url}\n\n",
            "Examples:\n",
            "Convert all: cconv.py 100\n",
            "Convert from: cconv.py 100 usd",
        )
        exit(0)
else:
    dkk = round(float(1), 2)


# Print input value and currency
if curr:
    print(f"{curr.upper()} = {dkk} {curr}.")
else:
    print(f"DKK = {dkk} dkr.")

# Downloading contents of the web page
data = get(url).text

# Creating BeautifulSoup object
soup = BeautifulSoup(data, "html.parser")

# Loop through data
for rows in soup.find_all("tr"):
    cols = rows.find_all("td")
    cols = [ele.text.strip() for ele in cols]
    curr_list.append([ele for ele in cols if ele])  # Get rid of empty values

for x in curr_list:
    if len(x) > 1:
        if x[1] in curr_enable:
            # x[0]: VALUTA
            # x[1]: VALUTA FORKORTELSE
            # x[2]: DIT KØB
            # x[3]: DIT SALG
            # x[4]: NYKREDIT BANKS REFERENCEKURS
            # x[5]: DATO
            # x[6]: NYKREDITS TILLÆG/FRADRAG
            if curr:
                if x[1] == curr.upper():
                    # Calculate conversion fron curr to dkk
                    calc_curr = float(x[2].replace(",", ".")) / 100
                    calc = float(dkk * calc_curr)
                    print(f"DKK = {round(calc, 2)} dkr.")
                    break
            else:
                # Calculate conversion from dkk to curr
                calc_curr = float(x[2].replace(",", ".")) / 100
                calc = float(dkk / calc_curr)
                print(f"{x[1]} = {round(calc, 2)} dkr.")

print(f"\nSidst opdateret d. {curr_list[1][5]}")
