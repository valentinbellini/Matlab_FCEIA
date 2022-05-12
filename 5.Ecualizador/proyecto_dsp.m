function varargout = proyecto_dsp(varargin)
% Programa original:
% http://www.mathworks.com/matlabcentral/fileexchange/3719-simulink-stereo-player-featuring-vocal-remover
% Desarrollado por: Ansuman Barik
% Traducción al español y modificación: Diego Barragán G.
% www.matpic.com
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @proyecto_dsp_OpeningFcn, ...
                   'gui_OutputFcn',  @proyecto_dsp_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
% --- Executes just before proyecto_dsp is made visible.

function proyecto_dsp_OpeningFcn(hObject, eventdata, handles, varargin)
%*-*-*-*-*CONDICIONES INICIALES-*-*-*-*-*-*-*-*-*
%Centrar la interfaz
movegui(hObject,'center')
%*******************
%Deshabilitar botones de mando
set(handles.reproducir,'Enable','off');
set(handles.pausa,'Enable','off');
set(handles.continuar,'Enable','off');
set(handles.parar,'Enable','off');
handles.output = hObject;
find_system('Name','modelo');%Buscar el modelo en el path
open_system('modelo');%Abrir el modelo
set_param('modelo/volumen','Value','0.4');%Setear el volumen en 0.4
set_param('modelo/selector','Value','7'); % Tema original por defecto
set_param('modelo/grabare','Value','0'); % Grabar OFF
% Valores iniciales de canales L y R
set_param('modelo/L','Gain','0.5');
set_param('modelo/R','Gain','0.5');
% Update handles structure
guidata(hObject, handles);
%*-*-*-*-*-FIN DE CONDICIONES INICIALES-*-*-*-*-*-*-

function varargout = proyecto_dsp_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

% *-------------E F E C T O S------------------------------
function tema_original_Callback(hObject, eventdata, handles)
%Reproducir tema original
set_param('modelo/selector','Value','7');
set(handles.el_efecto,'String','Tema original')

function ecualizador_Callback(hObject, eventdata, handles)
%Acrivar ecualizador
set_param('modelo/selector','Value','2');
set(handles.el_efecto,'String','Ecualizador')

function reverb_Callback(hObject, eventdata, handles)
%Efecto de REVERVERACIÓN
set_param('modelo/selector','Value','1')
set(handles.el_efecto,'String','Reverberación')

function coro_Callback(hObject, eventdata, handles)
%Efecto de CORO
set_param('modelo/selector','Value','5')
set(handles.el_efecto,'String','Coro')

function eco_Callback(hObject, eventdata, handles)
%Efecto de ECO
set_param('modelo/selector','Value','6')
set(handles.el_efecto,'String','Eco')

function bajos_Callback(hObject, eventdata, handles)
%Selecciona el efecto de BAJOS de la señal
set_param('modelo/selector','Value','3')
set(handles.el_efecto,'String','Bajos')

function agudos_Callback(hObject, eventdata, handles)
%Selecciona el efecto de agudos de la señal
set_param('modelo/selector','Value','4')
set(handles.el_efecto,'String','Agudos')

%**********************ECUALIZADOR--------------------------------
function freq1_Callback(h, eventdata, handles)
amplitud=get(h,'Value');
set_param('modelo/ecualizador/Gain','dB',num2str(amplitud));
set(handles.indic_1,'String',round(amplitud));

function freq2_Callback(h, eventdata, handles)
amplitud=get(h,'Value');
set_param('modelo/ecualizador/Gain1','dB',num2str(amplitud));
set(handles.indic_2,'String',round(amplitud));

function freq3_Callback(h, eventdata, handles)
amplitud=get(h,'Value');
set_param('modelo/ecualizador/Gain2','dB',num2str(amplitud));
set(handles.indic_3,'String',round(amplitud));

function freq4_Callback(h, eventdata, handles)
amplitud=get(h,'Value');
set_param('modelo/ecualizador/Gain3','dB',num2str(amplitud));
set(handles.indic_4,'String',round(amplitud));

function freq5_Callback(h, eventdata, handles)
amplitud=get(h,'Value');
set_param('modelo/ecualizador/Gain4','dB',num2str(amplitud));
set(handles.indic_5,'String',round(amplitud));

function freq10_Callback(h, eventdata, handles)
amplitud=get(h,'Value');
set_param('modelo/ecualizador/Gain9','dB',num2str(amplitud));
set(handles.indic_6,'String',round(amplitud));

function freq11_Callback(h, eventdata, handles)
amplitud=get(h,'Value');
set_param('modelo/ecualizador/Gain10','dB',num2str(amplitud));
set(handles.indic_7,'String',round(amplitud));

function freq12_Callback(h, eventdata, handles)
amplitud=get(h,'Value');
set_param('modelo/ecualizador/Gain11','dB',num2str(amplitud));
set(handles.indic_8,'String',round(amplitud));

function freq13_Callback(h, eventdata, handles)
amplitud=get(h,'Value');
set_param('modelo/ecualizador/Gain12','dB',num2str(amplitud));
set(handles.indic_9,'String',round(amplitud));

