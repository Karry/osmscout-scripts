#!/usr/bin/python3

from urllib import request
from urllib import error
from urllib.parse import quote
import io
import time

from lxml import etree

translations={}

translations["cs"]=etree.parse("translations/cs.ts")
translations["de"]=etree.parse("translations/de.ts")
translations["en"]=etree.parse("translations/en.ts")
translations["es"]=etree.parse("translations/es.ts")
translations["et"]=etree.parse("translations/et.ts")
translations["fa"]=etree.parse("translations/fa.ts")
translations["fr"]=etree.parse("translations/fr.ts")
translations["hu"]=etree.parse("translations/hu.ts")
translations["it"]=etree.parse("translations/it.ts")
translations["nb"]=etree.parse("translations/nb.ts")
translations["nl"]=etree.parse("translations/nl.ts")
translations["pl"]=etree.parse("translations/pl.ts")
translations["pt"]=etree.parse("translations/pt_BR.ts")
translations["ru"]=etree.parse("translations/ru.ts")
translations["sv"]=etree.parse("translations/sv.ts")
translations["zh"]=etree.parse("translations/zh_CN.ts")

translations["cs"].write("translations/cs.ts", pretty_print=True, encoding="UTF-8")
translations["de"].write("translations/de.ts", pretty_print=True, encoding="UTF-8")
translations["en"].write("translations/en.ts", pretty_print=True, encoding="UTF-8")
translations["es"].write("translations/es.ts", pretty_print=True, encoding="UTF-8")
translations["et"].write("translations/et.ts", pretty_print=True, encoding="UTF-8")
translations["fa"].write("translations/fa.ts", pretty_print=True, encoding="UTF-8")
translations["fr"].write("translations/fr.ts", pretty_print=True, encoding="UTF-8")
translations["hu"].write("translations/hu.ts", pretty_print=True, encoding="UTF-8")
translations["it"].write("translations/it.ts", pretty_print=True, encoding="UTF-8")
translations["nb"].write("translations/nb.ts", pretty_print=True, encoding="UTF-8")
translations["nl"].write("translations/nl.ts", pretty_print=True, encoding="UTF-8")
translations["pl"].write("translations/pl.ts", pretty_print=True, encoding="UTF-8")
translations["pt"].write("translations/pt_BR.ts", pretty_print=True, encoding="UTF-8")
translations["ru"].write("translations/ru.ts", pretty_print=True, encoding="UTF-8")
translations["sv"].write("translations/sv.ts", pretty_print=True, encoding="UTF-8")
translations["zh"].write("translations/zh_CN.ts", pretty_print=True, encoding="UTF-8")

