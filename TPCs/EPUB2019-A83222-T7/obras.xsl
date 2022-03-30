<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   
    version="2.0">
    
    <!--template princial-->
   
        <xsl:output method="xhtml" indent="yes" encoding="UTF-8"></xsl:output>
    <xsl:key name="obras" match="obra" use="@id"/>
        <xsl:template match="/">
            <xsl:variable name="p" select="obra/periodo"/>
            
            <xsl:result-document href="obras-html/index.html">
                <html>
                    <head>
                        <link rel="stylesheet" href="./stylesheets/w3.css"></link>
                        <style>
                            body{background-color:#FFE2D3}
                        </style>
                        <title> Obras Musicais </title>
                        <meta charset="UTF-8"></meta>
                    </head>
                    <body>
                        <div class="w3-container">
                            <div class="w3-card-4">
                                
                                <header class="w3-container w3-sand">
                                    <center>
                                        <h1> Obras Musicais </h1>
                                    </center>
                                </header>
                               
                                <div class="w3-container">
                                    <ul class="w3-ul">
                                        <xsl:apply-templates select="//periodo[not(preceding::periodo=.)]">
                                            <xsl:sort select="."/>
                                        </xsl:apply-templates> 
                                    </ul>
                                </div>
                                
                                <footer class="w3-container w3-sand">
                                    <center>
                                        <h5> EPUB2019-A83222-TPC7 </h5>
                                    </center>
                                   
                                </footer>
                                
                            </div>
                        </div>
                    </body>
                </html>
            </xsl:result-document>
            <xsl:apply-templates select="//periodo[not(preceding::periodo=.)]" mode="pagina-individual"/>
        </xsl:template>
        

    <!-- Templates para gerar as páginas individuais de cada período-->



    <xsl:template match="periodo" mode="pagina-individual">
        <xsl:variable name="p" select="."/>
        <xsl:result-document href="obras-html/{$p}.html">
            <html>
                <head>
                    <link rel="stylesheet" href="./stylesheets/w3.css"></link>
                    <title> <xsl:value-of select="periodo"/> </title>
                    <meta charset="UTF-8"></meta>
                    <style>
                        
                        body{background-color:#ffdacc}
                        
                    </style>
                </head>
                <body>
                    <div class="w3-container w3-padding">
                        <a name="top"/>
                        <div class="w3-row">
                            <div class="w3-col m4 l3">
                                <div class="w3-container">
                                    <div class="w3-panel w3-card-4 w3-sand">
                                        <h3><FONT color="black"> <center> Índice de Obras</center></FONT></h3>
                                        <ul class="w3-ul w3-hoverable">
                                            
                                            <xsl:for-each select="//obra[periodo=$p]">
                                                <li id="ind-{$p}">
                                                    <a href="#{@id}">
                                                        
                                                        <xsl:value-of select="nome"/>
                                                        
                                                    </a>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                        <hr/>
                                        <div class="w3-panel w3-sand">
                                            <h4 class="w3-opacity">
                                                <a href="index.html">
                                                    Voltar ao índice principal
                                                </a>
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="w3-col m8 l9">
                               <center>
                                   <h1> Obras </h1>
                               </center> 

                                    <xsl:for-each select="//obra[periodo=$p]">
                                    
                                    <h2 id="{@id}"> <xsl:value-of select="nome"/> </h2>
                                        <h4 align="justify" style="line-height:130%">  <b> Descrição: </b> <xsl:value-of select="desc"/> </h4>  
                                    <h4> <b> Ano de criação: </b> <xsl:value-of select="anoCriacao"/></h4>  
                                    <h4> <b> Período: </b> <xsl:value-of select="periodo"/></h4>  
                                    <h4> <b> Compositor: </b>  <xsl:value-of select="compositor"/></h4>
                                    <h4> <b> Duração: </b>  <xsl:value-of select="duracao"/></h4>
                                </xsl:for-each> 
                                
                            </div>
                        </div>
                    </div>
                </body>
                
            </html>
        </xsl:result-document>
    </xsl:template>
    
 
    
    <!-- template do indice principal-->
    
    <xsl:template match="periodo">
        <xsl:variable name="p" select="."/>
        <li>
            <a href="{$p}.html"> <b> <xsl:value-of select="."/> </b> </a>
            <ul>
                <xsl:for-each select="//obra[periodo=$p]">
                    <xsl:sort select="nome"/>
                    <li>
                        <a href="{$p}.html#{@id}"> <xsl:value-of select="nome"/> </a> 
                    </li>
                </xsl:for-each>
            </ul>
        </li>
    </xsl:template>
    
    <!-- template obras-->
    
    <!--template para o indice de obras-->
    
   <!-- <xsl:template match="obra">
      
     
        <li id="ind-{generate-id()}">
            <a href="#{generate-id()}.html"><xsl:value-of select="nome"/></a> 
        </li> 
    </xsl:template> -->
    
    
</xsl:stylesheet>