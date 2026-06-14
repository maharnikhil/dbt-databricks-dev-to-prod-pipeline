{%- set countries = ["USA","India","Canada","Brazil","Alberia","Germany","The Philippines"] -%}

{%- for i in countries -%}
    {%- if i!= "India" -%}    
        {{i}}
    {%- else -%}
        I born in {{i}}
    {%- endif %}    
{% endfor %}        