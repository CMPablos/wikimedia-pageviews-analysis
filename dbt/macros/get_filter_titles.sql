{% macro get_filter_titles() %}
  {% set main_pages = [
    "Main_Page",
    "Wikipedia:Portada",
    "Wikipedia:Hauptseite",
    "Wikipédia:Accueil_principal"
  ] %}
  {% set search_pages = [
    "Special:Search",
    "Especial:Buscar",
    "Spezial:Suche",
    "Spécial:Recherche"
  ] %}
  {% set other_pages = [
    "Wikipedia:Featured_pictures"
  ] %}
  {% set empty_pages = [
    "-",
    ""
  ] %}
  {% set quoted_pages = [] %}

  {% for page in main_pages + search_pages + empty_pages + other_pages %}
    {% do quoted_pages.append("'" ~ page ~ "'") %}
  {% endfor %}

  {{ return(quoted_pages | join(", ")) }}

{% endmacro %}
