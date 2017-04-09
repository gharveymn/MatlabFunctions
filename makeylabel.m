function makeylabel(varargin)
	ylabel(varargin{:})
	ylh = get(gca,'ylabel');
	set(ylh, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
	%ylp = get(ylh, 'Position');
	%set(ylh, 'Rotation',0, 'Position',ylp, 'VerticalAlignment','middle', 'HorizontalAlignment','right')
end

