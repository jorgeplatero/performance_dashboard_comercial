/*Eico Y MAX*/
/*-----------------------------------------------------*/

Eixo Y Max = 
VAR vTabela = 
    ALLSELECTED('dCalendario'[Nome do Mes Abreviado], 'dCalendario'[Mes])
VAR vMaiorValor = 
    MAXX(vTabela, [Faturamento])
RETURN
    vMaiorValor * 1.5

/*Faturamento Formatado*/
/*-----------------------------------------------------*/
VAR vValor = SELECTEDMEASURE()
VAR vFormatacao = SWITCH(
    TRUE(),
    ABS(vValor) >= 1e9, FORMAT(vValor, "#,0,,,.0 Bi"),
    ABS(vValor) >= 1e6, FORMAT(vValor, "#,0,,.0 Mi"),
    ABS(vValor) >= 1e3, FORMAT(vValor, "#,0,.0 Mil"),
    FORMAT(vValor, "0")
)
RETURN
"""" & vFormatacao & """"

/*Imagem Cartao Faturamento*/
/*-----------------------------------------------------*/
Imagem Cartao Faturamento = 
/*formatacao------------------------------*/
VAR vFonte = "Segoe UI"
VAR vRotuloCategoria = "Vs. Ano Anterior"
VAR vCorCategoria = "94FE92"
/*----------------------------------------*/
VAR vValor = [Faturamento % YoY]
VAR vValorFormatado = FORMAT(vValor + 0, "+0.0%;-0.0%;-")
VAR vSeta = SWITCH(
    TRUE(),
    vValor > 0, "⮝",
    vValor < 0, "⮟"
)
VAR vCor = SWITCH(
    TRUE(),
    vValor > 0, "#94FE92",
    vValor < 0, "#FE9292",
    "#F1F1F1"
)
VAR vAnimacao = IF(
    vValor < 0, "animation"
)
RETURN
"data:image/svg+xml,

<svg viewBox='0 0 190 50' fill='none' xmlns='http://www.w3.org/2000/svg'>
    <defs>
        <style>
            #rotulo_dados, #seta {
                "&vAnimacao&": blink-1 1.2s infinite both;
            }
            @keyframes blink-1 {
                0%,
                50%,
                100% {
                    opacity: 1;
                }
                25%,
                75% {
                    opacity: 0;
                }
            }
        </style>
    </defs>
   <text fill='white' xml:space='preserve' style='white-space: pre' font-family='"&vFonte&"' font-size='12' font-weight='600' letter-spacing='0em'>
      <tspan x='84' y='37.9688'>"&vRotuloCategoria&"</tspan>
   </text>
   <text id='rotulo_dados' fill='"&vCor&"' xml:space='preserve' style='white-space: pre' font-family='Segoe UI' font-size='15' font-weight='600' letter-spacing='0em'>
      <tspan x='84' y='19.2109'>"&vValorFormatado&"</tspan>
   </text>
   <text id='seta' fill='#FE9292' xml:space='preserve' style='white-space: pre' font-family='Segoe UI' font-size='15' font-weight='600' letter-spacing='0em'>
      <tspan x='62' y='31.2109'>"&vSeta&"</tspan>
   </text>
</svg>
"

/*Imagem Tabela Cidades*/
/*-----------------------------------------------------*/
Imagem Tabela Cidades = 
/*formatacao------------------------------*/
VAR vFonte = "Segoe UI"
VAR vFonteCidadeTamanho = 12
VAR vRotuloCategoria = "Vs. Ano Anterior"
VAR vCorCidade = "#CEBCD7"
VAR vCorFaturamento = "#59B7C8"
VAR vCorMargem = "#D1783C"
VAR vCorLinha = "#B7A2C3"
/*----------------------------------------*/
VAR vCidade = SELECTEDVALUE(
    'dClientes'[Cidade]
)
VAR vValor = [Faturamento]
VAR vValorFormatado = SWITCH(
    TRUE(),
    ABS(vValor) >= 1e9, FORMAT(vValor, "#,0,,,.0 Bi"),
    ABS(vValor) >= 1e6, FORMAT(vValor, "#,0,,.0 Mi"),
    ABS(vValor) >= 1e3, FORMAT(vValor, "#,0,.0 Mil"),
    FORMAT(vValor, "0")
)
VAR vMargem = FORMAT([Margem %], "0.00%")
RETURN
"
<svg width='255' height='95' viewBox='0 0 260 65' fill='none' xmlns='http://www.w3.org/2000/svg'>
    <defs>
        <style>
            #texto_cidade {
                transition: .5s
            }
            svg:hover #texto_cidade {
                transform: translateX(115px)
            }
            #texto_faturamento {
                transition: .5s
            }
            svg:hover #texto_faturamento {
                transform: translateX(-68px)
            }
            #texto_margem {
                transition: .5s
            }
            svg:hover #texto_margem {
                transform: translateX(-68px)
            }
        </style>
    </defs>
	<g id='tabela_cidades'>
		<text id='texto_cidade' fill='"&vCorCidade&"' font-family='"&vFonte&"' font-size='"&vFonteCidadeTamanho&"'>
			<tspan x='30' y='37.9688'>"&vCidade&"</tspan>
		</text>
		<text id='texto_faturamento' fill='"&vCorFaturamento&"' font-family='Segoe UI' font-size='12'>
			<tspan x='143' y='25.9688'>"&vValorFormatado&"</tspan>
		</text>
		<text id='texto_margem' fill='"&vCorMargem&"' font-family='Segoe UI' font-size='12'>
			<tspan x='143' y='50.9688'>"&vMargem&"</tspan>
		</text>
		<line id='linha' x1='129.5' y1='56' x2='129.5' y2='11' stroke='"&vCorLinha&"'/>
	</g>    
</svg>
"