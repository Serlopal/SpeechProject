function varargout = gui1(varargin)
% GUI1 MATLAB code for gui1.fig
%      GUI1, by itself, creates a new GUI1 or raises the existing
%      singleton*.
%
%      H = GUI1 returns the handle to a new GUI1 or the handle to
%      the existing singleton*.
%
%      GUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI1.M with the given input arguments.
%
%      GUI1('Property','Value',...) creates a new GUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui1

% Last Modified by GUIDE v2.5 08-Mar-2017 11:30:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before gui1 is made visible.
function gui1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui1 (see VARARGIN)

% Choose default command line output for gui1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using gui1.
if strcmp(get(hObject,'Visible'),'off')
%     plot(rand(5));
end

% UIWAIT makes gui1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in update_button.
function update_button_Callback(hObject, eventdata, handles)
% hObject    handle to update_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;

%%gender selector to index the database
popup_sel_index = get(handles.slider_gender, 'Value');
%% global variables
global slider_gender;global dict;global db;global winning_audios;global samples;

switch popup_sel_index
    case 1
        slider_gender = 'men';
    case 2
        slider_gender = 'women';    
    case 3
        slider_gender = 'kids';
end

%Analysis method selector (Formants-SOM)
popup_sel_index = get(handles.slider_method, 'Value');
switch popup_sel_index
    case 1
        cd ..\database_process\
        db = strcat('database_process\vowels_',slider_gender);
        
        [dict, vowels_men_formants, indexes_men] = ...
            formants(strcat('audio_files_',slider_gender),strcat('times_',slider_gender,'_ordered.txt'));
        plot_clusters(vowels_men_formants, indexes_men);
        fig  = gcf;       
        dcm_obj = datacursormode(fig);
        set(dcm_obj,'UpdateFcn',{@cursor_formants,handles});
        cd ..\gui\
        
    case 2
        cd ..\som\
        %%database used
        db = strcat('database_process\vowels_',slider_gender);
        %% SOM learning parameters
        epochs = 50;
        samples = 540; %12 is a complete speaker
        output_nodes = 1600;
        neig_size = 5;
        eta = 0.5;
        tau = 20;
        
        %%precomputed switch
        precomputed_SOM = true;
        
        
        switch precomputed_SOM
            case true
                %%loading data to speed up desmostration
                s = strcat('saved_SOM/wa_',slider_gender,'1');
                winning_audios = load(s);
                winning_audios = winning_audios.winning_audios;
                s = strcat('saved_SOM/img_',slider_gender,'1');
                img = load(s);
                img = img.img;
                
            case false

                [winning_audios, img] = som(db, epochs, samples, output_nodes, neig_size, eta, tau);

                %%Optional code to save data to disk
                %s = strcat(pwd,'\','saved_SOM', '\' ,'wa1.mat');
                %save(s,'winning_audios');
                %s = strcat(pwd,'\','saved_SOM', '\' ,'img1.mat');
                %save(s,'img');
        end
        
        %%plot SOM results
        plot_som(img);
        %%allow sound playback selected samples
        fig  = gcf;
        dcm_obj = datacursormode(fig);
        set(dcm_obj,'UpdateFcn',{@cursor_SOM,handles});
        cd ..\gui\
              
end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in slider_method.
function slider_method_Callback(hObject, eventdata, handles)
% hObject    handle to slider_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns slider_method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from slider_method
% --- Executes during object creation, after setting all properties.
function slider_method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Formants', 'SOM'});

%%cursor function to
function output_txt = cursor_SOM(f,event_obj,handles)
global pos;global winning_audios;global db;global slider_gender;global samples;
    
    
    %%load audio routes for db
    pos = get(event_obj,'Position');
    disp(pos);
    
    %%get audio
    index = winning_audios(pos(2),pos(1));
    output_txt = sprintf('(%d, %d)',pos(2), pos(1));

    %%index (samples+1) represents a cell of the map where no sample has
    %%fallen, therefore no audio should be played
    if (index==samples+1)%
        ;
    else
        %%load and play audio
        cd ..
        cd (strcat(pwd,'\',db));   
        dirinfo = dir();
        parent_dir = ismember( {dirinfo.name}, {'.', '..'});
        dirinfo(parent_dir) = [];
        s = strcat(dirinfo(index).folder,'\',dirinfo(index).name);
        
        %%back to gui folder
        cd ..\..\gui\
        
        %%play vowel sound
        [ys,Fs] = audioread(s);
        sound(ys, Fs);
               
        %%display spectogram
        cd ..
        cd (strcat(pwd,'\','som\vowels_',slider_gender,'_spectrograms_HD'));
        dirinfo = dir();
        parent_dir = ismember( {dirinfo.name}, {'.', '..'});
        dirinfo(parent_dir) = [];
        spectrogram = imread(strcat(dirinfo(index).folder,'\',dirinfo(index).name));
        imshow(spectrogram,'Parent', handles.axes2);
        
        %back to gui folder
        cd ..\..\gui\
        
    end
    
function output_txt = cursor_formants(f,event_obj,handles)
global pos;global dict;global db;global slider_gender;

    %%load audio routes for db
    pos = get(event_obj,'Position');
    disp(pos);
    
    %%get audio
    keySet = strcat(num2str(pos(1)),num2str(pos(2)));
    if (isKey(dict,keySet))
        index = dict(keySet);
        output_txt = sprintf('(%d, %d)',pos(1), pos(2));

        %%load audio
        cd ..
        cd (strcat(pwd,'\',db));  
        dirinfo = dir();
        parent_dir = ismember( {dirinfo.name}, {'.', '..'});
        dirinfo(parent_dir) = [];
        s = strcat(dirinfo(index).folder,'\',dirinfo(index).name);

        cd ..
        cd ..\gui\

        [ys,Fs] = audioread(s);
        sound(ys, Fs);
        
        
        %%display spectogram
        cd (strcat('..\som\vowels_',slider_gender,'_spectrograms_HD'));
        dirinfo = dir();
        parent_dir = ismember( {dirinfo.name}, {'.', '..'});
        dirinfo(parent_dir) = [];
        spectrogram = imread(strcat(dirinfo(index).folder,'\',dirinfo(index).name));
        imshow(spectrogram,'Parent', handles.axes2);

        %back to gui folder
        cd ..\..\gui\

    end
    
% --- Executes on button press in slider_gender.
function slider_gender_Callback(hObject, eventdata, handles)
% hObject    handle to slider_gender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function slider_gender_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_gender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Men', 'Women','Kids'});
