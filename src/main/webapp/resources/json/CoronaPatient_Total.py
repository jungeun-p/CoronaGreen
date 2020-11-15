#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import os
import requests
import json
from bs4 import BeautifulSoup
from selenium.webdriver import Chrome
import time
import re
from selenium.webdriver.chrome.options import Options

chrome_options = Options()
chrome_options.add_argument('--headless')
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--disable-dev-shm-usage')

driver_path='/var/lib/tomcat9/webapps/CoronaGreen/resources/json/chromedriver'
url = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%BD%94%EB%A1%9C%EB%82%98+%ED%99%95%EC%A7%84&oquery=%EC%B0%BD%EC%9B%90+%EC%BD%94%EB%A1%9C%EB%82%98&tqi=UHjnblp0YihssvNAd4lssssstb8-279240"

browser=Chrome(executable_path=driver_path,chrome_options=chrome_options)
browser.get(url)

time.sleep(5)
doc=browser.page_source
soup=BeautifulSoup(doc,'html.parser')

# 확진자 수
pationt_all = soup.find('div', {'class':'status_info'})
title = pationt_all.select('li')

lst = list()
for chd in title:
    titles = chd.find('strong').text
    num = chd.find('p').text
    nums = re.sub('[,]','',num)
    #print('{} [{}]'.format(titles,num))
    tmp = {}
    tmp['title'] = titles
    tmp['num'] = nums
    lst.append(tmp)

print(lst)
res_json = json.dumps(lst, ensure_ascii=False)

with open(r'/var/lib/tomcat9/webapps/CoronaGreen/resources/json/corona_patient_total.json', 'w', encoding='utf-8') as f:
    f.write(res_json)

browser.close