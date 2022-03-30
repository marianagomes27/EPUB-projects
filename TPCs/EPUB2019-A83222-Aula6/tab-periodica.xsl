<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="xhtml" indent="yes" encoding="UTF-8"></xsl:output>
    
    <xsl:template match="/">
       
            <html>
               
                <head>
                    <title> Tabela Periódica </title>
                    <meta charset="UTF-8"></meta>
                </head>
                <body>
                    <center>
                        <h1> Tabela Periódica dos Elementos</h1>
                        <table border="1">
                            <tr>
                               
                                    <th> Nº atómico</th> <th> Nome</th> <th> Símbolo</th> <th> Peso atómico</th>
                                    <th> Configuração</th>
                                    
                                
                                
                            </tr>   
                            <xsl:for-each select="//ATOM">
                                <xsl:sort select="ATOMIC_NUMBER" order="ascending" data-type="number"/>
                                
                                <tr>
                                    
                                    <td><xsl:value-of select="ATOMIC_NUMBER"/></td> <td><xsl:value-of select="NAME"/></td> <td><xsl:value-of select="SYMBOL"/>
                                    </td> <td><xsl:value-of select="ATOMIC_WEIGHT"/></td><td><xsl:value-of select="ELECTRON_CONFIGURATION"/></td>
                                    
                                    
                                    
                                </tr>
                            </xsl:for-each>
                            
                            
                        </table>
                    </center>
                    
                
                </body>
             
                    
            </html>
 
        
    </xsl:template>
    
    
    
    
    
    
    
    
</xsl:stylesheet>