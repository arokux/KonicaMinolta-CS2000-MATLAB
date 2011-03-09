function text = CS2000_deleteStoredMeasurements()
%author Sandy Buschmann, Jan Winter TU Berlin
%email j.winter@tu-berlin.de
%
% Deletes data stored in all memory numbers of the instrument.
%
% Output: text = string with information about success or error.

global s

fprintf(s,'STAD');

% Get instrument answer into file:
answer = fscanf(s);
    
fid = fopen('Temp\answers.tmp', 'w');
fprintf(fid, answer);
fclose(fid);
    
% Get instrument error-check code:
fid = fopen('Temp\answers.tmp','r');
ErrorCheckCode = fscanf(fid,'%c',4);
[tf, errOutput] = CS2000_errMessage(ErrorCheckCode);
if tf ~= 1
    text = [errOutput, 'Data could not be deleted.'];
else
    text = 'All data has been deleted.';     
end

end