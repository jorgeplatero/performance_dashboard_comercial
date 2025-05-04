/*ADDCOLUMNS – Calendário Automática DAX*/
/*-----------------------------------------------------*/

dCalendarioDax = ADDCOLUMNS(
    CALENDARAUTO(),
    "Ano", YEAR([Date]),
    "Semestre", IF(MONTH([Date]) <= 6, 1, 2),
    "Trimestre", QUARTER([Date]),
    "Mes", MONTH([Date]),
    "Mes Nome", FORMAT([Date], "mmmm"),
    "Mes Nome Abreviado", FORMAT([Date], "mmm"),
    "Mes Ano", FORMAT([Date], "mmm/yyyy"),
    "Semana", WEEKNUM([Date]),
    "Dia", Day([Date]),
    "Ano Mes Classificacao", INT(FORMAT([Date], "yyyymm")) --coluna numérica para classificar "Mes-Ano"
) /*não podemos transformar a tabela calendário criada via DAX no Power Query*/