function freq14_Callback(h, eventdata, handles)
amplitud=get(h,'Value');
set_param('modelo/ecualizador/Gain13','dB',num2str(amplitud));
set(handles.indic_10,'String',round(amplitud));
%*****************************************************************
%****VOLUMEN******
function vol_Callback(h, eventdata, handles)
%Control del nivel de volumen de reproducción
volumenn=get(h,'Value');
set_param('modelo/volumen','Value',num2str(volumenn));

function reproducir_Callback(hObject, eventdata, handles)
% set_param('modelo/selector','Value','7');%Para reproducir la canción original
%Incia la simulación del modelo. Ejecuta START en el modelo--v
set_param(gcs,'SimulationCommand','Start')

function pausa_Callback(hObject, eventdata, handles)
%Pausar la simulación del modelo
set_param(gcs,'SimulationCommand','Pause')

function continuar_Callback(hObject, eventdata, handles)
%Continuar la simulación del modelo
set_param(gcs,'SimulationCommand','Continue')

function parar_Callback(hObject, eventdata, handles)
%Detener la simulación del modelo
set_param(gcs,'SimulationCommand','Stop')

%******************SELECCIONAR EL TEMA*****************
function abrir_tema_Callback(h, eventdata, handles)
%Abrir el tema a reproducir
[nombre ruta]=uigetfile('*.wav','Seleccione el tema');
if nombre == 0% Si se selecciona CANCELAR
    return
end
%La siguiente línea establece el nombre del tema en simulink
%en el bloque que reproduce la canción en formato.wav
set_param('modelo/From Wave File','FileName',fullfile(ruta,nombre));
%Habilitar los botones de mando
set(handles.reproducir,'Enable','on');
set(handles.pausa,'Enable','on');
set(handles.continuar,'Enable','on');
set(handles.parar,'Enable','on');
%*******************************************************

function figure1_DeleteFcn(hObject, eventdata, handles)
%Parar la simulación si se cierra la interfaz
try
set_param(gcs,'SimulationCommand','Stop')%Detiene la simulación
save_system%Guarda los cambios en el sistema
close_system('modelo.mdl')%Cierra el modelo
catch
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
%Acrivar ecualizador
set_param('modelo/selector','Value','2');
set(handles.el_efecto,'String','Ecualizador')

val= get(hObject,'Value');

switch val
    case 1
        preset=[5,3,-2,-3,-1,1,5,6,6,6]; % Rock
    case 2
        preset=[0,0,0,0,0,0,-4,-4,-4,-6]; %Clásico
    case 3
        preset=[-4,0,3,3,3,3,3,1,1,1]; % Live
    case 4
        preset=[-1,1,2,2,1,-1,-1,-1,-1,-1];%Pop
    case 5
        preset=[4,3,0,-2,-2,0,4,5,5,5];%Techno
    case 6
        preset=[2,1,-1,-1,0,1,3,4,4,6];%Soft
    case 7
        preset=[6,6,6,4,0,-2,-5,-7,-7,-7];%Full bass
    case 8
        preset=[-7,-7,-7,-2,1,6,12,12,12,12];%Full Treble
    otherwise
        preset=[0,0,0,-2,0,2,2,0,0,0];%Reggae
end
set(handles.freq1,'Value',preset(1));
set(handles.freq2,'Value',preset(2));
set(handles.freq3,'Value',preset(3));
set(handles.freq4,'Value',preset(4));
set(handles.freq5,'Value',preset(5));
set(handles.freq10,'Value',preset(6));
set(handles.freq11,'Value',preset(7));
set(handles.freq12,'Value',preset(8));
set(handles.freq13,'Value',preset(9));
set(handles.freq14,'Value',preset(10));


freq1_Callback(handles.freq1, eventdata, handles)
freq2_Callback(handles.freq2, eventdata, handles)
freq3_Callback(handles.freq3, eventdata, handles)
freq4_Callback(handles.freq4, eventdata, handles)
freq5_Callback(handles.freq5, eventdata, handles)
freq10_Callback(handles.freq10, eventdata, handles)
freq11_Callback(handles.freq11, eventdata, handles)
freq12_Callback(handles.freq12, eventdata, handles)
freq13_Callback(handles.freq13, eventdata, handles)
freq14_Callback(handles.freq14, eventdata, handles)


% --- Executes on button press in grabar.
function grabar_Callback(hObject, eventdata, handles)
grabar=get(hObject,'Value');
if grabar==1
    set(hObject,'String','GRABAR ON');
    set_param('modelo/grabare','Value','1');
else
    set(hObject,'String','GRABAR OFF');
    set_param('modelo/grabare','Value','0');
end


% VOLUMEN DE CANALES L Y R
% --- CANAL L
function L_slider_Callback(hObject, eventdata, handles)
volumenn=get(hObject,'Value');
set_param('modelo/L','Gain',num2str(volumenn));


% --- CANAL R
function R_slider_Callback(hObject, eventdata, handles)
%Control del nivel de volumen de reproducción
volumenn=get(hObject,'Value');
set_param('modelo/R','Gain',num2str(volumenn));



