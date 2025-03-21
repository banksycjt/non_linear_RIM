<?xml version="1.0" encoding="UTF-8" standalone="no" ?><w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:body><w:p><w:pPr><w:pStyle w:val="code"/></w:pPr><w:r><w:t><![CDATA[classdef InterfaceConditionsOfUseAlgoRIM < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure              matlab.ui.Figure
        ConditionsofusePanel  matlab.ui.container.Panel
        TextArea              matlab.ui.control.TextArea
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [300 200 512 221];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.Scrollable = 'on';

            % Create ConditionsofusePanel
            app.ConditionsofusePanel = uipanel(app.UIFigure);
            app.ConditionsofusePanel.Title = 'Conditions of use:';
            app.ConditionsofusePanel.BackgroundColor = [1 1 1];
            app.ConditionsofusePanel.FontWeight = 'bold';
            app.ConditionsofusePanel.FontSize = 18;
            app.ConditionsofusePanel.Position = [1 1 512 221];

            % Create TextArea
            app.TextArea = uitextarea(app.ConditionsofusePanel);
            app.TextArea.Position = [7 13 500 170];
            app.TextArea.Value = {'You are free to use this software for research purposes only, but you must not transmit and distribute it without our consent (See contacts list on cell-rep-meth.rim-microscope.fr).'; ''; 'In addition, you undertake to include a citation (Mangeat et al., Super-resolved live-cell imaging using Random Illumination Microscopy, Cell Reports Methods, first issue 2021.) whenever you present or publish results that are based on it.'; ''; 'The CNRS makes no warranties of any kind on this software and shall in no event be liable for damages of any kind in connection with the use and exploitation of this technology.'; ''; 'More information on: cell-rep-meth.rim-microscope.fr'};

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = InterfaceConditionsOfUseAlgoRIM

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