#!/usr/bin/python
# -*- coding: UTF-8 -*-

import os
import re
import shutil

# curPath = os.getcwd()
# print(curPath)

# os.chdir('./mj_3.3.0/src/app/')

# auditRegex = re.compile(r'(MyGame\:getAppConfig\(\):getImgName\(\"([#a-zA-Z1-9_])\"\))')
# auditRegex = re.compile(r'(\"(.+).png\")')
# auditRegex = re.compile(r'(MyGame\:getAppConfig\(\):getImgName\(\"([#."a-zA-Z1-9_]+)\"\))')

curPath = os.getcwd()
print(curPath)

filePath = os.path.join(os.getcwd(), "img.txt")
imgfile = open(filePath, "r")
lines = imgfile.readlines()
for line in lines:
    print("line" + line)
imgfile.close()

# outfile = os.path.join(os.getcwd(), "img.txt")
# if not os.path.exists(outfile):
#     f = open(outfile, 'w')
#     print(outfile)
#     f.close()
#     print(outfile + " created.")

# outf = open(outfile, "w+")

# list = os.listdir(curPath)
# print(list)

for folderName, subfolders, filenames in os.walk(curPath):
    print('The current folder is ' + folderName)
    deletePath = os.path.join(os.getcwd(), folderName, "DeleteImg")
    exists = os.path.exists(deletePath)
    if not exists:
        os.makedirs(deletePath)
        print("create" + deletePath)

    for subfolder in subfolders:
        print("SUBFOLDER OF " + folderName + ": " + subfolder)

    for filename in filenames:
        print("FILE INSIDE " + folderName + ": " + filename)
        if os.path.splitext(filename)[1] == '.png':
            move = True
            for line in lines:
                if filename.find(line.replace("\n", ""))>=0:
                    move = False
                    break

            if move:
                o = os.path.join(os.getcwd(), folderName, filename)
                n = os.path.join(os.getcwd(), folderName, "DeleteImg", filename)
                shutil.move(o, n)
            # if filename.find(str2)>=0:
            # print("################################")
            # print(os.path.join(folderName, filename))
            # print("--------------------------------")
            # file = open(os.path.join(folderName, filename), "r+")
            # infos = file.readlines()
            # file.seek(0, 0)
            # for line in infos:
            #     # print(line)
            #     mo = auditRegex.search(line)
            #     if None != mo:
                    # print("img:" + mo.group(2))
                    # s = mo.group(2)
                    # s = s.replace('%d', '').replace('#', '').replace('.', '').replace('"', '')
                    # outf.write(s + "\n")
                    # print("d:" + s)
                    # print(re.sub('[]', '', s))
                    # print("old.line=" + line)
                    # line = auditRegex.sub("\"{}.png\"".format(mo.group(2)), line)
                    # print("new.line=" + line)
                # file.write(line)
                # file.flush()
            # file.truncate()
            # outf.close()
            # file.close()

# outf.close()
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
