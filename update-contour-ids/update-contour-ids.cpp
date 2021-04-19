// g++ -std=c++17 -g -O2 -pedantic -Wall -Wextra -lxml2 -I/usr/include/libxml2/ -oupdate-contour-ids update-contour-ids.cpp

#include <cstring>
#include <functional>
#include <iostream>
#include <map>
#include <utility>
#include <fstream>
#include <string>

#include <libxml/parser.h>

struct Parser {
  int errorCnt = 0;
  xmlSAXHandler saxParser;
  xmlParserCtxtPtr ctxt = nullptr;
  std::FILE *inFile = nullptr;
  std::ofstream outFile;

  Parser(const std::string &input, const std::string &output) {
    std::cout << "Converting " << input << " to " << output << std::endl;

    memset(&saxParser,0,sizeof(xmlSAXHandler));
    saxParser.initialized=XML_SAX2_MAGIC;

    saxParser.startDocument=StartDocumentHandler;
    saxParser.endDocument=EndDocumentHandler;
    saxParser.getEntity=GetEntity;
    saxParser.characters=Characters;
    saxParser.warning=WarningHandler;
    saxParser.error=ErrorHandler;
    saxParser.fatalError=ErrorHandler;
    saxParser.serror=StructuredErrorHandler;
    saxParser.startElementNs=StartElement;
    saxParser.endElementNs=EndElement;

    inFile=std::fopen(input.c_str(),"rb");
    if (inFile == nullptr) {
      std::cerr << "failed to open" << input << std::endl;
    }
    outFile.open(output);
    if (outFile.good()) {
      outFile.precision(9);
      outFile.imbue(std::locale("C"));
    } else {
      std::cerr << "failed to open" << output << std::endl;
    }
  }

  ~Parser() {
    if (ctxt!=nullptr) {
      xmlFreeParserCtxt(ctxt);
    }
    if (inFile!=nullptr){
      std::fclose(inFile);
    }
    if (outFile.is_open()) {
      outFile.close();
    }
  }

  int update() {
    if (inFile == nullptr) {
      return 1;
    }
    if (!outFile.good()){
      return 1;
    }

    char chars[1024];

    size_t res=std::fread(chars,1,4,inFile);
    if (res!=4) {
      return 1;
    }

    ctxt=xmlCreatePushParserCtxt(&saxParser,this,chars,
                                 static_cast<int>(res),
                                 nullptr);

    // Resolve entities, do not do any network communication
    xmlCtxtUseOptions(ctxt,XML_PARSE_NOENT|XML_PARSE_NONET);

    while ((res=std::fread(chars,1,sizeof(chars),inFile))>0) {
      if (xmlParseChunk(ctxt,chars,
                        static_cast<int>(res),0)!=0) {
        xmlParserError(ctxt,"xmlParseChunk");
        return 1;
      }
      if (errorCnt>0){
        return 1;
      }
    }

    if (xmlParseChunk(ctxt,chars,0,1)!=0) {
      xmlParserError(ctxt,"xmlParseChunk");
      return 1;
    }
    return 0;
  }

  static bool isSimpleElement(const std::string &element) {
    using namespace std::string_literals;

    return element=="bounds"s ||
           element=="node"s ||
           element=="tag"s ||
           element=="nd"s;
  }

  static void StartElement(void* data,
                           const xmlChar *localname,
                           [[maybe_unused]] const xmlChar *prefix,
                           [[maybe_unused]] const xmlChar *eleUri,
                           [[maybe_unused]] int nb_namespaces,
                           [[maybe_unused]] const xmlChar **namespaces,
                           int nb_attributes,
                           [[maybe_unused]] int nb_defaulted,
                           const xmlChar **atts)
  {
    using namespace std::string_literals;
    auto* parser=static_cast<Parser*>(data);
    std::string eleName((const char *)localname);
    parser->outFile << "<" << eleName;
    //std::map<AttrKey,std::string> attsMap;
    if (atts!=nullptr) {
      for (int i = 0; i<nb_attributes; ++i) {
        const char *name = (const char *)atts[i*5+0];
        //const char *attrUri = (const char *)atts[i * 5 + 2];
        const char *value = (const char *)atts[i*5+3];
        const char *end = (const char *)atts[i*5+4];
        //AttrKey key{NameSpaceByUri(attrUri != nullptr ? attrUri : (const char *)eleUri), name};
        //attsMap[key] = std::string(value, end);
        std::string valStr(value, end);
        std::string nameStr(name);
        parser->outFile << " " << nameStr << "=\"";
        if (nameStr == "id"s || nameStr == "ref"s) {
          std::size_t pos;
          uint64_t id=std::stoll(valStr, &pos);
          if (pos!=valStr.length()){
            std::cerr << "cannot covert " << valStr << " to number" << std::endl;
            parser->errorCnt++;
          }
          parser->outFile << (id + uint64_t(281466386776064));
        } else {
          parser->outFile << valStr;
        }
        parser->outFile << "\"";
      }
    }
    if (isSimpleElement(eleName)){
      parser->outFile << "/>";
    } else {
      parser->outFile << ">";
    }
    parser->outFile << std::endl;
  }

  static void Characters([[maybe_unused]] void *data,
                         [[maybe_unused]] const xmlChar *ch,
                         [[maybe_unused]] int len)
  {
    // auto* parser=static_cast<Parser*>(data);
  }

  static void EndElement(void* data,
                         const xmlChar *localname,
                         [[maybe_unused]] const xmlChar *prefix,
                         [[maybe_unused]] const xmlChar *URI)
  {
    auto* parser=static_cast<Parser*>(data);
    std::string eleName((const char *)localname);
    if (!isSimpleElement(eleName)) {
      parser->outFile << "</" << eleName << ">" << std::endl;
    }
  }

  static xmlEntityPtr GetEntity([[maybe_unused]] void* data,
                                [[maybe_unused]] const xmlChar *name)
  {
    return xmlGetPredefinedEntity(name);
  }

  static void StructuredErrorHandler([[maybe_unused]] void* data,
                                     [[maybe_unused]] xmlErrorPtr error)
  {
    //auto* parser=static_cast<Parser*>(data);
  }

  static void WarningHandler([[maybe_unused]] void* data, const char* msg,...)
  {
    //auto* parser=static_cast<Parser*>(data);
    std::cerr << "warning: " << msg << std::endl;
  }

  static void ErrorHandler(void* data, const char* msg,...)
  {
    auto* parser=static_cast<Parser*>(data);
    std::cerr << "error: " << msg << std::endl;
    parser->errorCnt++;
  }

  static void StartDocumentHandler(void* data)
  {
    auto* parser=static_cast<Parser*>(data);
    parser->outFile << "<?xml version='1.0' encoding='UTF-8'?>" << std::endl;
    //parser->outFile << "<osm version=\"0.6\">" << std::endl;
  }

  static void EndDocumentHandler([[maybe_unused]] void* data)
  {
    // auto* parser=static_cast<Parser*>(data);
    // parser->outFile << "</osm>" << std::endl;
  }
};

int main(int argc, char* argv[]) {
  if (argc < 3) {
    std::cerr << "Too few arguments" << std::endl;
    return 1;
  }

  int result;
  {
    Parser parser(argv[1], argv[2]);
    result = parser.update();
  }

  return result;
}