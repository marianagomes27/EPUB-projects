<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    
    version="2.0">
    
    <xsl:template match="ListaCompras">
        
        <xsl:variable name="p" select="."/>
        <xsl:result-document href="listadecompras.html">
            <html>
                <head>
                    <link rel="stylesheet" href="./stylesheets/w3.css"></link>
                    <style>
                        body{background-color: #FFE2D3}
                        
                    </style>
                    <title> Lista de Compras </title>
                    <meta charset="UTF-8"></meta>
                </head>
                <body>
                    
                    <div class="w3-container w3-padding">
                        <a name="top"/>
                        <div class="w3-row">
                            <div class="w3-col m4 l3">
                                <div class="w3-container">
                                    <div class="w3-panel w3-card-4 w3-sand">
                                        <center>
                                            <h2> Índice de Categorias </h2>   
                                        </center>
                                        <ol>
                                            <xsl:apply-templates select="//categoria[not(preceding::categoria=.)]">
                                                <xsl:sort select="."/>
                                            </xsl:apply-templates> 
                                        </ol>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="w3-col m8 l9">
                                
                                <center>
                                    <h1> LISTA DE COMPRAS </h1>
                                </center>
                                <xsl:apply-templates select="//categoria[not(preceding::categoria=.)]" mode="conteudo">
                                    <xsl:sort select="."/>
                                </xsl:apply-templates> 
                                
                                
                                
                                
                            </div>
                            <button class="w3-button w3-sand">
                                <a href="listadecompas.html">Regressar ao topo</a>                        
                            </button>
                        </div>
                    </div>
                    
                    
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template match="categoria">
        <xsl:variable name="p" select="."/>
        
        <li id="ind-{generate-id()}"> <a href="#{generate-id()}"> <xsl:value-of select="."/> </a>
            
            
            
            <!-- se quisesse duplo indice
               <ul>
                <xsl:for-each select="//produto[categoria=$p]">
                    <xsl:sort select="designacao"/>
                    <li>
                         <xsl:value-of select="designacao"/> 
                    </li>
                </xsl:for-each>
            </ul> -->
        </li>
        
        
    </xsl:template>
    
    
    <xsl:template match="categoria" mode="conteudo">
        <xsl:variable name="p" select="."/>
        
        
        <div class="w3-col m15 8">
            <div class="w3-container ">
                
                <div class="w3-card-4">
                    <header class="w3-container w3-sand">
                        
                        <h2 id="{generate-id()}">  <xsl:value-of select="."/> </h2>
                    </header>
                    <div class="w3-container">
                        <div class="w3-container w3-border">
                            <ul>
                                <xsl:for-each select="//produto[categoria=$p]">
                                    <xsl:sort select="designacao"/>
                                    <li>
                                        
                                        <xsl:value-of select="designacao"/> 
                                        
                                        <ul> <li> Quantidade: <xsl:value-of select="quantidade"/>  </li>
                                            <li> Preço Referência: <xsl:value-of select="precoRef"/> € </li>
                                            
                                        </ul>
                                    </li>
                                </xsl:for-each>
                            </ul>
                            
                        </div>
                    </div>
                    
                </div>
            </div>
            
            <h4 class="w3-opacity">
                <center>
                    <address>
                        <a href="#top">Voltar ao topo</a>
                    </address>
                </center>
                
            </h4>
            
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
    </xsl:template>
    
    
    
    
    
    
    
    <!--  <div class="w3-col m8 l9">
            <div class="w3-container">
                
                <div class="w3-card-4">
                    <header class="w3-container w3-sand">
                        <a name="{generate-id()}"/>
                        
                            <h2> <xsl:value-of select="."/></h2>
                        
                    </header>
                    <div class="w3-container">
                        <div class="w3-container w3-border">
                            
                        </div>
                    </div>
                    <footer class="w3-container w3-sand">
                        
                    </footer>
                </div>
            </div>
        </div>
        -->
    
    
    
    
    
</xsl:stylesheet>