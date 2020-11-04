#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import os
import requests
import json
from bs4 import BeautifulSoup
from selenium.webdriver import Chrome
import time
from selenium.webdriver.chrome.options import Options

chrome_options = Options()
chrome_options.add_argument('--headless')
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--disable-dev-shm-usage')

driver_path='/var/lib/tomcat9/webapps/CoronaGreen/resources/json/chromedriver'
url='https://search.naver.com/search.naver?where=nexearch&sm=tab_jum&query=%EC%BD%94%EB%A1%9C%EB%82%98+%EC%9D%BC%EC%9D%BC+%ED%99%95%EC%A7%84%EC%9E%90%EC%88%98'

browser=Chrome(executable_path=driver_path,chrome_options=chrome_options)
browser.get(url)

time.sleep(5)
doc=browser.page_source
soup=BeautifulSoup(doc,'html.parser')

div = soup.find('div','graph_inner')

test = div.find_all('div','column')

lst = list()
for i in test:
    num = i.find('span').text
    #print(titles)
    day = i.find('dt').text
    #print('{} [{}]'.format(num,day))        
    tmp = {}
    tmp['number']=num
    tmp['day'] = day
    lst.append(tmp)
    print(lst)

    res_json = json.dumps(lst, ensure_ascii=False)

    with open(r'/var/lib/tomcat9/webapps/CoronaGreen/resources/json/corona_patient.json', 'w', encoding='utf-8') as f:
        f.write(res_json)