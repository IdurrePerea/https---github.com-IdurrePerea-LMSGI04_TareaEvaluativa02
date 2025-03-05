<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat" />

<!--Módulo: LENGUAJE DE MARCAS Y SISTEMAS DE GESTIÓN DE LA INFORMACIÓN
UNIDAD DIDÁCTICA 4 - TRANSFORMACIÓN DE DATOS
Tarea Evaluativa 2
Autor: Idurre Perea Sainz
Fecha 05/03/2024
-->

    <!-- Fijamos una variable con el año deseado -->
    <xsl:variable name="año" select="'2024'" />

    <xsl:template match="/gestionParque">

        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta name="description" content="Eventos" />
                <title>titulo de la web</title>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="gastrobar.xml">Gastrobar</a>
                    <a href="atracciones.xml">Atracciones</a>
                    <a href="eventos.xml">Eventos</a>
                </header>

                <main>
                    <h1>Eventos del <xsl:value-of select="$año" /></h1>

                    <!-- Filtrar eventos con la variable año -->
                    <xsl:apply-templates select="eventos/evento[contains(fechaHora, $año)]">

                        <!-- Ordenarlos de forma descendente según el mes-->
                        <xsl:sort select="substring(fechaHora, 6, 2)" order="descending" />
                    </xsl:apply-templates>
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!--Plantilla para los eventos -->
    <xsl:template match="evento">
        <article class="eventos">
            <h4>
                <xsl:value-of select="descripcion" /> - <xsl:value-of select="count(comentarios/comentario)" /> Comentarios
            </h4>
            <ul>
                <!--Para hacer la lista usamos la plantilla de los comentarios-->
                <xsl:apply-templates select="comentarios/comentario"/>
            </ul>
        </article>
    </xsl:template>

    <!--Plantilla para los comentarios-->
    <xsl:template match="comentario">
        <li>
            <xsl:value-of select="." />
        </li>
    </xsl:template>

</xsl:stylesheet>
