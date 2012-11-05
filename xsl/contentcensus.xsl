<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs t"
    version="2.0">
    
    <xsl:param name="path">../files/</xsl:param>
    
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
    
    <xsl:variable name="selstr" select="concat($path, '?select=*.xml;recurse=no;on-error=warning')"/>
    <xsl:variable name="nline">
        <xsl:text>
</xsl:text>
    </xsl:variable>
    <xsl:variable name="delimnchar">
        <xsl:text>&#9;</xsl:text>
    </xsl:variable>
    <xsl:variable name="topenchar">
        <xsl:text></xsl:text>
    </xsl:variable>
    <xsl:variable name="tclosechar">
        <xsl:text></xsl:text>
    </xsl:variable>
    <xsl:variable name="delim">
        <xsl:value-of select="$tclosechar"/><xsl:value-of select="$delimnchar"/><xsl:value-of select="$topenchar"/>
    </xsl:variable>
    <xsl:variable name="start">
        <xsl:value-of select="$topenchar"/>
    </xsl:variable>
    <xsl:variable name="end">
        <xsl:value-of select="$tclosechar"/><xsl:value-of select="$nline"/>
    </xsl:variable>
    
    <xsl:template name="contentcensus">
        <xsl:value-of select="$start"/>
        <xsl:text>element</xsl:text>
        <xsl:value-of select="$delim"/>
        <xsl:text>element-content-type</xsl:text>
        <xsl:value-of select="$delim"/>
        <xsl:text>element-content</xsl:text>
        <xsl:value-of select="$delim"/>
        <xsl:text>attribute</xsl:text>
        <xsl:value-of select="$delim"/>
        <xsl:text>attribute-content</xsl:text>
        <xsl:value-of select="$end"/>
        <xsl:apply-templates select="collection($selstr)//t:*"/>
    </xsl:template>
        
    <xsl:template match="t:*">
        <xsl:variable name="ename" select="local-name()"/>
        <xsl:variable name="etype">
            <xsl:call-template name="elementtype"/>
        </xsl:variable>
        <xsl:variable name="econtent">
            <xsl:call-template name="econtent">
                <xsl:with-param name="etype" select="$etype"/>
            </xsl:call-template>
        </xsl:variable>
        
        <!-- code here to actually write the content -->
        <xsl:choose>
            <xsl:when test="count(./@*) = 0">
                <xsl:value-of select="$start"/>
                <xsl:value-of select="$ename"/>
                <xsl:value-of select="$delim"/>
                <xsl:value-of select="$etype"/>
                <xsl:value-of select="$delim"/>
                <xsl:value-of select="$econtent"/>
                <xsl:value-of select="$delim"/>
                <xsl:value-of select="$delim"/>
                <xsl:value-of select="$end"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="./@*">
                    <xsl:value-of select="$start"/>
                    <xsl:value-of select="$ename"/>
                    <xsl:value-of select="$delim"/>
                    <xsl:value-of select="$etype"/>
                    <xsl:value-of select="$delim"/>
                    <xsl:value-of select="$econtent"/>
                    <xsl:value-of select="$delim"/>
                    <xsl:value-of select="local-name()"/>
                    <xsl:value-of select="$delim"/>
                    <xsl:value-of select="normalize-space()"/>
                    <xsl:value-of select="$end"/>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
        
        <!-- handle subordinate elements -->
        <xsl:apply-templates/>
        
    </xsl:template>
    
    <xsl:template name="econtent">
        <xsl:param name="etype">unknown</xsl:param>
        <xsl:choose>
            <xsl:when test="$etype='elements'">
                <xsl:for-each select="t:*">
                    <xsl:sort  select="local-name()"/>
                    <xsl:text>|</xsl:text><xsl:value-of select="local-name()"/><xsl:text>|</xsl:text>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$etype='empty'"/>
            <xsl:when test="$etype='text'">
                <xsl:variable name="fulltext" select="normalize-space()"/>
                <xsl:choose>
                    <xsl:when test="string-length($fulltext) &gt; 144">
                        <xsl:text>FREE TEXT</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text></xsl:text><xsl:value-of select="$fulltext"/><xsl:text></xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$etype='mixed'">
                <xsl:for-each select="node()">
                    <xsl:choose>
                        <xsl:when test="self::text()">
                            <xsl:variable name="fulltext" select="normalize-space()"/>
                            <xsl:choose>
                                <xsl:when test="string-length($fulltext) &gt; 144">
                                    <xsl:text>FREE TEXT</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text></xsl:text><xsl:value-of select="$fulltext"/><xsl:text></xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>&lt;&lt;</xsl:text><xsl:value-of select="local-name()"/><xsl:text>&gt;&gt;</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>untrapped</xsl:text>
                <xsl:message>unexpected element type ($etype) = "<xsl:value-of select="$etype"/>"</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="elementtype">
        <xsl:variable name="txt">
            <xsl:for-each select="node()">
                <xsl:if test="self::text() and normalize-space()!='' and normalize-space()!=' '">x</xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="txty">
            <xsl:choose>
                <xsl:when test="contains($txt, 'x')">yes</xsl:when>
                <xsl:otherwise>no</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elec" select="count(t:*)"/>
        <xsl:variable name="eley">
            <xsl:choose>
                <xsl:when test="$elec &gt; 0">yes</xsl:when>
                <xsl:otherwise>no</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$eley='yes' and $txty='no'">elements</xsl:when>
            <xsl:when test="$eley='yes' and $txty='yes'">mixed</xsl:when>
            <xsl:when test="$eley='no' and $txty='yes'">text</xsl:when>
            <xsl:when test="$eley='no' and $txty='no'">empty</xsl:when>
            <xsl:otherwise>untrappedtype</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="text()"/>
</xsl:stylesheet>