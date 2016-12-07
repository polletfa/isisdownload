<?xml version="1.0" encoding="ISO-8859-1" ?>

<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="//tr" />
    <xsl:apply-templates select="//a" />
  </xsl:template>

  <xsl:template match="strong">
    <xsl:for-each select="../following-sibling::*[2]">
      <xsl:apply-templates select="//tr">
	<xsl:with-param name="title" select="." />
      </xsl:apply-templates>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="table[@frame='hsides']/tbody/tr">
    <xsl:for-each select="./td[position() = 2]//font//a[node()]">
      <xsl:value-of select="@href" />
    </xsl:for-each>
    <xsl:text> _ </xsl:text>
    <xsl:value-of select="../../../p[2]" />
    <xsl:text> - </xsl:text>
    <xsl:value-of select="./td[position() = 1]/font" />
    <xsl:text> - </xsl:text>
    <xsl:value-of select="./td[position() = 2]//font//a[node()]" />
    <xsl:text>&#10;</xsl:text>

    <xsl:for-each select="./td[position() = 3]//font//a[node()]">
      <xsl:value-of select="@href" />
    </xsl:for-each>
    <xsl:text> _ </xsl:text>
    <xsl:value-of select="../../../p[2]" />
    <xsl:text> - </xsl:text>
    <xsl:value-of select="./td[position() = 1]/font" />
    <xsl:text> - </xsl:text>
    <xsl:value-of select="./td[position() = 3]//font//a[node()]" />
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="tr">
  </xsl:template>

  <xsl:template match="a">
    <xsl:if test="substring(@href, 1, 51) = 'https://isis.tu-berlin.de/mod/resource/view.php?id=' or substring(@href, 1, 58) = 'https://isis.tu-berlin.de/archiv/mod/resource/view.php?id='">
      <xsl:value-of select="@href"/><xsl:text> </xsl:text><xsl:value-of select=".//img/@src" /><xsl:text> </xsl:text><xsl:value-of select=".//span/text()" /><xsl:text>&#10;</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
