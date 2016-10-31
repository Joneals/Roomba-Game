% Installation program for EF 230 Roomba Project
% Last update: September 11, 2016
function roombaInstall
clc;
% list of files to install
files = {'roomba.m','roombaSim.m','roombaSimGUI.m','roombaSimGUI.fig'};
% location to install from
server = 'http://ef.engr.utk.edu/ef230-2016-08/projects/roomba-f2016/install/';
dlgTitle = 'Roomba Install/Update';
% display purpose and get confirmation
prompt = {
    'This program will download these EF 230 Roomba files:'
    ''
    strjoin(files,' ')
    ''
    'to this folder:'
    ''
    cd
    ''
    'Do you want to continue? '
    };
beep;
yn = questdlg(prompt, ...
    dlgTitle, ...
    'Yes','No','Yes');

if ~strcmp(yn,'Yes'), return; end

% get list of files that exist
existing_files = files( cellfun(@exist,files) > 0 );
if ~isempty(existing_files)
    % make sure it is really ok to replace them
    prompt = {'You are replacing these file(s): '
            ''
            strjoin(existing_files,' ')
            ''
            'OK to replace?'
            };
    beep;
    yn = questdlg(prompt, ...
        dlgTitle, ...
        'Yes','No','Yes');
    if ~strcmp(yn,'Yes'), return; end
end

% download the files
cnt = 0;
for i=1:length(files)
    f=files{i};
    disp(['Downloading ' f]);
    try
        websave(f,[server f]);
        cnt = cnt + 1;
    catch
        disp(['Error downloading ' f]);
        delete([f '.html']);
    end
end

if cnt == length(files)
    msg = 'Installation Successful';
    waitfor(msgbox(msg,dlgTitle));
else
    msg = 'Installation Error - see command window for details';
    waitfor(errordlg(msg,dlgTitle));
end

end %roombaInstall