{% macro get_filter_titles() %}
  {% set filter_titles = [
    'Main_Page',
    'Wikipedia:Portada',
    'Wikipedia:Hauptseite',
    'Wikipédia:Accueil_principal'
  ] %}
  {% set search_titles = [
    'Special:Search',
    'Especial:Buscar',
    'Spezial:Suche',
    'Spécial:Recherche'
  ] %}
  {{ return(filter_titles + search_titles) }}

{% endmacro %}
