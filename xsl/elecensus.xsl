<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- perform an elements census of all elements used in all the USEP files -->
    
    <xsl:output method="text"/>
    <xsl:param name="path">../xml-2012-11-02/</xsl:param>
    <xsl:variable name="newline">
        <xsl:text>
</xsl:text>
    </xsl:variable>
    <xsl:variable name="delim">","</xsl:variable>
    <xsl:variable name="start">"</xsl:variable>
    <xsl:variable name="end">"<xsl:value-of select="$newline"/></xsl:variable>
    
    <xsl:key match="*" name="elements" use="local-name()"/>
    <xsl:key match="*/*" name="children" use="local-name()"/>
    <xsl:key match="*/@*" name="attribs" use="name()"/>
    
    <xsl:template match="/">
        <xsl:for-each select="//*[generate-id(.)=generate-id(key('elements',local-name())[1])]">
            <xsl:sort select="lower-case(local-name())"/>
            <xsl:variable name="thisname" select="local-name()"/>
            <xsl:value-of select="$start"/>
            <xsl:value-of select="//tei:idno[@type='USEpigraphy']"/>
            <xsl:value-of select="$delim"/>
            <xsl:value-of select="$thisname"/>
            <xsl:value-of select="$delim"/>
            <xsl:for-each select="//*[local-name()=$thisname]/*[generate-id(.)=generate-id(key('children', local-name())[1])]">
                <xsl:sort select="lower-case(local-name())"/>
                <xsl:text>|</xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>|</xsl:text>
            </xsl:for-each>
            <xsl:value-of select="$delim"/>
            <xsl:for-each select="//*[local-name()=$thisname]/@*[generate-id(.)=generate-id(key('attribs', name())[1])]">
                <xsl:sort select="lower-case(name())"/>
                <xsl:text>|</xsl:text>
                <xsl:value-of select="name()"/>
                <xsl:text>|</xsl:text>
            </xsl:for-each>
            
            <xsl:value-of select="$end"/>
        </xsl:for-each>
        
    </xsl:template>
</xsl:stylesheet>