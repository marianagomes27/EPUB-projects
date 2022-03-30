<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="xhtml" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <title> Project Record-TP4 </title>
                <meta charset="UTF-8"/>
            </head>
            <body>
                <center>
                    <span style="color:#003399;">
                        <h1> Project Record </h1>
                    </span>
                    
                   
                </center>
                <xsl:apply-templates select="//metadata"/>
                <xsl:apply-templates select="//workteam"/>
                <xsl:apply-templates select="//abstract"/>
                <xsl:apply-templates select="//deliverables"/>
                
                <hr width="100%"></hr>
                
                <table border="0" width="100%">
                    <tr>
                        <td>
                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/EEUMLOGO.png/200px-EEUMLOGO.png" height="90" width="100"/>
                        </td>
                        <td align="right" valign="top"> MIEBIOM - Ramo Informática Médica | 4º Ano </td>
                    </tr>
                </table>
            </body>
            
        </html>
        
    </xsl:template>
    
    <xsl:template match="metadata">
        <hr width="100%"></hr>
        
        <TABLE width="100%" border="0">
            <TBODY>
                <TR>
                    <TD valign="top" width="50%">
                        <span style="color:#003399;">
                            <b> KEYNAME:</b>
                        </span>  <xsl:value-of select="keyname"/></TD>
                    <TD valign="top" width="50%"><span style="color:#003399;">
                        <b> BEGIN DATE:</b>
                    </span>  <xsl:value-of select="bdate"/>  </TD>
                </TR>
                <TR>
                    <TD valign="top" width="50%"> <span style="color:#003399;">
                        <b> TITLE:</b>
                    </span>  <xsl:value-of select="title"/>  </TD>
                    <TD valign="top" width="50%"><span style="color:#003399;">
                        <b> END DATE:</b>
                    </span>  <xsl:value-of select="edate"/>  </TD>
                </TR>
                <TR>
                    <TD valign="top" width="50%"><span style="color:#003399;">
                        <b> SUBTITLE:</b>
                    </span>   <xsl:value-of select="subtitle"/> </TD>
                    <TD valign="top" width="50%"> <span style="color:#003399;">
                        <b> SUPERVISOR:</b>
                    </span>  <a href="{//supervisor/homepage}"> <xsl:value-of select="//supervisor/name"/> </a> </TD>
                </TR>
            </TBODY>
        </TABLE>
        <hr width="100%"></hr>

    </xsl:template>
   
    
    <xsl:template match="workteam">
        <span style="color:#003399;">
            <h2> WorkTeam </h2>
        </span>
        
       
                <ul>
                    <li> <span style="color:#003399;">
                        <b> Name: </b>
                    </span>  <xsl:value-of select="//member/name"/> </li>
                    <li>  <span style="color:#003399;">
                        <b> Mid: </b>
                    </span>  <xsl:value-of select="//member/mid"/> </li>
                    <li> <span style="color:#003399;">
                        <b> Email: </b>
                    </span>  <a href="mailto:{email}">
                        <xsl:value-of select="//member/email"/>
                    </a> </li>
                    
              </ul>   
        
    </xsl:template>
    
   
    
    <xsl:template match="abstract">
        <span style="color:#003399;">
            <h2> Abstract </h2>
           
        </span>
        
      <xsl:for-each select="p">
            <p align="justify" style="line-height:130%">
                <xsl:value-of select="."/>
                
                
            </p>
           
          
      </xsl:for-each>

   
    </xsl:template>
    <xsl:template match="i">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    
    
  
    
    <xsl:template match="deliverables">
        <span style="color:#003399;">
            <h2> Deliverables </h2>
            <xsl:apply-templates/>
        </span>

    </xsl:template>
    
    <xsl:template match="deliverable">
        
        <ul>
                <li><a href="{@url}" target="_blank">
                    <xsl:value-of select="."/>
                </a></li>
           
        </ul>
  
    </xsl:template>
    
   
   
    
    
    
    
</xsl:stylesheet>