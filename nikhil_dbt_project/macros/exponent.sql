{% macro exponent(col1,col2) %}
POWER({{col1}},{{col2}})
{% endmacro %}