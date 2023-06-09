function plotcolormaps(trimmaps)
%PLOTCOLORMAPS - Plot samples of all color maps
%
% plotcolormaps(trimmaps)
%   trimmaps ... true (Default); remove maps that are not typically useful
%                for our nefarious purposes
%
% Plot a sorted list of Matlab and CREWES color maps
%
% See also: lscmaps, listmatcolormaps, listcrcolormaps, listcolormaps
%
%
% NOTE: This SOFTWARE may be used by any individual or corporation for any purpose
% with the exception of re-selling or re-distributing the SOFTWARE.
% By using this software, you are agreeing to the terms detailed in this software's
% Matlab source file.

% BEGIN TERMS OF USE LICENSE
%
% This SOFTWARE is maintained by the CREWES Project at the Department
% of Geology and Geophysics of the University of Calgary, Calgary,
% Alberta, Canada.  The copyright and ownership is jointly held by
% its 'AUTHOR' (identified above) and the CREWES Project.  The CREWES
% project may be contacted via email at:  crewesinfo@crewes.org
%
% The term 'SOFTWARE' refers to the Matlab source code, translations to
% any other computer language, or object code
%
% Terms of use of this SOFTWARE
%
% 1) This SOFTWARE may be used by any individual or corporation for any purpose
%    with the exception of re-selling or re-distributing the SOFTWARE.
%
% 2) The AUTHOR and CREWES must be acknowledged in any resulting publications or
%    presentations
%
% 3) This SOFTWARE is provided "as is" with no warranty of any kind
%    either expressed or implied. CREWES makes no warranties or representation
%    as to its accuracy, completeness, or fitness for any purpose. CREWES
%    is under no obligation to provide support of any kind for this SOFTWARE.
%
% 4) CREWES periodically adds, changes, improves or updates this SOFTWARE without
%    notice. New versions will be made available at www.crewes.org .
%
% 5) Use this SOFTWARE at your own risk.
%
% END TERMS OF USE LICENSE

if nargin<1
    trimmaps = true;
end

maxcmaps = 100;
cmaps = listcolormaps(maxcmaps,trimmaps);
nmaps = length(cmaps);

ncolors = 64;
x = 1:ncolors;

figure;
for ii = 1:nmaps
   subplot(nmaps,1,ii);

   %plot x as a scaled image 
   h = imagesc(x);
   
   %add a title
   if ii == 1
       title('Matlab and CREWES color maps');
   end
   
   %set colormap for this subplot
   colormap(h.Parent,cmaps{ii});
   
   %turn off x and y axis numberlines and labels
   set(h.Parent,'xtick',[],'ytick',[]);
   
   %label with colormap name
   ylabel(cmaps{ii},'VerticalAlignment','middle','HorizontalAlignment','right','Rotation',0);
end