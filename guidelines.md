APIS Content Guidelines
--------------------------------------------

1. Must be valid TEI+EpiDoc per schema at http://www.stoa.org/epidoc/schema/latest/tei-epidoc.rng
1. Must meet additional requirements laid out below
1. Still need to mine out which attributes are required as opposed to optional

The following elements, attributes, and attribute values are supported.
--------------------------------------------


ab
--------------------------------------------

  * context: 
  * must contain: text()
  * attributes
    * {where required?} @part="N"
    * {where required?} @type="conservation|lines|preservation|recto-verso"

author
--------------------------------------------

  * context: 
  * must contain: text()
  * attributes: NONE

authority
--------------------------------------------

  * context: 
  * must contain: "APIS"
 
bibl
--------------------------------------------

  * context: 
  * must contain: text()
  * attributes 
    * @default="false"
    * @type="ddbdp"

body
--------------------------------------------

  * context: text
  * must contain: div+
  * attributes: NONE

classDecl
--------------------------------------------

  * context: 
  * must contain: taxonomy
  * attributes: NONE

condition
--------------------------------------------

  * context: 
  * must contain: ab+
  * attributes: NONE

desc
--------------------------------------------

  * context: 
  * must contain: "APIS keywords are controlled locally at the institution level. They are not necessarily consistent."

div
--------------------------------------------

  * context: 
  * must contain: (ab | figure+ | listBibl | (listBibl, p) | p)
  * attributes
    * @org="uniform"
    * @part="N"
    * @sample="complete"
    * @subtype="citations"
    * @type="bibliography|figure|translation"


encodingDesc
--------------------------------------------

  * context: 
  * must contain: classDecl
  * attributes
    * 

figDesc
--------------------------------------------

  * context: 
  * must contain: text()
  * attributes: NONE

figure
--------------------------------------------

  * context: 
  * must contain: figDesc, graphic, head
  * attributes
    * 

fileDesc (REQUIRED)
--------------------------------------------

  * context: teiHeader
  * must contain: titleStmt, publicationStmt, sourceDesc
  * attributes: NONE

graphic
--------------------------------------------

  * context: 
  * must be EMPTY
  * attributes
    * REQUIRED: url={valid URL}

handDesc
--------------------------------------------

  * context: 
  * must contain: p
  * attributes: NONE
  
head
--------------------------------------------

  * context: 
  * must contain: text()
  * attributes: NONE

history
--------------------------------------------

  * context: 
  * must contain: (origin | origin, provenance)
  * attributes: NONE

idno
--------------------------------------------

  * context: publicationStmt
  * must contain: text()
  * attributes: 
    * REQUIRED type="apisid|controlNo|ddbdp|invNo"

idno@type=apisid (REQUIRED)
--------------------------------------------

> see idno


keywords
--------------------------------------------

  * context: 
  * must contain: term+
  * attributes
    * REQUIRED: scheme="#apis"

language
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

langUsage
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

layout
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

layoutDesc
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

listBibl
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

msContents
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

msDesc
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

msIdentifier
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

msItemStruct
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

note
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

objectDesc
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

origDate
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

origin
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

origPlace
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

p
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

persName
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

physDesc
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

profileDesc
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

provenance
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

publicationStmt
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

ref
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

sourceDesc
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

summary
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

support
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

supportDesc
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

taxonomy
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

TEI (REQUIRED)
--------------------------------------------

  * context: root
  * may contain: 
  * attributes
    * 

teiHeader (REQUIRED)
--------------------------------------------

  * context: TEI
  * must contain: fileDesc, encodingDesc, profileDesc
  * attributes: NONE

term
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

text (REQUIRED)
--------------------------------------------

  * context: TEI
  * must contain: body
  * attributes: NONE

textClass
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

textLang
--------------------------------------------

  * context: 
  * may contain: 
  * attributes
    * 

title (REQUIRED)
--------------------------------------------

  * context: titleStmt
  * must contain: text()
  * attributes: NONE

titleStmt (REQUIRED)
--------------------------------------------

  * context: fileDesc
  * must contain: title, author*
  * attributes: NONE

