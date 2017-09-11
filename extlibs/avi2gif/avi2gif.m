function avi2gif
	
	% This program converts AVI video file into an animated GIF file.
	% The GIF format have advantages especially in Power-Point presentation,
	% and in internet browsers.
	%
	% Modified by Gene Harvey, May 2017.
	
	
	clear all
	[file_name,file_path]=uigetfile({'*.avi','AVI video files'},'Select Video file');
	[file_name2,file_path2]=uiputfile('*.gif','Save as animated GIF',[file_path,file_name(1:end-4)]);
 	videoObj=VideoReader([file_path,file_name]);
	
	lps=questdlg('Select the number of loops:','Loops','Forever','None','Other','Forever');
	switch lps
		case 'Forever'
			loops=inf;
		case 'None'
			loops=1;
		case 'Other'
			loops=inputdlg('Enter number of loops: ','Loops');
			loops=str2num(loops{1});
	end
 	fps=videoObj.FrameRate;
	giffps=inputdlg('Enter the number frames per second:','Delay',1,{num2str(fps)});
	delay=1/(str2double(giffps{1}));
	
	sz=inputdlg({'Width','Height'},'Enter the size of your GIF',1,{num2str(videoObj.Width),num2str(videoObj.Height)});
	szx = str2num(sz{1});
 	szy = str2num(sz{2});
	
	skip=inputdlg('Enter the skip between frames','Skip',1,{'0'});
	skip = str2num(skip{1});
	

	
	h = waitbar(0,'0% done','name','Progress') ;
	
	numFrames = videoObj.Duration*fps;
	
	for i=1:numFrames
		if strcmpi(videoObj.VideoFormat,'RGB24')
			frame = readFrame(videoObj);
			[M,c_map]= rgb2ind(frame,256);
		else
			M=videoObj.cdata;
			c_map=videoObj.colormap;
		end
		
		[M,c_map] = imresize(M,c_map,[szy,szx]);
		
		if i==1
			imwrite(M,c_map,[file_path2,file_name2],'gif','LoopCount',loops,'DelayTime',delay)
		elseif(mod(i,skip)==0)
			imwrite(M,c_map,[file_path2,file_name2],'gif','WriteMode','append','DelayTime',delay)
		end
		waitbar(i/numFrames,h,[num2str(round(100*i/numFrames)),'% done']);
	end
	close(h);
	msgbox('Finished Successfully!')
	
end