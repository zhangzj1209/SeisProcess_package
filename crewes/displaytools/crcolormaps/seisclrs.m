function s=seisclrs(m,pct)
% SEISCLRS - Black-White
%
% s=seisclrs(m,pct)
%
% seisclrs creates a gray-level color map designed to display
% seismic data using plotimage.
% m ... number of gray levels
%  ***** default is determined by the colormap size in gcf *****
% pct ... percentage of the colormap that transitions between 
%	black and white. 100 gives a linear ramp while 1 gives an
%	abrupt transition.
%  ***** default is 50 *******
% s ... matrix of size [m,3] giving the gray levels. Each column is
%	is identical.
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

%
if(nargin < 2); pct=50; end
if( nargin < 1)
    m = size(get(groot,'DefaultFigureColormap'),1);
end

if(pct>100 || pct <1); disp('gray_percentage set poorly in seisclrs'); end
glen = round(.5*pct*m/100);
blen=floor(m/2)-glen;
wlen=m-blen-2*glen;
%blen=m/2-glen;
%wlen=m-blen-2*glen;
grad=linspace(0,1,2*glen);
g=[zeros(blen,1);grad(1:2*glen)';ones(wlen,1)];
g=flipud(g);
s = [g g g];
global NOBRIGHTEN
if(isempty(NOBRIGHTEN)); nobrighten=0; else nobrighten=NOBRIGHTEN; end
if(~nobrighten)
	s= brighten(s,.5);
end