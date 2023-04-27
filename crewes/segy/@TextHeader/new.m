function thead = new(obj,segyrev)
%
%function thead = new(obj,segyrev)
%
% new creates a new SEG-Y rev1 textual header in ASCII format
% segyrev = [], 0='rev0' or 1='rev1' (default) or 2='rev2'
%
% Example: th = TextHeader
%          rev1thead = th.new
%          rev0thead = th.new(0)
%
% Authors: Chad Hogan, 2004
%          Kevin Hall, 2009, 2017
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

narginchk(1,2);

if isequal(nargin,1) || isempty(segyrev)
   segyrev=obj.SegyRevision;
end

thead = ...
['C 1 CLIENT                        COMPANY                       CREW NO         ';...
 'C 2 LINE            AREA                        MAP ID                          ';...
 'C 3 REEL NO           DAY-START OF REEL     YEAR      OBSERVER                  ';...
 'C 4 INSTRUMENT: MFG            MODEL            SERIAL NO                       ';...
 'C 5 DATA TRACES/RECORD        AUXILIARY TRACES/RECORD         CDP FOLD          ';...
 'C 6 SAMPLE INTERVAL         SAMPLES/TRACE       BITS/IN      BYTES/SAMPLE       ';...
 'C 7 RECORDING FORMAT        FORMAT THIS REEL        MEASUREMENT SYSTEM          ';...
 'C 8 SAMPLE CODE: FLOATING PT     FIXED PT     FIXED PT-GAIN     CORRELATED      ';...
 'C 9 GAIN  TYPE: FIXED     BINARY     FLOATING POINT     OTHER                   ';...
 'C10 FILTERS: ALIAS     HZ  NOTCH     HZ  BAND     -     HZ  SLOPE    -    DB/OCT';...
 'C11 SOURCE: TYPE            NUMBER/POINT        POINT INTERVAL                  ';...
 'C12     PATTERN:                           LENGTH        WIDTH                  ';...
 'C13 SWEEP: START     HZ  END     HZ  LENGTH      MS  CHANNEL NO     TYPE        ';...
 'C14 TAPER: START LENGTH       MS  END LENGTH       MS  TYPE                     ';...
 'C15 SPREAD: OFFSET        MAX DISTANCE        GROUP INTERVAL                    ';...
 'C16 GEOPHONES: PER GROUP     SPACING     FREQUENCY     MFG          MODEL       ';...
 'C17     PATTERN:                           LENGTH        WIDTH                  ';...
 'C18 TRACES SORTED BY: RECORD     CDP     OTHER                                  ';...
 'C19 AMPLITUDE RECOVERY: NONE      SPHERICAL DIV       AGC    OTHER              ';...
 'C20 MAP PROJECTION                      ZONE ID       COORDINATE UNITS          ';...
 'C21 PROCESSING:                                                                 ';...
 'C22 PROCESSING:                                                                 ';...
 'C23                                                                             ';...
 'C24                                                                             ';...
 'C25                                                                             ';...
 'C26                                                                             ';...
 'C27                                                                             ';...
 'C28                                                                             ';...
 'C29                                                                             ';...
 'C30                                                                             ';...
 'C31                                                                             ';...
 'C32                                                                             ';...
 'C33                                                                             ';...
 'C34                                                                             ';...
 'C35                                                                             ';...
 'C36                                                                             ';...
 'C37                                                                             ';...
 'C38                                                                             ';...
];

switch(floor(segyrev))
    case 0
        thead = [thead; ...
            'C39                                                                             ';...
            'C40 END EBCDIC                                                                  ';...
            ];
    case 1
        thead = [thead; ...
            'C39 SEG Y REV1                                                                  ';...
            'C40 END TEXTUAL HEADER                                                          ';...
            ];
    case 2
        thead = [thead; ...
            'C39 SEG Y REV' sprintf('%1.1f',segyrev)...
                            '                                                                ';...
            'C40 END TEXTUAL HEADER                                                          ';...
            ];                
    otherwise
        error(['@TextHeader/new: Unknown SEG-Y revision number: ' num2str(segyrev)]);
end



end