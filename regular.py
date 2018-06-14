#!/usr/bin/python
# -*- coding: UTF-8 -*-

import os
import re

# curPath = os.getcwd()
# print(curPath)

os.chdir('../majiang/src_old/app/')

# auditRegex = re.compile(r'(MyGame\:getAppConfig\(\):getImgName\(\"([#a-zA-Z1-9_])\"\))')
auditRegex = re.compile(r'(MyGame\:getAppConfig\(\):getImgName\(\"(.+)\"\))')
# auditRegex = re.compile(r'(MyGame\:getAppConfig\(\):getImgName\(\"([#."a-zA-Z1-9_]+)\"\))')

curPath = os.getcwd()
print(curPath)

list = os.listdir(curPath)
print(list)

for folderName, subfolders, filenames in os.walk(curPath):
    print('The current folder is ' + folderName)

    for subfolder in subfolders:
        print("SUBFOLDER OF " + folderName + ": " + subfolder)

    for filename in filenames:
        # print("FILE INSIDE " + folderName + ": " + filename)
        if os.path.splitext(filename)[1] == '.lua':
            print("################################")
            print(os.path.join(folderName, filename))
            print("--------------------------------")
            file = open(os.path.join(folderName, filename), "r+")
            infos = file.readlines()
            file.seek(0, 0)
            for line in infos:
                print(line)
                mo = auditRegex.search(line)
                if None != mo:
                    print("old.line=" + line)
                    line = auditRegex.sub("\"{}.png\"".format(mo.group(2)), line)
                    print("new.line=" + line)
                file.write(line)
                file.flush()
            file.truncate()
            file.close()
# str = "normalImg = MyGame:getAppConfig():getImgName("#\"\.."com_red_btn_1"),"
#
# print(str)
#
# auditRegex = re.compile(r'(MyGame\:getAppConfig\(\):getImgName\(\"([a-zA-Z1-9_]+)\"\))')

# file = open(os.path.join(os.getcwd(), "lua.txt"), "r+")
# infos = file.readlines()
# file.seek(0, 0)
# for line in infos:
#     print(line)
#     mo = auditRegex.search(line)
#     if None != mo:
#         print("old.line=" + line)
#         line = auditRegex.sub("\"{}.png\"".format(mo.group(2)), line)
#         print("new.line=" + line)
#     file.write(line)
# file.close()

# mo = auditRegex.search(str)
#
# # print(mo.groups())
# if None != mo:
#     print(mo.group(1))
#     print(mo.group(2))
#
#     str = auditRegex.sub("\"#{}.png\"".format(mo.group(2)), str)
#
#     print(str)
