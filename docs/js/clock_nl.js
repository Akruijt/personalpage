function clock_nl(id)
{
        date = new Date();
        year = date.getFullYear();
        month = date.getMonth();
        months = new Array('januari', 'februari', 'maart', 'april', 'mei', 'juni', 'juli', 'augustus', 'september', 'oktober', 'november', 'december');
        d = date.getDate();
        day = date.getDay();
        days = new Array('zondag', 'maandag', 'dinsdag', 'woensdag', 'donderdag', 'vrijdag', 'zaterdag');
        h = date.getHours();
        if(h<10)
        {
                h = "0"+h;
        }
        m = date.getMinutes();
        if(m<10)
        {
                m = "0"+m;
        }
        result = ''+days[day]+' '+d+' '+months[month]+' '+year+' '+h+':'+m;
        document.getElementById(id).innerHTML = result;
        setTimeout('clock_nl("'+id+'");','1000');
        return true;
}