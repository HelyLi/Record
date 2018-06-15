#!/usr/bin/python
# -*- coding: UTF-8 -*-

import os
import re
import docx

zzmjRegex = re.compile(r'ZZMJ')
inDoc = docx.Document("ZZMJ.docx")

txtName = "GYZJ.txt"
if os.path.isfile(txtName):
    os.remove(txtName)
outTxt = open(txtName, 'w')
for para in inDoc.paragraphs:
    zzmjMo = zzmjRegex.search(para.text)
    if zzmjMo != None:
        para.text = zzmjRegex.sub("GYZJ", para.text)
        outTxt.writelines(para.text.encode('utf-8'))
    else:
        outTxt.writelines(para.text.encode('utf-8'))
    outTxt.write("\n")
outTxt.close()
