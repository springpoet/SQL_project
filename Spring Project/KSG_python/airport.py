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
json_arr = data['data']  # 속성이 'data'인 것만 긁어옴

# 월 더하기
# print (int(json_arr[0]['시작일자'].split("-")[1])+2)

a = json_arr[0]['시작일자'].split("-")
print(int(a[0]) + 2)

b = str((int(json_arr[0]['시작일자'].split("-")[1]) + 2))
print("월 : " + b)

print(a[2])

print('////////////////')
print(a[0] + "-" + b + "-" + a[2])

print(json_arr[0]['시작일자'].split("-")[0] + "-" + str(int(json_arr[0]['시작일자'].split("-")[1]) + 2) + "-" + (
    json_arr[0]['시작일자'].split("-")[2]))
# print (json_arr[0]['도착공항'], json_arr[0]['도착시간'], int(json_arr[0]['시작일자'].split("-")[1])+2)


conn = pymysql.connect(host='localhost',
                       user='root',
                       password='1234',
                       db='skyscanner',
                       charset='utf8')

sql = 'insert into airport values("%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s")'
# sql = 'insert into cccc values("%s", "%s")'

cur = conn.cursor()

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

    # cur.execute(sql % ("a", "11:11", "2022-01-01", "mm", "jj", "2022-03-03", "g", "11:22", "i"))
conn.commit()
conn.close()