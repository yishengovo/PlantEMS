import os
a = os.listdir()
for i in a:
	ii = i.split('.')
	if ii[-1] == 'jpg':

		picname = ii[0].split('_')[0][0]+'.'+ii[0].split('_')[-2]

		line = '<li><a href="#" ><img src="plant_figure/'+i+'" alt=""><span class="name_pic">'+picname+'</span></a></li>'
		print(line)



