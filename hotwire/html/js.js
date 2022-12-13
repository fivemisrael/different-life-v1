var elems = null;
addEventListener("message", function(e)
{
	if(elems)
	{
		var item = e.data
		if(item.meta)
		{
			if(item.meta == "show")
				elems.display.style.display = "block";
			if(item.meta == "hide")
				elems.display.style.display = "none";
			if(item.meta == "updatebar")
			{
				elems.bar.style.left = "calc(50% - "+(Math.floor((item.bar/item.maxbar)*300)-150)+"px)";
				elems.bar.style.width = Math.floor((item.bar/item.maxbar)*300)+"px";
			}
			if(item.meta == "text")
				elems.text.innerHTML = item.text;
			if(item.meta == "tiptext")
				elems.tiptext.innerHTML = item.text;
		}
	}
});

window.onload = function()
{
	elems = {};
	var elems1 = document.querySelectorAll("[id]");
	for(var i = 0; i < elems1.length; i++)
		elems[elems1[i].id] = elems1[i];
}