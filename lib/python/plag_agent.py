import json
from flask import Flask, request, jsonify
import requests
from googlesearch import search
from bs4 import BeautifulSoup
from rabin_karp import StringMatch

#procedure
#1. take each sentence and search it on google
#2. store all the urls in the array
#3. scrape the data of each url and store it with the corresponding url (2d-array)
#4. match each sentence with the scraped data using rabin-karp algorithm
    #if matches, store it in the similarity array (2d-array)

app= Flask(__name__)

def detect_similar_content(sentence):
    fetched_urls = []


    for urls in search(query=sentence,pause=3, num=50):
        # append the urls we got from the google search
        fetched_urls.append(urls)

    #step 1: get html
    sm={}
    for url in fetched_urls:

        response= requests.get(url)
        htmlContent= response.content #fetch html contents

        #step 2: parse html
        soup= BeautifulSoup(htmlContent,'html.parser')
        # #print(soup.prettify()) #print the html content in a beautiful way
        #print(soup.find('p')) #fetch all the texts, NOT html contents
        stringMatching = StringMatch(source=str(soup.find_all('p')), sentence=sentence)
        sm.__setitem__(url, stringMatching.search())
    
    #now find out which website has most plagiarised content by looking the value size of each key
    
    return sm

@app.route('/check-plag/',methods=['POST'])
def check_plag():
    query = request.values.get('query', type=str)

    result=None
    result= detect_similar_content(sentence=query)

    return jsonify(result)

app.run(host='0.0.0.0', port=8000, debug=True)