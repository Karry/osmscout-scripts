#!/usr/bin/python3
import sys
from lxml import etree
import MySQLdb

tree = etree.parse(sys.argv[1])
ns = tree.getroot().nsmap

el = tree.xpath("//TS/@language", namespaces=ns)
if len(el) != 1:
    print("No //TS/@language !")
    exit(1)

language = MySQLdb.escape_string(el[0])

print("DELETE FROM `l10n` WHERE `l10n`.`locale` = {language};".format(language=language))
print("")
print("INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES")

def element(tree, name):
    el = tree.xpath(name, namespaces=ns)
    if len(el) != 1 or not el[0].text:
        return ""
    return MySQLdb.escape_string(el[0].text.strip())

def isUnfinished(message):
    type = message.xpath("translation/@type", namespaces=ns)
    return (len(type) == 1 and type[0]=="unfinished")

first=True
for message in tree.xpath('//TS/context[name="Countries"]/message', namespaces=ns):
    source=element(message, "source")
    translation=element(message,"translation")
    extracomment=element(message, "extracomment")
    if extracomment==""  or isUnfinished(message):
        continue

    if not first:
        print(',')

    print("({language},{path},{translation})".format(language=language,path=extracomment,translation=translation), end='')
    first=False

print(';')
print("")

for message in tree.xpath('//TS/context[name="Descriptions"]/message', namespaces=ns):
    source=element(message, "source")
    translation=element(message,"translation")
    extracomment=element(message, "extracomment")

    if extracomment=="" or isUnfinished(message):
        continue

    print("UPDATE `l10n` SET `comment` = {comment} WHERE `locale` = {language} AND `path` = {path};".format(language=language,path=extracomment,comment=translation))

