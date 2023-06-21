import json
from flask import Flask, request, jsonify
import requests
from googlesearch import search
from bs4 import BeautifulSoup
from rabin_karp import StringMatch
from urllib3.exceptions import InsecureRequestWarning
from urllib3 import disable_warnings, Retry
from requests.adapters import HTTPAdapter

# procedure
# 1. take each sentence and search it on google
# 2. store all the urls in the array
# 3. scrape the data of each url and store it with the corresponding url (2d-array)
# 4. Break each paragraph of the user into an array of pattern.
# 4. match each pattern with the scraped data using rabin-karp algorithm
# if matches, store it in the similarity array (2d-array)

app = Flask(__name__)

def most_plagiarised_content(stringMatch:dict):
    maxLength = 0
    most_plagiarised_content=None
    for key in stringMatch:
        if len(stringMatch[key]) > maxLength:
            maxLength = len(stringMatch[key])
            most_plagiarised_content = {key: stringMatch[key]}

    return most_plagiarised_content

def detect_similar_content(sentence):
    fetched_urls = []
    for urls in search(query=sentence, pause=3, num=100, stop=100):
        # append the urls we got from the google search
        fetched_urls.append(urls)

    # step 1: get html
    sm = {}
    requests_session= requests.Session()
    retries= Retry(total=3,backoff_factor=1)
    adapter= HTTPAdapter(max_retries= retries)
    requests_session.mount('http://', adapter=adapter)
    requests_session.mount('https://', adapter=adapter)
    for url in fetched_urls:
        disable_warnings(InsecureRequestWarning)
        response = requests_session.get(url, verify=False, timeout=10)
        htmlContent = response.content  # fetch html contents

        # step 2: parse html
        soup = BeautifulSoup(htmlContent, 'html.parser')
        # #print(soup.prettify()) #print the html content in a beautiful way
        # print(soup.find('p')) #fetch all the texts, NOT html contents
        getHtmlParaContent= soup.text
        stringMatching = StringMatch(source=str(getHtmlParaContent), sentence=sentence)
        sm.__setitem__(url, stringMatching.search())
        #sm.__setitem__('url',url)

    # now find out which website has most plagiarised content by looking the
    # value size of each value of the key
    return most_plagiarised_content(sm)


@app.route('/check-plag/', methods=['POST'])
def check_plag():
    query = request.values.get('query', type=str)
    result = detect_similar_content(sentence=query)
    return jsonify(result)


app.run(host='0.0.0.0', port=8000, debug=True)
