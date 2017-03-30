<?xml version="1.0" encoding="ISO-8859-1" ?>

<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="//a" />
    <xsl:apply-templates select="//div[@class='resourcepdf']" />
  </xsl:template>

  <xsl:template match="div">
    <xsl:value-of select="object/@data"/><xsl:text> RESOURCEPDF</xsl:text>
  </xsl:template>
  
  <xsl:template match="a">
    <xsl:if test="substring(@href, 1, 51) = 'https://isis.tu-berlin.de/mod/resource/view.php?id=' or substring(@href, 1, 58) = 'https://isis.tu-berlin.de/archiv/mod/resource/view.php?id='">
      <xsl:value-of select="@href"/><xsl:text> </xsl:text><xsl:value-of select=".//img/@src" /><xsl:text> </xsl:text><xsl:value-of select=".//span/text()" /><xsl:text>&#10;</xsl:text>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
