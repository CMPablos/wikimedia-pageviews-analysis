{% macro get_filter_titles() %}
  {% set main_pages = [
    "Main_Page",
    "Wikipedia:Portada",
    "Wikipedia:Hauptseite",
    "Wikipédia:Accueil_principal",
    "-",
    ""
  ] %}
  {% set search_pages = [
    "Special:Search",
    "Especial:Buscar",
    "Spezial:Suche",
    "Spécial:Recherche",
    "-",
    ""
  ] %}
  {% set quoted_pages = [] %}

  {% for page in main_pages + search_pages %}
    {% do quoted_pages.append("'" ~ page ~ "'") %}
  {% endfor %}

  {{ return(quoted_pages | join(", ")) }}

{% endmacro %}
