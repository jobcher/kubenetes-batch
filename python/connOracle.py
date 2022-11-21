#!/usr/bin/python3
"""
使用python 对oracle数据进行操作
提前安装好 cx_Oracle
pip3 install cx_Oracle
"""
import cx_Oracle

conn = cx_Oracle.connect('用户名','密码','IP/SN')
cursor = conn.cursor()
sql = 'SELECT * FROM test_table'
cursor.execute(sql)
res = cursor.fetchall()
print (res)
