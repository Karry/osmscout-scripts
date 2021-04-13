#!/usr/bin/python3
from xml.sax import saxutils, make_parser
import sys

class Tweak(saxutils.XMLGenerator):
    def startElement(self, name, attrs):
        updated = {}
        for attribute in attrs.getNames():
            if attribute == 'id':
                updated['id'] = str(int(attrs[attribute]) + 281466386776064)
            elif attribute == 'ref':
                updated['ref'] = str(int(attrs[attribute]) + 281466386776064)
            else:
                updated[attribute] = attrs[attribute]
        saxutils.XMLGenerator.startElement(self, name, updated)

parser = make_parser()
dh = Tweak(out=sys.stdout, encoding="UTF-8", short_empty_elements=True)
parser.setContentHandler(dh)
parser.parse(sys.argv[1])
