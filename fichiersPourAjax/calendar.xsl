<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" indent="yes"/>
  <xsl:template match="/">
<ul class="media-list">
  <li class="media">
    <a class="pull-left">
      <img class="media-object"/>
    </a>
    <div class="media-body">
      <xsl:apply-templates select="//event"/>
    </div>
  </li>
</ul>

 </xsl:template>

<xsl:template match="event">
<xsl:if test="contains(string(title),'Workaholics')">
	<h4 class="media-heading">
	<xsl:value-of select="title"/>
	</h4>
	<li>
	<xsl:value-of select="dtstart"/>
	</li>
	<li>
	<xsl:value-of select="dtend"/>
	</li>
	<li>
	<xsl:value-of select="summary"/>
	</li>
	<li>
	<xsl:value-of select="url"/>
	</li>
	<li>
	<xsl:value-of select="description"/>
	</li>	
</xsl:if>
</xsl:template>
  
</xsl:stylesheet>








































