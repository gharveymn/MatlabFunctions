function latexlabels(x,y)
	makexlabel(x,'Interpreter','latex','fontsize',14);
	makeylabel(['\everymath{\displaystyle}',y],'Interpreter','latex','fontsize',14,'rot',0);
end

