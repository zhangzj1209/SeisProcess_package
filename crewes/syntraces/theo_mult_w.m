function [pm,p]=theo_mult_w(rin,fpress)
% [pm,p]=theo_mult_w(r)
%
% THEO_MULT_W computes the multiple contamination in a 1-D p-wave
% theogram according to the algorithm in 
%	Waters, "Reflection Seismology", 1981, John Wiley, pp 128-135
%
% r ... input reflection coeficients, regularly sampled in TIME 
%			(2-way time)
%   fpress ... flag for a pressure or displacement seismogram
%            1 -> a pressure seismogram is desired
%            0 -> a displacement seismogram is desired
%          this makes no difference if fmult=0
%      ******* default = 1 ******
% pm ... output 1-D impulse response, primaries plus multiples,
%	sampled at the same times as r.
% p ... primaries only showing the effects of transmission losses
% 
% G.F. Margrave, CCR, Oct 1994
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

if(nargin<2)
    fpress=1;
end
if(fpress==0)
    fpress=2;%the code needs a 1 or 2 but the user interface is a 0 or 1.
end

%initialize a few things
r=rin(2:length(rin));
r0=rin(1);
d=zeros(size(rin));
d(1)=1;
pm=zeros(size(r));
p=zeros(size(r));

%loop over output times

factor = 1-2*(fpress-1);
% fpress=1 -> factor =1
% fpress=2 -> factor = -1;
for k=1:length(r)
	
	%zero upgoing wave at each step
	u=0.0;%upgoing primaries plus multiples
	up=0.0;%upgoing, primaries only wave

	%step from r(k) to the surface
	for j=k:-1:1

		%update downgoing wave
		d(j+1)=(1-r(j))*d(j) -factor*r(j)*u; %JKC 14feb/08

		%update upgoing wave
		u=factor*r(j)*d(j) + (1+r(j))*u; %JKC 14feb/08
        if( j==k )
            up = u;
        else
            up = (1+r(j))*up; %JKC 14feb/08
        end

	end

	%step to surface
    d(1)= -factor*r0*u;
	pm(k)=u+d(1);
	p(k)=up;
	

end

%include surface rc in final result
[m,n]=size(r); %#ok<ASGLU>
if( m== 1)
    pm = [factor*r0 pm]; %JKC 14feb/08
	p = [factor*r0 p]; %JKC 14feb/08
else
    pm = [factor*r0;pm]; %JKC 14feb/08
	p = [factor*r0;p]; %JKC 14feb/08
end