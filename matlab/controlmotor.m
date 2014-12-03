function varargout = controlmotor(varargin)
% CONTROLMOTOR M-file for controlmotor.fig
%      CONTROLMOTOR, by itself, creates a new CONTROLMOTOR or raises the existing
%      singleton*.
%
%      H = CONTROLMOTOR returns the handle to a new CONTROLMOTOR or the handle to
%      the existing singleton*.
%
%      CONTROLMOTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROLMOTOR.M with the given input arguments.
%
%      CONTROLMOTOR('Property','Value',...) creates a new CONTROLMOTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before controlmotor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to controlmotor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help controlmotor

% Last Modified by GUIDE v2.5 02-Dec-2014 14:34:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @controlmotor_OpeningFcn, ...
                   'gui_OutputFcn',  @controlmotor_OutputFcn, ...
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


% --- Executes just before controlmotor is made visible.
function controlmotor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to controlmotor (see VARARGIN)

% Choose default command line output for controlmotor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes controlmotor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = controlmotor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
clc ;
clear all;


% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
s=serial('COM3','BaudRate',9600);
delete(s);
fclose(s);
clear all;
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val = str2double(get(hObject,'String'));
handles.edit1=val;

save val



% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
r=1;
n=1;
var=0;
inf=0;
sub=50;
lect=0;

delete(instrfind({'Port'},{'COM3'})); %borramos conexiones previas
global s stp

s=serial('COM3','BaudRate',9600);%declaramos el puerto
fopen(s);
stp=0;
load val
   
while r<=100
   if stp==1; 
       break;
   end
   
fprintf(s,'%u',val);
lect=fscanf(s,'%i');
var(n)=lect*60;
if n>=50
    sub=n;
    inf=n-50;
end

set(handles.text3,'String',var(n));
plot(var)
XLim([inf sub]);
YLim([0 4000])
drawnow
n=n+1;

if n>=1000
    n=100;
end


end
delete(s);
fclose(s);
clear all;

% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
global stp 
stp=1;



% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
