<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    <xsl:output method="xhtml" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
    <html>
        <head>
            <title> Arquivo Sonoro de Ernesto Veiga de Oliveira </title>
            <meta charset="UTF-8"/>
        </head>
        <body>
            <center>
                <span style="color:#b33c00">
                    <h1> Arquivo Sonoro de Ernesto Veiga de Oliveira </h1>
                </span>
                <hr width="90%"></hr>
                <xsl:apply-templates select="//doc"/>
            </center>
   
        </body>
        
    </html>
        
    </xsl:template>
    <xsl:template match="doc">
        <span style="color:#ff884d;">
            <h2>"<xsl:value-of select="tit"/>"</h2>
        </span>
        <h3><xsl:value-of select="musico"/></h3>

        <xsl:for-each select="obs">
   
                    <b>Observação: </b>
                    <xsl:value-of select="text()"/>
 
        </xsl:for-each>
        <xsl:for-each select="obs/intxt">
            -
            <xsl:value-of select="."/>
     
        </xsl:for-each>
        <xsl:for-each select="obs/file">
       
                   <center>
                               Ficheiro:  
                           <i>
                               <xsl:value-of select="."/>
                           </i>
                       
                   </center>
        
        </xsl:for-each>
   
        <p> <b> Província: </b> <xsl:value-of select="prov"/> </p>
        <p> <b> Local: </b> <xsl:value-of select="local"/></p>
      
        <p> <b> Duração: </b> <xsl:value-of select="duracao"/></p>
        <p> <b> Ficheiro: </b> <xsl:value-of select="file"/></p>
    
          
        <center>
            <hr width="30%"></hr>
        </center>
        
        
        
    </xsl:template>
    
    
    
    
    
    
    
    
  
 
    
    
    
    
</xsl:stylesheet>