<?xml version="1.0" encoding="UTF-8" standalone="no" ?><w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:body><w:p><w:pPr><w:pStyle w:val="code"/></w:pPr><w:r><w:t><![CDATA[classdef InterfaceAideGlobalFolderAlgoRIM < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        HelpGlobalfolderPanel  matlab.ui.container.Panel
        Text                   matlab.ui.control.Label
        Image                  matlab.ui.control.Image
        Text_2                 matlab.ui.control.Label
        Text_3                 matlab.ui.control.Label
        Text_4                 matlab.ui.control.Label
        FolderhierarchyLabel   matlab.ui.control.Label
        NoteimagesandRAW_DATAfoldersshouldnotberenamedLabel  matlab.ui.control.Label
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [200 100 668 407];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.Scrollable = 'on';

            % Create HelpGlobalfolderPanel
            app.HelpGlobalfolderPanel = uipanel(app.UIFigure);
            app.HelpGlobalfolderPanel.Title = 'Help: Global folder';
            app.HelpGlobalfolderPanel.BackgroundColor = [1 1 1];
            app.HelpGlobalfolderPanel.FontWeight = 'bold';
            app.HelpGlobalfolderPanel.FontSize = 14;
            app.HelpGlobalfolderPanel.Position = [1 1 668 407];

            % Create Text
            app.Text = uilabel(app.HelpGlobalfolderPanel);
            app.Text.FontWeight = 'bold';
            app.Text.Position = [21 343 275 22];
            app.Text.Text = 'Please select one of these surrounded folders:';

            % Create Image
            app.Image = uiimage(app.HelpGlobalfolderPanel);
            app.Image.Position = [21 52 270 267];
            app.Image.ImageSource = 'HelpGlobalFolder.png';

            % Create Text_2
            app.Text_2 = uilabel(app.HelpGlobalfolderPanel);
            app.Text_2.FontColor = [0.4941 0.1843 0.5569];
            app.Text_2.Position = [315 297 252 22];
            app.Text_2.Text = 'Purple: Launch reconstruction on each project';

            % Create Text_3
            app.Text_3 = uilabel(app.HelpGlobalfolderPanel);
            app.Text_3.FontColor = [1 0 0];
            app.Text_3.Position = [315 266 261 22];
            app.Text_3.Text = 'Red: Launch reconstruction on red project only ';

            % Create Text_4
            app.Text_4 = uilabel(app.HelpGlobalfolderPanel);
            app.Text_4.FontColor = [0.0745 0.6235 1];
            app.Text_4.Position = [315 233 268 22];
            app.Text_4.Text = 'Blue: Launch reconstruction on blue project only ';

            % Create FolderhierarchyLabel
            app.FolderhierarchyLabel = uilabel(app.HelpGlobalfolderPanel);
            app.FolderhierarchyLabel.FontAngle = 'italic';
            app.FolderhierarchyLabel.Position = [110 22 92 22];
            app.FolderhierarchyLabel.Text = 'Folder hierarchy';

            % Create NoteimagesandRAW_DATAfoldersshouldnotberenamedLabel
            app.NoteimagesandRAW_DATAfoldersshouldnotberenamedLabel = uilabel(app.HelpGlobalfolderPanel);
            app.NoteimagesandRAW_DATAfoldersshouldnotberenamedLabel.FontAngle = 'italic';
            app.NoteimagesandRAW_DATAfoldersshouldnotberenamedLabel.Position = [315 174 352 22];
            app.NoteimagesandRAW_DATAfoldersshouldnotberenamedLabel.Text = 'Note: ''images'' and ''RAW_DATA'' folders should not be renamed.';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = InterfaceAideGlobalFolderAlgoRIM

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end]]></w:t></w:r></w:p></w:body></w:document>