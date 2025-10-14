#!/usr/bin/python3

from urllib import request
from urllib import error
from urllib.parse import quote
import io
import time

from lxml import etree

def getTranslations(countryName, instanceof):
    print("Getting translation for {countryName}".format(countryName=countryName))
    query = """
    SELECT * WHERE {
      {
        SELECT ?wd ?country ?countryLabel 
            ?label_cs
            ?label_de
            ?label_en
            ?label_es
            ?label_et
            ?label_fa
            ?label_fr
            ?label_fi
            ?label_hu
            ?label_it
            ?label_nb
            ?label_nl
            ?label_pl
            ?label_pt
            ?label_ru
            ?label_sv
            ?label_zh
        WHERE {
          ?country wdt:P31 wd:%s.
    
          ?country rdfs:label ?label_cs filter (lang(?label_cs) = "cs").
          ?country rdfs:label ?label_de filter (lang(?label_de) = "de").
          ?country rdfs:label ?label_en filter (lang(?label_en) = "en").
          ?country rdfs:label ?label_es filter (lang(?label_es) = "es").
          ?country rdfs:label ?label_et filter (lang(?label_et) = "et").
          ?country rdfs:label ?label_fa filter (lang(?label_fa) = "fa").
          ?country rdfs:label ?label_fi filter (lang(?label_fi) = "fi").
          ?country rdfs:label ?label_fr filter (lang(?label_fr) = "fr").
          ?country rdfs:label ?label_hu filter (lang(?label_hu) = "hu").
          ?country rdfs:label ?label_it filter (lang(?label_it) = "it").
          ?country rdfs:label ?label_nb filter (lang(?label_nb) = "nb").
          ?country rdfs:label ?label_nl filter (lang(?label_nl) = "nl").
          ?country rdfs:label ?label_pl filter (lang(?label_pl) = "pl").
          ?country rdfs:label ?label_pt filter (lang(?label_pt) = "pt").
          ?country rdfs:label ?label_ru filter (lang(?label_ru) = "ru").
          ?country rdfs:label ?label_sv filter (lang(?label_sv) = "sv").
          ?country rdfs:label ?label_zh filter (lang(?label_zh) = "zh").
          
          SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }
        }
      }
      FILTER(REGEX(STR(?countryLabel), "%s"))
    }
    """ % (instanceof, countryName)
    #print(query)

    uri="https://query.wikidata.org/sparql?query={query}".format(query=quote(query))
    #print(uri)

    response = {}
    while True:
        try:
            response = request.urlopen(uri)
            if response.status != 200:
                print("response status: {status}".format(status = response.status))
                return {}
                #exit(1)
            break
        except error.HTTPError as err:
            if err.code == 429: # HTTP Error 429: Too Many Requests
                print("Too Many Requests. Going to sleep for a minute")
                time.sleep(60)
            else:
                print("HTTP error {code}: {message}".format(code = err.code, message = err.msg))
                return {}

    body = io.TextIOWrapper(response,  # type: ignore
                               encoding='utf-8')

    tree = etree.parse(body)
    qlNs = {"ql": "http://www.w3.org/2005/sparql-results#"}

    def qlElement(tree, name):
        el = tree.xpath(name,  namespaces=qlNs)
        if len(el) != 1 or not el[0].text:
            return ""
        return el[0].text.strip()

    #client = Client()

    result={}
    for countryEl in tree.xpath('/ql:sparql/ql:results/ql:result', namespaces=qlNs):
        countryUri = qlElement(countryEl, 'ql:binding[@name="country"]/ql:uri')
        countryLabel = qlElement(countryEl, 'ql:binding[@name="countryLabel"]/ql:literal')
        print("{countryName} / {country}: {uri}".format(countryName=countryName, country=countryLabel, uri=countryUri))
        if countryUri=="" or countryLabel=="":
            continue
        #entity = client.get(countryUri[len("http://www.wikidata.org/entity/"):], load=True)
        #print(entity)
        #for entity.attributes.aliases
        for langEl in countryEl.xpath('ql:binding/ql:literal',  namespaces=qlNs):
            lang=langEl.xpath('@xml:lang')
            if len(lang)==0:
                continue
            lang=lang[0].strip()
            value=langEl.text.strip()
            result[lang]=value
        break # first result is the best usually

    return result

