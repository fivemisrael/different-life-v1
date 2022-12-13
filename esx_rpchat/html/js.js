
addEventListener("message", function(event)
{
    let item = event.data;
    if(item.meta == "me")
	{
		document.getElementById("memessage").innerHTML = item.html;
	}
	if(item.meta == "do")
	{
		document.getElementById("domessage").innerHTML = item.html;
	}
});