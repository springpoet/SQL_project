import json
from urllib import request
import pymysql
import pprint
import urllib.request
from pprint import pprint

url = 'https://api.odcloud.kr/api/15003087/v1/uddi:57ea963b-b3d2-4c49-b48b-b5b39d2b97a6?page=1&perPage=200&serviceKey=4byjzqwydxOVzCus0EYjtCuaMyUycrJKeeRSD4Fp%2BN8rRjvgZ%2FsYcGFVROyaCOTBdnWU8gqS3P40%2BqvcxXVJuA%3D%3D'
response = urllib.request.urlopen(url)
response_message = response.read().decode('utf-8')
data = json.loads(response_message)
json_arr = data['data']

a = json_arr[0]['시작일자'].split("-")
b = str((int(json_arr[0]['시작일자'].split("-")[1]) + 2))

conn = pymysql.connect(host='localhost',
                       user='root',
                       password='1234',
                       db='skyscanner',
                       charset='utf8')

sql = 'insert into airport2(도착공항, 도착시간, 시작일자, 운항요일, 운항편명, 종료일자, 출발공항, 출발시간, 항공사) values("%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s")'

cur = conn.cursor()
a = 0
for item in json_arr:
    arr = item['시작일자'].split("-")
    a = arr[0]
    b = int(arr[1]) + 2
    c = arr[2]
    result = a + "-" + str(b) + "-" + c

    arr1 = item['종료일자'].split("-")
    a1 = arr1[0]
    b2 = int(arr1[1]) + 2
    c3 = arr1[2]
    result1 = a1 + "-" + str(b2) + "-" + c3

    cur.execute(sql % (
    item['도착공항'], item['도착시간'], result, item['운항요일'], item['운항편명'], result1, item['출발공항'], item['출발시간'], item['항공사']))

conn.commit()
conn.close()