def element(tree, name):
    el = tree.xpath(name, namespaces=ns)
    if len(el) != 1 or not el[0].text:
        return ""
    return el[0].text.strip()

def isUnfinished(message):
    type = message.xpath("translation/@type", namespaces=ns)
    return (len(type) == 1 and type[0]=="unfinished")

def setTranslation(translationTree, extracommentLookup, source, wikidataValue, lang):
    for message in translationTree.xpath('//TS/context[name="Countries"]/message', namespaces=ns):
        extracomment=element(message, "extracomment")
        translation=element(message, "translation")
        if extracomment==extracommentLookup:
            if translation==wikidataValue:
                continue # translated already

            if translation!="" and translation!=wikidataValue:
                print("{source} is translated already as {translation} ({lang}), wikidata: {wikidata}".format(
                    source=source,translation=translation,wikidata=wikidataValue,lang=lang))
                continue

            print("Translating {source} to {value} ({lang})".format(source=source, value=wikidataValue, lang=lang))
            translationEl=message.xpath("translation", namespaces=ns)[0]
            translationEl.text=wikidataValue
            translationEl.attrib["type"]="wikidata"


enTree = etree.parse("translations/en.ts")
ns = enTree.getroot().nsmap

translations={}

translations["cs"]=etree.parse("translations/cs.ts")
translations["de"]=etree.parse("translations/de.ts")
# translate English with wikidata too, it can discover Wikidata lookup errors
translations["en"]=etree.parse("translations/en.ts")
translations["es"]=etree.parse("translations/es.ts")
translations["et"]=etree.parse("translations/et.ts")
translations["fa"]=etree.parse("translations/fa.ts")
translations["fi"]=etree.parse("translations/fi_FI.ts")
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

def save():
    translations["cs"].write("translations/cs.ts", pretty_print=True, encoding="UTF-8")
    translations["de"].write("translations/de.ts", pretty_print=True, encoding="UTF-8")
    translations["en"].write("translations/en.ts", pretty_print=True, encoding="UTF-8")
    translations["es"].write("translations/es.ts", pretty_print=True, encoding="UTF-8")
    translations["et"].write("translations/et.ts", pretty_print=True, encoding="UTF-8")
    translations["fa"].write("translations/fa.ts", pretty_print=True, encoding="UTF-8")
    translations["fi"].write("translations/fi_FI.ts", pretty_print=True, encoding="UTF-8")
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

for message in enTree.xpath('//TS/context[name="Countries"]/message', namespaces=ns):
    print()
    source=element(message, "source")
    extracomment=element(message, "extracomment")

    instanceof="Q3624078" # sovereign state
    if "/" not in extracomment and extracomment!="russia":
        instanceof="Q5107" # continent

    if "north-america/us-" in extracomment:
        print("Skip US state/region {state}".format(state=source))
        continue

    if "north-america/us/" in extracomment:
        instanceof="Q35657" # state of the United States

    if "russia/" in extracomment:
        instanceof="Q484215" # federal district of Russia

    if "russia/kaliningrad" in extracomment:
        instanceof="Q835714" # oblast of Russia

    trans=getTranslations(source, instanceof)
    print(trans)
    if "en" not in trans:
        print("Skip invalid wikidata lookup: {state} ({id})".format(state=source, id=extracomment))
        continue
    if trans["en"] != source:
        print("Skip invalid wikidata lookup: {state} / {wikidata} ({id})".format(state=source, wikidata=trans["en"], id=extracomment))
        continue

    for lang in trans:
        if not lang in translations:
            continue
        setTranslation(translations[lang], extracomment, source, trans[lang], lang)

    save()

