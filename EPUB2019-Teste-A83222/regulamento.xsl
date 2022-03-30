<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        
        <fo:root>
            <!-- Aqui geramos a nossa estrutur de página ( horizontal, vertical, A4,A5,... -->
            <fo:layout-master-set>
                <fo:simple-page-master 
                    master-name="A4" page-width="210mm"
                    page-height="297mm"
                    margin-top="1cm"
                    margin-bottom="1cm"
                    margin-left="1cm"
                    margin-right="1cm">
                    
                    <fo:region-body margin="3cm"/>
                    <fo:region-before extent="2cm"/>
                    <fo:region-after extent="2cm"/>
                    <fo:region-start extent="2cm"/>
                    <fo:region-end extent="2cm"/>
                    
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <!-- Capa.................... -->
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">  <!-- utilizamos o flow para colocar conteúdo na região central -->
                    <fo:block font-size="25pt" 
                        space-before="3cm"
                        font-family="Bookman old style" text-align="center"> Regulamento de prova desportiva: Trail das Andorinhas</fo:block>
                    <fo:block space-before="2cm" text-align="center">
                        <fo:external-graphic src="povoa.jpg" scaling="uniform" content-width="7cm"/>
                    </fo:block>
                    <fo:block font-size="13pt" font-family="Bookman old style" space-before="2cm" text-align="center"> TRAIL DAS ANDORINHAS (4ª edição) – 15 de DEZEMBRO DE 2019 </fo:block>
                </fo:flow>
            </fo:page-sequence>
            
            <!-- fim da capa.................. -->
            
            <!-- Conteudo do regulamnento................... -->
            
            <fo:page-sequence master-reference="A4">
                
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="right" font-size="10pt"> Regulamento Desportivo- Trail das Andorinhas</fo:block>
                    
                    <fo:block>
                        <fo:leader leader-pattern="rule" leader-length="100%"></fo:leader>
                    </fo:block>
                </fo:static-content>
                
                <fo:static-content flow-name="xsl-region-start">
                    <fo:block>
                        <fo:external-graphic src="povoa.jpg" scaling="uniform" content-width="1.5cm"/>
                    </fo:block>
                </fo:static-content>
                
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center">
                        <fo:leader leader-pattern="use-content" leader-length="5cm">-</fo:leader> 
                        <fo:page-number/>
                        <fo:leader leader-pattern="use-content" leader-length="5cm">-</fo:leader>
                    </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="xsl-region-body">
                    
                    <fo:block font-size="18pt" color="#ffffff" font-weight="bold" space-before="1cm" space-after="1cm">REGULAMENTO</fo:block>
                    
                  
                    <xsl:apply-templates mode="regulamento"/>
                        
                    
                </fo:flow>
            </fo:page-sequence>
            
            
            
        </fo:root>
        
    </xsl:template>
    
    
    
    <!-- template da apresentacao-->
    
    <xsl:template mode="regulamento" match="apresentacao">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            1-APRESENTAÇÃO: 
        </fo:block>
        
        <fo:block>
            <fo:block space-after="1cm">
                Designação: <xsl:value-of select="designacao"/>
            </fo:block>   
            
            <fo:block space-after="1cm">
                Tipo de Prova: <xsl:value-of select="tipoprova"/> 
            </fo:block>   
            <fo:block space-after="1cm">
                 Distância:  <xsl:value-of select="distancia"/> 
            </fo:block>   
   
        </fo:block>

    </xsl:template>
    
    <xsl:template mode="regulamento" match="organizacao">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            2-ORGANIZAÇÃO: 
        </fo:block>
        
      
            <xsl:for-each select="pontosrelevantes">
                <fo:block text-align-last="justify" space-after="2mm">-
                    <xsl:value-of select="."/> 
                    
                </fo:block>
            </xsl:for-each>
        
       
       
        
    </xsl:template>
    
    <xsl:template mode="regulamento" match="recomendacoes">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            3-RECOMENDAÇÕES: 
        </fo:block>
 
        <xsl:for-each select="recomendacao">
            <fo:block text-align="justify" space-after="2mm">-
                <xsl:value-of select="."/> 
            </fo:block>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template mode="regulamento" match="inscricoes">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            4-INSCRIÇÕES: 
        </fo:block>
        
        <fo:block>
            <fo:block space-after="1cm">
                <xsl:value-of select="info"/>
            </fo:block>   
            
            <fo:block space-after="1cm">
                Trail-Longo:  <xsl:value-of select="trail/longo/infoespecifica"/> 
            </fo:block>  
            <fo:block space-after="1cm">
                Trail-Curto:  <xsl:value-of select="trail/longo/infoespecifica"/> 
            </fo:block>  
            
            
            
            <fo:block space-after="1cm">
                Preços regulares: <xsl:value-of select="precos/regulares"/> 
            </fo:block>   
            <fo:block space-after="1cm">
                Preços Especiais:  <xsl:value-of select="precos/especiais"/> 
            </fo:block>   
            
            
            <xsl:for-each select="paragrafos">
                <fo:block text-align="justify" space-after="2mm">
                    <xsl:value-of select="."/> 
                </fo:block>
            </xsl:for-each>
            <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
                4.1 – Material incluído na inscrição:
            </fo:block>
            
            
            <xsl:for-each select="materialincluido/material">
                
                <fo:block text-align="justify" space-after="2mm">-
                    <xsl:value-of select="."/> 
                </fo:block>
            </xsl:for-each>
     
     
        </fo:block>
        
        

        
    </xsl:template>
    
    
    
    <xsl:template mode="regulamento" match="dataehora">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            5 – DATA E HORA DA REALIZAÇÃO DAS PROVAS 
        </fo:block>
        
        <fo:block space-after="1cm">
            Trail-Longo:  <xsl:value-of select="trail/longo/infoespecifica"/> , Trail-Curto:  <xsl:value-of select="trail/longo/infoespecifica"/> , Caminhada:  <xsl:value-of select="trail/caminhada/infoespecifica"/> 
        </fo:block>  
        
            
    </xsl:template>
    
    <xsl:template mode="regulamento" match="percurso">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            6 – MAPA / PERFIL ALTIMÉTRICO / DESCRIÇÃO DO PERCURSO
            
        </fo:block>
        
        <fo:block space-after="1cm">
            <xsl:value-of select="."/> 
        </fo:block>  
        
        
        
        
        
        
    </xsl:template>
    
    <xsl:template mode="regulamento" match="materialobrigatorio">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            7 – MATERIAL OBRIGATÓRIO
            
        </fo:block>
        
        <fo:block space-after="1cm">
            Trail-Longo:  <xsl:value-of select="trail/longo/infoespecifica"/> 
        </fo:block>  
        <fo:block space-after="1cm">
            Trail-Curto:  <xsl:value-of select="trail/longo/infoespecifica"/> 
        </fo:block>  
        
        <fo:block space-after="1cm">
            Caminhada:  <xsl:value-of select="trail/caminhada/infoespecifica"/> 
        </fo:block>  
        
        
        
        <fo:block space-after="1cm" text-align="justify">
            <xsl:value-of select="infoadicional"/> 
        </fo:block>  
        
    </xsl:template>
    
    
    <xsl:template mode="regulamento" match="marcacao">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            8 – MARCAÇÃO E CONTROLOS
            
            
        </fo:block>
        
        <xsl:for-each select="pontosrelevantes">
            
            <fo:block text-align="justify" space-after="2mm">-
                <xsl:value-of select="."/> 
            </fo:block>
        </xsl:for-each>
        
    </xsl:template>
    
    <xsl:template mode="regulamento" match="tempolimite">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            9 – TEMPO LIMITE/BARREIRA HORÁRIA
            
            
        </fo:block>
        
        <fo:block space-after="1cm" text-align="justify">
            Trail-Longo:  <xsl:value-of select="trail/longo/infoespecifica"/> 
        </fo:block>  
        <fo:block space-after="1cm" text-align="justify">
            Trail-Curto:  <xsl:value-of select="trail/longo/infoespecifica"/> 
        </fo:block>  
        
        <fo:block space-after="1cm" text-align="justify">
            Caminhada:  <xsl:value-of select="trail/caminhada/infoespecifica"/> 
        </fo:block>  
        
        
    </xsl:template>
   
   
    <xsl:template mode="regulamento" match="abastecimentos">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            10 – ABASTECIMENTOS
            
            
        </fo:block>
        
        <fo:block space-after="1cm" text-align="justify">
            Trail-Longo:  <xsl:value-of select="trail/longo/infoespecifica"/> 
        </fo:block>  
        <fo:block space-after="1cm" text-align="justify">
            Trail-Curto:  <xsl:value-of select="trail/longo/infoespecifica"/> 
        </fo:block>  
        
        <fo:block space-after="1cm" text-align="justify">
            Caminhada:  <xsl:value-of select="trail/caminhada/infoespecifica"/> 
        </fo:block>  
        
        <xsl:for-each select="paragrafos">
            <fo:block text-align="justify" space-after="2mm">
                <xsl:value-of select="."/> 
            </fo:block>
        </xsl:for-each>
        
        
    </xsl:template>
    
    
    
    
    <xsl:template mode="regulamento" match="premios">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            11 – CLASSIFICAÇÕES, CATEGORIAS E PRÉMIOS

        </fo:block>
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            11.1 – Definição do local e hora de entrega de prémios
        </fo:block>
        
        <fo:block text-align="justify" space-after="1cm">
            <xsl:value-of select="localehoraent"/> 
        </fo:block>  
        
        
        <xsl:for-each select="categorias/categoria">
            <fo:block text-align="justify" space-after="2mm">
                <xsl:value-of select="designacao"/> :
                <xsl:value-of select="descricao"/> 
            </fo:block>
        </xsl:for-each>
        
        
        <fo:block text-align="justify" space-after="1cm">
            Classificação por Equipas:   <xsl:value-of select="classificacao"/> 
        </fo:block>  
        
        <fo:block text-align="justify" space-after="1cm">
            Equipa mais representada:   <xsl:value-of select="premio"/> 
        </fo:block>  
        <fo:block text-align="justify" space-after="1cm">
            Pedidos de Correção:   <xsl:value-of select="periodocorrecao"/> 
        </fo:block>  
        
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
           RESPONSABILIDADE
            
            
        </fo:block>
         
            <xsl:for-each select="responsabilidade/pontosrelevantes">
                <fo:block text-align="justify" space-after="2mm">-
                    <xsl:value-of select="."/> 
                </fo:block>
            </xsl:for-each>
            
          
        
        
    </xsl:template>
    
    
    <xsl:template mode="regulamento" match="direitosimagem">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            12- DIREITOS DE IMAGEM
            
            
            
        </fo:block>
        
        <fo:block text-align="justify" space-after="1cm">
            <xsl:value-of select="."/> 
        </fo:block>  
        
    </xsl:template>
    
    
    <xsl:template mode="regulamento" match="cancelamento">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            13 - CANCELAMENTO DO EVENTO
            
            
            
        </fo:block>
        
        <xsl:for-each select="paragrafos">
            <fo:block text-align="justify" space-after="2mm">
                <xsl:value-of select="."/> 
            </fo:block>
        </xsl:for-each> 
        
    </xsl:template>
    
    
    <xsl:template mode="regulamento" match="responsabilidade">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            14 – RESPONSABILIDADE E AMBIENTE
            
            
            
        </fo:block>
        
        <xsl:for-each select="paragrafos">
            <fo:block text-align="justify" space-after="2mm">
                <xsl:value-of select="."/> 
            </fo:block>
        </xsl:for-each> 
        
    </xsl:template>
    
    <xsl:template mode="regulamento" match="outros">
        <fo:block    text-align="left" font-weight="bold" space-before="5mm" space-after="2mm"> 
            15 – OUTROS 
            
            
            
        </fo:block>
        
        <fo:block text-align="justify" space-after="1cm">
            <xsl:value-of select="."/> 
        </fo:block>  
        
    </xsl:template>
    
    
    
    
    
    
</xsl:stylesheet>