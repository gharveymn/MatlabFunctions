function makexlabel(varargin)
	xlabel(varargin{:})
	xlh = get(gca,'xlabel');
	set(xlh, 'Units', 'Normalized', 'Position', [0.5, -0.07, 0]);
	pos = get(gca,'Position');
	pos(2) = 0.13;
	set(gca,'Position',pos);
	%xlp = get(xlh, 'Position');
	%set(xlh, 'Rotation',0, 'Position',xlp, 'VerticalAlignment','top', 'HorizontalAlignment','center')
end

