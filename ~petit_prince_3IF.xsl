<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Wed May 14 15:24:45 CEST 2014 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/">
		<html>
		
			<head>
			<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>

				<title>
				<xsl:value-of select="//titre"/>
				<xsl:text> de </xsl:text>
				<xsl:value-of select="//auteur"/>
				</title>
			</head>
			<body style="background-color:white;">
				<xsl:apply-templates/>
		
			</body>
		</html>
	</xsl:template> 	



	<xsl:template match="couverture">
	<div align="center">
	<img>
	<xsl:attribute name="src">
	<xsl:value-of select="@chemin"/>
	</xsl:attribute>
	</img>
	
	</div>
	</xsl:template>
	
         <table align="center">
       <tr>
     <td>

<xsl:template match="image">
	<div align="center">
	<img>
	<xsl:attribute name="src">
	<xsl:value-of select="@chemin"/>
	</xsl:attribute>
	</img>
	</div>
	</xsl:template>
	</td>


	  <td>

	<xsl:template match="titre">
	<h1 style="text-align:center; color:blue;">
	<xsl:apply-templates/>
	</h1>
	</xsl:template>
	
	<xsl:template match="auteur">
	<br/>
	<h2 style="text-align:center; font-style: italic;">
	<xsl:apply-templates/>
	</h2>
	<br/>
	</xsl:template>
	
	<xsl:template match="info_traitements">
	<blockquote style="color :darkgreen;">
	<xsl:text> But du TP du </xsl:text> <xsl:value-of select="date"/>
	<xsl:text> :  </xsl:text> <xsl:value-of select="but"/>
	<br/>
	<xsl:text> Auteurs : </xsl:text>
		<xsl:for-each select="mise_en_forme_par/unCreateur">
		<xsl:value-of select="."/> <xsl:text>  </xsl:text> 
		</xsl:for-each>
		<xsl:value-of select="mise_en_forme_par/NoBinome"/>
	<br/>
	<xsl:text> Email du responsable: </xsl:text> <xsl:value-of select="email"/>
	</blockquote>
	<hr/>
	</xsl:template>
	</td>
	</tr>

     </table>
	
	<xsl:template match="paragraphe">
	
	<xsl:if test="@type='narration'">
	<p>
	<xsl:apply-templates/>
	</p>
	</xsl:if>
	
	<xsl:if test="@type='dialogue'">
	<table align="center">
	<td>
	<table border="3" width="600" align="center">
	<xsl:for-each select="phrase[@langue='francais']">
		<tr>
			<td>
			<img src="images/{@locuteur}.png"/>
			</td>
			<td>
				<xsl:if test="@langue='francais'">
				<xsl:if test="contains(string(.),'mouton')">
				<h2 style=" font-style: bold;"><xsl:value-of select="."/><img src="images/moutonDessin.png"/></h2>
				</xsl:if>
				<xsl:if test="contains(string(.),'mouton') = false()">
				<div><xsl:value-of select="."/></div>
				</xsl:if>
				</xsl:if>
			</td>
		</tr>	
	</xsl:for-each>
	</table>
	</td>
	<td>
	<table border="3" width="600" align="center">
	<xsl:for-each select="phrase[@langue='hongrois']">
		<tr>
			<td>
			<img src="images/{@locuteur}.png"/>
			</td>
			<td>
			<div style="color :brown; font-style: italic;"><xsl:value-of select="."/></div>
			</td>
		</tr>	
	</xsl:for-each>
	</table>
	</td>
	</table>
	</xsl:if>
	</xsl:template>
	
	<xsl:template match="phrase">
	<xsl:if test="@langue='hongrois'">
	<div style="color :brown; font-style: italic;"><xsl:value-of select="."/></div>
	</xsl:if>
	<xsl:if test="@langue='francais'">
		<xsl:if test="contains(string(.),'mouton')">
		<h2 style=" font-style: bold;"><xsl:value-of select="."/><img src="images/moutonDessin.png"/></h2>
		</xsl:if>
		<xsl:if test="contains(string(.),'mouton') = false()">
		<div><xsl:value-of select="."/></div>
		</xsl:if>
	</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>



