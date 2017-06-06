function screenshot(name)
	%SCREENSHOT takes a screenshot with export_fig
	
	mkdirifnotexist('output')
	
	if(numel(name) < 4 || name(end-3:end) ~= '.png')
		name = horzcat(name,'.png');
	end
	
	set(gcf,'color','w');
	export_fig(['output/' name],'-r600')
end