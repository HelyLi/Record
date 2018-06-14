import re

phoneNumRegex = re.compile(r'(\d\d\d)-(\d\d\d-\d\d\d\d)')
mo = phoneNumRegex.search("my numbre is 415-555-4242.")
print('Phone number found:' + mo.group(2))

batRegex = re.compile(r'Bat(wo)*man')
mo = batRegex.search("the Batwoman")
print("mo=" + mo.group())

haRegex = re.compile(r'(Ha){3}')
mo = haRegex.search("HaHaHa, HaHaHaHa")
print(mo.group())
print(mo.groups())
